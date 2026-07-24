#!/bin/bash
# Report whether the caffeine toggle is currently active.
set -euo pipefail

PID_FILE="$HOME/.caffeine-toggle.pid"

if [[ -f "$PID_FILE" ]] && kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
  echo "on (pid $(cat "$PID_FILE"))"
else
  echo "off"
fi
