# Raycast Script Commands

Custom [Raycast](https://raycast.com) script commands.

## Setup (one time per Mac)

1. Clone this repo to `~/dotfiles` (the rest of `mac-setup.sh` does the apps).
2. Open **Raycast → Settings → Extensions → Script Commands → + Add Script Directory** and pick:
   ```
   ~/dotfiles/raycast
   ```
   Raycast walks subdirectories, so any `*.sh` under here with a `@raycast` metadata block is auto-discovered.
3. Grant Raycast Accessibility permission: **System Settings → Privacy & Security → Accessibility → enable Raycast**.

Both clicks are unavoidable — Raycast stores its watched-dir list in an encrypted SQLite DB, and Accessibility is TCC-protected by macOS. Neither can be scripted from outside.

After that, drop new scripts in here and they show up in Raycast automatically. No install step.

## Adding a new script

1. Create `your-thing.sh` (in this dir or a subdir like `projects/`).
2. Add the Raycast metadata block at the top:
   ```sh
   #!/usr/bin/env bash
   # @raycast.schemaVersion 1
   # @raycast.title Your Thing
   # @raycast.mode silent
   ```
3. `chmod +x your-thing.sh`.
4. Search "Your Thing" in Raycast.

## Scripts

### `projects/ccode.sh`

Opens three windows on the **currently active macOS Space**, tiled via [Rectangle](https://rectangleapp.com):

- **Chrome** — left ¼
- **VSCode** — center ½ (opens integrated terminal, runs `ccode`, defaults to `~/ccode`)
- **Ghostty** — right ¼ (runs `ccode`)

Search "ccode" in Raycast. Optionally type a folder path to override the default VSCode folder.

**Requires:** Rectangle, Google Chrome, Visual Studio Code, Ghostty.
