#!/bin/bash
MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)' 2>/dev/null)
if [ "$MIC_VOLUME" -eq 0 ] 2>/dev/null; then
  sketchybar --set "$NAME" icon="󰍭" label="Mute"
else
  sketchybar --set "$NAME" icon="󰍬" label="On"
fi
