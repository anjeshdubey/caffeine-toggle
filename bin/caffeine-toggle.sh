#!/bin/bash
# Toggle indefinite caffeinate (prevents display + system sleep) on/off.
set -euo pipefail

PID_FILE="$HOME/.caffeine-toggle.pid"

notify() {
  osascript -e "display notification \"$1\" with title \"Caffeine\"" >/dev/null 2>&1 || true
}

if [[ -f "$PID_FILE" ]] && kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
  kill "$(cat "$PID_FILE")"
  rm -f "$PID_FILE"
  notify "Off — Mac can sleep again"
else
  rm -f "$PID_FILE"
  nohup caffeinate -di >/dev/null 2>&1 &
  echo $! > "$PID_FILE"
  disown
  notify "On — Mac will stay awake"
fi
