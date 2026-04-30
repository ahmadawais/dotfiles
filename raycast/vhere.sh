#!/usr/bin/env bash
#
# vhere — VSCode Here — opens VSCode on the currently active macOS Space.
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title vhere
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon �‍💻
# @raycast.packageName Window
# @raycast.description Open VSCode on the active Space.

rect() { open -g "rectangle://execute-action?name=$1"; }

# --- VSCode — center half ---
open -na "Visual Studio Code" --args --new-window
sleep 0.4
rect center-half
