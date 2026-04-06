#!/bin/bash
# Smart swap: swap in direction, or toggle split axis and retry
DIR=$1

# Try normal swap first
if yabai -m window --swap "$DIR" 2>/dev/null; then
    exit 0
fi

# Swap failed (no window in that direction) — toggle split and retry
yabai -m window --toggle split 2>/dev/null
yabai -m window --swap "$DIR" 2>/dev/null
exit 0
