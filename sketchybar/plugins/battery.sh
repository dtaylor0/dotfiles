#!/bin/bash
PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | head -1 | tr -d '%')
CHARGING=$(pmset -g batt | grep -c "AC Power")

if [ "$CHARGING" -gt 0 ]; then
  ICON="󰂄"
elif [ "$PERCENTAGE" -gt 80 ]; then
  ICON="󰁹"
elif [ "$PERCENTAGE" -gt 60 ]; then
  ICON="󰂀"
elif [ "$PERCENTAGE" -gt 40 ]; then
  ICON="󰁾"
elif [ "$PERCENTAGE" -gt 20 ]; then
  ICON="󰁻"
else
  ICON="󰁺"
fi

sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"
