#!/usr/bin/env bash
#
# ccode — opens Chrome (left ¼), VSCode (center ½), Ghostty (right ¼)
# on the currently active macOS Space, and starts `ccode` in the VSCode
# integrated terminal and Ghostty.
#
# Tiling is done via Rectangle's URL scheme: https://github.com/rxhanson/Rectangle
# Requires: Rectangle, Google Chrome, Visual Studio Code, Ghostty.
# Accessibility permission for whichever app runs this script (Raycast).
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title ccode
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🪟
# @raycast.packageName Window
# @raycast.description Open Chrome ¼ + VSCode ½ + Ghostty ¼ on the active Space, with ccode running.
# @raycast.argument1 { "type": "text", "placeholder": "VSCode folder (optional)", "optional": true }

set -u

VSCODE_DIR="${1:-$HOME/ccode}"

rect() { open -g "rectangle://execute-action?name=$1"; }
type_and_enter() {
  osascript \
    -e "tell application \"System Events\" to keystroke \"$1\"" \
    -e 'tell application "System Events" to key code 36'
}

# --- Chrome — left 1/4 ---
open -na "Google Chrome" --args --new-window "about:blank"
sleep 0.5
osascript -e 'tell application "Google Chrome" to activate'
sleep 0.2
# Toggle sidebar via Caps+B (Caps Lock remapped to Hyper = ⌘⌃⌥⇧)
osascript -e 'tell application "System Events" to key code 11 using {command down, control down, option down, shift down}'
rect first-fourth

# --- VSCode — center half ---
if [ -n "$VSCODE_DIR" ]; then
  open -na "Visual Studio Code" --args --new-window "$VSCODE_DIR"
else
  open -na "Visual Studio Code" --args --new-window
fi
sleep 1.0
rect center-half

# --- Ghostty — right fourth 4/4 ---
open -na Ghostty
sleep 0.8
rect last-fourth
type_and_enter "ccode"
