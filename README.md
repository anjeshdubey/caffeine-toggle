# caffeine-toggle

A tiny personal replacement for the old Caffeine app: one script toggles
indefinite `caffeinate` (blocks display + system sleep) on and off, with a
macOS notification so you know the current state. No menu-bar UI, no
background daemon polling — just two scripts.

## Usage

```
bin/caffeine-toggle.sh   # flips on <-> off
bin/caffeine-status.sh   # prints "on (pid N)" or "off"
```

State is tracked via a pid file at `~/.caffeine-toggle.pid`.

## Bind it to a keyboard shortcut

Easiest path on modern macOS (Ventura+): Shortcuts app.

1. Open **Shortcuts** → new shortcut → add action **Run Shell Script**.
2. Set shell to `/bin/bash`, script to:
   ```
   /Users/anjeshdubey/projects/caffeine-toggle/bin/caffeine-toggle.sh
   ```
3. Name it "Toggle Caffeine".
4. In the shortcut's details (info button), enable **Add to Quick Actions** /
   pin it, then go to **System Settings → Keyboard → Keyboard Shortcuts →
   Services** (or **App Shortcuts**) and assign a key combo, e.g. `⌃⌥⌘C`.

Alternative: if you use Raycast, Alfred, or BetterTouchTool, just point a
custom command/hotkey at `bin/caffeine-toggle.sh` directly — no Shortcuts
app needed.

## Notes

- Requires no install/dependencies — uses the built-in `caffeinate` binary.
- Safe to spam: running the toggle twice in a row turns it on then off.
- If your Mac restarts, any active `caffeinate` process dies with it (state
  resets to "off"), which matches the original Caffeine app's behavior.
