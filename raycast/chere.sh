#!/usr/bin/env bash
#
# chere — VSCode Here — opens VSCode on the currently active macOS Space.
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title chere
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon �‍💻
# @raycast.packageName Window
# @raycast.description Open VSCode on the active Space.

rect() { open -g "rectangle://execute-action?name=$1"; }

# --- Chrome — left 1/4 ---
open -na "Google Chrome" --args --new-window "about:blank"
sleep 0.2
rect first-fourth
