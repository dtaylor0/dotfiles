#!/bin/bash
# Focus space N, creating spaces as needed, then prune empty trailing spaces
# Usage: space-focus.sh <number> [move]
TARGET=$1
ACTION=$2
CURRENT=$(yabai -m query --spaces | jq 'length')

while [ "$CURRENT" -lt "$TARGET" ]; do
    yabai -m space --create
    CURRENT=$((CURRENT + 1))
done

if [ "$ACTION" = "move" ]; then
    yabai -m window --space "$TARGET"
    yabai -m space --focus "$TARGET"
else
    yabai -m space --focus "$TARGET"
fi

# Prune empty trailing spaces
# Keep spaces up to max(active space, highest space with windows)
SPACES_JSON=$(yabai -m query --spaces)
TOTAL=$(echo "$SPACES_JSON" | jq 'length')
MAX_OCCUPIED=$(echo "$SPACES_JSON" | jq '[.[] | select(.windows | length > 0)] | max_by(.index) // {index: 0} | .index')
KEEP=$(( TARGET > MAX_OCCUPIED ? TARGET : MAX_OCCUPIED ))

# Destroy spaces from the end, working backwards
i=$TOTAL
while [ "$i" -gt "$KEEP" ]; do
    yabai -m space --destroy "$i"
    i=$((i - 1))
done
