#!/usr/bin/env bash
#
# ao — AA Open — opens Chrome (left ¼), VSCode (center ½), Ghostty (right ¼)
# on the currently active macOS Space, at the specified project path.
#
# Tiling is done via Rectangle's URL scheme: https://github.com/rxhanson/Rectangle
# Requires: Rectangle, Google Chrome, Visual Studio Code, Ghostty.
# Accessibility permission for whichever app runs this script (Raycast).
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title ao
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🔨
# @raycast.packageName Window
# @raycast.description Open Chrome ¼ + VSCode ½ + Ghostty ¼ at project path on the active Space.
# @raycast.argument1 { "type": "text", "placeholder": "Project path (or symlink)", "optional": false }

set -u

PROJECT_PATH="${1:-}"

if [ -z "$PROJECT_PATH" ]; then
  echo "Error: Project path is required"
  exit 1
fi

# Expand ~/ to $HOME and handle relative paths
if [[ "$PROJECT_PATH" == ~/* ]]; then
  PROJECT_PATH="${PROJECT_PATH/#\~/$HOME}"
elif [[ "$PROJECT_PATH" != /* ]]; then
  PROJECT_PATH="$HOME/$PROJECT_PATH"
fi

# Resolve symlink to actual path if needed
if [ -L "$PROJECT_PATH" ]; then
  PROJECT_PATH="$(readlink -f "$PROJECT_PATH")"
fi

rect() { open -g "rectangle://execute-action?name=$1"; }
type_and_enter() {
  osascript \
    -e "tell application \"System Events\" to keystroke \"$1\"" \
    -e 'tell application "System Events" to key code 36'
}

# --- Chrome — left 1/4 ---
open -na "Google Chrome" --args --new-window "about:blank"
sleep 0.2
rect first-fourth

# --- VSCode — center half ---
open -na "Visual Studio Code" --args --new-window "$PROJECT_PATH"
sleep 0.4
rect center-half

# --- Ghostty — right fourth 4/4 ---
open -na Ghostty
sleep 0.2
rect last-fourth
type_and_enter "cd $PROJECT_PATH"
