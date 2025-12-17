# Mac Setup

> Automated macOS setup script for a fresh Mac installation. Installs apps, CLI tools, configures system preferences, and sets up the development environment.

## Quick Start

```bash
# Clone the repo
git clone https://github.com/ahmadawais/dotfiles.git
cd dotfiles

# Make executable and run
chmod +x mac-setup.sh
./mac-setup.sh
```

## What Gets Installed

### CLI Tools

| Tool | Description |
|------|-------------|
| `wget` | Network downloader |
| `bat` | Better `cat` with syntax highlighting |
| `mackup` | Backup app settings to cloud |
| `pv` | Pipe progress viewer |
| `jq` | JSON processor |
| `ffmpeg` | Media converter |
| `yt-dlp` | YouTube downloader |
| `composer` | PHP package manager |
| `gh` | GitHub CLI |
| `eza` | Modern `ls` replacement |

### Applications

#### Terminals
- **Ghostty** - GPU-accelerated terminal
- **iTerm2** - Feature-rich terminal

#### Browsers
- Google Chrome

#### Development
- Visual Studio Code + Insiders
- Postman
- Local (WordPress)
- GPG Suite

#### Productivity
- Raycast (launcher)
- Rectangle (window management)
- Maccy (clipboard manager)
- Dropbox

#### Communication
- Zoom
- Microsoft Teams
- Discord
- WhatsApp

#### Media
- VLC
- IINA
- ImageOptim
- WebTorrent

#### Utilities
- Mounty (NTFS support)
- Cursorcerer (auto-hide cursor)
- Macs Fan Control
- Cloudflare WARP
- Karabiner Elements
- OBS Studio
- Tunnelblick (VPN)

#### Pro Apps (Licensed)
- ScreenFlow
- Rocket
- ColorSnapper
- ForkLift
- Setapp

### Node.js Setup

- **n** - Node version manager
- Node.js LTS
- npm
- pnpm
- git-open (global package)

### Shell Setup

- Oh My Zsh
- zsh-autosuggestions plugin
- zsh-syntax-highlighting plugin
- Shades of Purple theme

### macOS Preferences

The script configures these system preferences:

#### Finder
- Allow quitting via Cmd+Q
- Show hidden files
- Show all file extensions
- Show path bar and status bar
- List view by default
- Folders on top when sorting

#### System
- Expanded save/print dialogs
- Fast key repeat rate
- Disabled auto-correct
- Tap to click enabled
- Auto-hide Dock (no delay)

#### Screenshots
- Saved to `~/Desktop/Screenshots`
- Shadows disabled

#### Apps
- Safari: Full URL + Developer menu
- TextEdit: Plain text mode
- Activity Monitor: Show all processes
- VLC: History cleared

## Post-Installation

After the script completes:

1. **Restart your Mac** to apply all system changes
2. **Configure zsh** - Add plugins to `~/.zshrc`:
   ```bash
   plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
   ZSH_THEME="shades-of-purple"
   ```
3. **Check manual.md** for:
   - License activation instructions
   - Manual app installations
   - Theme setup guides

## File Structure

```
dotfiles/
├── mac-setup.sh    # Main setup script
├── manual.md       # Post-install manual steps
├── readme.md       # This file
└── .zshrc          # Zsh configuration
```

## Customization

### Adding Apps

Add brew formulas or casks in the appropriate section:

```bash
# CLI tool
brew install tool-name

# GUI app
brew install --cask app-name
```

### Modifying Preferences

macOS defaults are in the "macOS PREFERENCES" section. Reference:
- https://macos-defaults.com/
- https://mths.be/macos

## Requirements

- macOS (tested on Ventura, Sonoma, Sequoia)
- Admin privileges (for sudo)
- Internet connection

## Compatibility

- **Intel Macs**: Full support
- **Apple Silicon (M1/M2/M3)**: Full support with automatic Homebrew path configuration

## Credits

Inspired by:
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [mths.be/macos](https://mths.be/macos)

## Author

**Ahmad Awais** - [@_AhmadAwais_](https://x.com/_AhmadAwais_)

## License

MIT
