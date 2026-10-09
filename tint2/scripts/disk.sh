#!/bin/bash
# tint2 executor: root filesystem usage percentage
pct=$(df --output=pcent / 2>/dev/null | awk 'NR==2 { gsub(/[ %]/, ""); print }')
printf '\uf0a0 %s%%' "${pct:-?}"
