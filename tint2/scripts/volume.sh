#!/bin/bash
# tint2 executor: volume level (PulseAudio/PipeWire via pactl)
sink="@DEFAULT_SINK@"

if pactl get-sink-mute "$sink" 2>/dev/null | grep -qi "yes"; then
    printf '\uf6a9  Muted'
    exit 0
fi

vol=$(pactl get-sink-volume "$sink" 2>/dev/null | grep -oP '\d+%' | head -1 | tr -d '%')
vol=${vol:-0}

if   (( vol >= 50 )); then icon='\uf028'
elif (( vol > 0 ));   then icon='\uf027'
else                       icon='\uf026'
fi

printf '%b  %s%%' "$icon" "$vol"
