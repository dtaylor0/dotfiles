#!/bin/bash

# Extract space index from item name (space.N -> N)
SID="${NAME#space.}"

FONT="Atkynson Mono Nerd Font"

if [ "$SELECTED" = "true" ]; then
  # Active: swap background/foreground - light bg, dark text
  sketchybar --set "$NAME" background.color=0xffe0def4 icon.color=0xff191724 icon.font="$FONT:Bold:13.0"
else
  # Check if this space has windows
  HAS_WINDOWS=$(yabai -m query --spaces --space "$SID" 2>/dev/null | jq '.windows | length > 0')
  if [ "$HAS_WINDOWS" = "true" ]; then
    sketchybar --set "$NAME" background.color=0xff191724 icon.color=0xffe0def4 icon.font="$FONT:Bold:13.0"
  else
    sketchybar --set "$NAME" background.color=0xff191724 icon.color=0xff6e6a86 icon.font="$FONT:Regular:13.0"
  fi
fi
