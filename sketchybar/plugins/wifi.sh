#!/bin/bash
SSID=$(ipconfig getsummary en0 2>/dev/null | awk -F' : ' '/^ *SSID/{print $2}')
if [ -z "$SSID" ]; then
  sketchybar --set "$NAME" icon="󰖪" label="Off"
elif [ "$SSID" = "<redacted>" ]; then
  sketchybar --set "$NAME" icon="󰖩" label="On"
else
  sketchybar --set "$NAME" icon="󰖩" label="$SSID"
fi
