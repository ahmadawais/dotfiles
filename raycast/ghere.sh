#!/usr/bin/env bash
#
# ghere — Ghostty Tab — opens Ghostty on the currently active macOS Space.
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title ghere
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 👻
# @raycast.packageName Window
# @raycast.description Open Ghostty on the active Space.

rect() { open -g "rectangle://execute-action?name=$1"; }

# --- Ghostty — right fourth 4/4 ---
open -na Ghostty
sleep 0.2
rect last-fourth
