#!/bin/bash
# tint2 executor: CPU usage percentage
STATE="${TMPDIR:-/tmp}/tint2_cpu.$USER"

read -r _ user nice system idle iowait irq softirq steal _ < /proc/stat
total=$((user + nice + system + idle + iowait + irq + softirq + steal))
idle_all=$((idle + iowait))

usage=0
if [[ -r "$STATE" ]]; then
    read -r prev_total prev_idle < "$STATE"
    dt=$((total - prev_total))
    di=$((idle_all - prev_idle))
    (( dt > 0 )) && usage=$(( (100 * (dt - di) + dt / 2) / dt ))
fi
printf '%d %d\n' "$total" "$idle_all" > "$STATE"

printf '\uf2db %d%%' "$usage"
