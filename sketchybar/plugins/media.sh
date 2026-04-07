#!/bin/bash
SCROLL_WIDTH=35
STATE_FILE="/tmp/sketchybar_media_scroll"

MUSIC_RUNNING=$(osascript -e '
tell application "System Events"
  return exists process "Music"
end tell
' 2>/dev/null)

if [ "$MUSIC_RUNNING" != "true" ]; then
  sketchybar --set "$NAME" drawing=off
  rm -f "$STATE_FILE"
  exit 0
fi

NOW_PLAYING=$(osascript -e '
tell application "Music"
  if player state is playing then
    return (artist of current track) & " – " & (name of current track)
  end if
end tell
' 2>/dev/null)

if [ -z "$NOW_PLAYING" ]; then
  sketchybar --set "$NAME" drawing=off
  rm -f "$STATE_FILE"
  exit 0
fi

# Read previous state
PREV_TEXT=""
OFFSET=0
if [ -f "$STATE_FILE" ]; then
  PREV_TEXT=$(sed -n '1p' "$STATE_FILE")
  OFFSET=$(sed -n '2p' "$STATE_FILE")
fi

# Reset offset if song changed
if [ "$NOW_PLAYING" != "$PREV_TEXT" ]; then
  OFFSET=0
fi

LEN=${#NOW_PLAYING}
if [ "$LEN" -le "$SCROLL_WIDTH" ]; then
  DISPLAY="$NOW_PLAYING"
else
  # Pad with spaces for smooth wrap-around
  PADDED="$NOW_PLAYING    $NOW_PLAYING"
  DISPLAY="${PADDED:$OFFSET:$SCROLL_WIDTH}"
  OFFSET=$(( (OFFSET + 4) % (LEN + 4) ))
fi

# Save state
printf '%s\n%d\n' "$NOW_PLAYING" "$OFFSET" > "$STATE_FILE"

sketchybar --set "$NAME" drawing=on label="$DISPLAY"
