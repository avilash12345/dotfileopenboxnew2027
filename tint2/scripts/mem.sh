#!/bin/bash
# tint2 executor: memory usage percentage
pct=$(awk '/^MemTotal:/ { t = $2 } /^MemAvailable:/ { a = $2 } END { printf "%.0f", (t - a) * 100 / t }' /proc/meminfo)
printf '\U000f035b %s%%' "$pct"
