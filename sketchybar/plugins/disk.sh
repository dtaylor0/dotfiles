#!/bin/bash
USED=$(df -H / 2>/dev/null | awk 'NR==2{print $5}')
sketchybar --set "$NAME" label="$USED"
