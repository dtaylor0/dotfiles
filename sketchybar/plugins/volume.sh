#!/bin/bash
MUTED=$(osascript -e 'output muted of (get volume settings)')
VOL=$(osascript -e 'output volume of (get volume settings)')
if [ "$MUTED" = "true" ]; then
  ICON="󰖁"
  sketchybar --set "$NAME" icon="$ICON" label="Mute"
else
  if [ "$VOL" -lt 33 ]; then
    ICON="󰕿"
  elif [ "$VOL" -lt 66 ]; then
    ICON="󰖀"
  else
    ICON="󰕾"
  fi
  sketchybar --set "$NAME" icon="$ICON" label="${VOL}%"
fi
