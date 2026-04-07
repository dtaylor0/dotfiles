#!/bin/bash
USED=$(vm_stat 2>/dev/null | awk '
  /page size/    { ps = $8 }
  /Pages active/ { a = $3+0 }
  /Pages wired/  { w = $4+0 }
  /compressor/   { c = $5+0 }
  END { printf "%.1f", (a + w + c) * ps / 1073741824 }
')
TOTAL=$(sysctl -n hw.memsize 2>/dev/null | awk '{printf "%.0f", $1 / 1073741824}')
sketchybar --set "$NAME" label="${USED}/${TOTAL}G"
