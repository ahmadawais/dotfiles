# Manual Setup Steps

After running `mac-setup.sh`, complete these manual steps.

## Licenses to Activate

Search Gmail for the license keys:

| App | Gmail Search |
|-----|--------------|
| ScreenFlow | `Telestream Desktop product` |
| Rocket Pro | `Rocket Pro` |
| ColorSnapper | `Koole Sache Purchases` |
| ForkLift | `binarynights` |

## Manual Installations

### TextExpander 5.1.6
- Download: https://cdn.textexpander.com/mac/TextExpander_5.1.6.zip
- License: search Gmail `TextExpander`

### Alfred 3 (if not using Raycast)
- Download: https://www.alfredapp.com/help/v3/
- License: search Gmail `alfredapp`

### Audio Hijack
- License: search Gmail `Rogue Amoeba`

### HexColor (color picker)
- App Store: https://apps.apple.com/pk/app/hexcolor/id446103121?mt=12

## Theme Setup

### iTerm2
1. Open iTerm2 > Preferences > Profiles
2. Import Shades of Purple profile
3. Guide: https://github.com/ahmadawais/shades-of-purple-iterm2

### Ghostty
Config file: `~/.config/ghostty/config`

### Fonts
- Install Operator Mono: https://www.typography.com/fonts/operator/overview

### All Shades of Purple Themes
- https://ShadesOfPurple.pro/more

## GPG Setup

1. Open GPG Keychain
2. Import key from: `~/Dropbox/bin/gpg`

## ScreenFlow Shortcuts

Preferences > Shortcuts > Import > Dropbox > Recording Setup

## Zsh Configuration

After running the setup, add these plugins to `~/.zshrc`:

```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

Set the theme:
```bash
ZSH_THEME="shades-of-purple"
```
