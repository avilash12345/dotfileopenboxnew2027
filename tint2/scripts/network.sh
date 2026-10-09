#!/bin/bash
# tint2 executor: network up/down speed on the default-route interface
STATE="${TMPDIR:-/tmp}/tint2_net.$USER"

iface=$(ip -o route get 1.1.1.1 2>/dev/null | grep -oP 'dev \K\S+' | head -1)
if [[ -z "$iface" ]]; then
    rm -f "$STATE"
    printf '\uf127 Offline'
    exit 0
fi

read -r rx tx < <(awk -v i="$iface" -F'[: ]+' '$2 == i { print $3, $11 }' /proc/net/dev)
[[ -z "$rx" ]] && { printf '\uf127 Offline'; exit 0; }

now=$(date +%s)
rx_rate=0
tx_rate=0
if [[ -r "$STATE" ]]; then
    read -r p_time p_rx p_tx < "$STATE"
    dt=$((now - p_time))
    if (( dt > 0 )); then
        rx_rate=$(( (rx - p_rx) / dt ))
        tx_rate=$(( (tx - p_tx) / dt ))
        (( rx_rate < 0 )) && rx_rate=0
        (( tx_rate < 0 )) && tx_rate=0
    fi
fi
printf '%d %d %d\n' "$now" "$rx" "$tx" > "$STATE"

fmt() {
    awk -v b="$1" 'BEGIN {
        if (b >= 1048576) printf "%.1fM", b / 1048576
        else if (b >= 1024) printf "%.0fK", b / 1024
        else printf "%dB", b
    }'
}

printf '\uf063 %s \uf062 %s' "$(fmt "$rx_rate")" "$(fmt "$tx_rate")"
