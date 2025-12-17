#!/usr/bin/env bash

#===============================================================================
#
#   ███╗   ███╗ █████╗  ██████╗    ███████╗███████╗████████╗██╗   ██╗██████╗
#   ████╗ ████║██╔══██╗██╔════╝    ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗
#   ██╔████╔██║███████║██║         ███████╗█████╗     ██║   ██║   ██║██████╔╝
#   ██║╚██╔╝██║██╔══██║██║         ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝
#   ██║ ╚═╝ ██║██║  ██║╚██████╗    ███████║███████╗   ██║   ╚██████╔╝██║
#   ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝
#
#   Author: Ahmad Awais (https://x.com/_AhmadAwais)
#   License: MIT
#
#   Inspired by:
#   - https://github.com/mathiasbynens/dotfiles
#   - https://mths.be/macos
#   - https://gist.github.com/ahmadawais/1a9062ae4b95a583e1a2b66324e1f7dd
#
#   Usage:
#     chmod +x mac-setup.sh
#     ./mac-setup.sh
#
#===============================================================================

set -e  # Exit on error

#-------------------------------------------------------------------------------
# COLORS & HELPERS
#-------------------------------------------------------------------------------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

print_header() {
    echo ""
    echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${PURPLE}  $1${NC}"
    echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

print_step() {
    echo -e "${CYAN}→${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

#-------------------------------------------------------------------------------
# PREREQUISITES
#-------------------------------------------------------------------------------
print_header "Prerequisites"

# Close System Settings/Preferences to prevent conflicts with our changes
# macOS Ventura+ uses "System Settings", older versions use "System Preferences"
print_step "Closing System Settings..."
osascript -e 'tell application "System Settings" to quit' 2>/dev/null || true
osascript -e 'tell application "System Preferences" to quit' 2>/dev/null || true

# Request administrator password upfront
print_step "Requesting admin privileges (you may be prompted for password)..."
sudo -v

# Keep sudo alive for the duration of the script
# This background process refreshes the sudo timestamp every 60 seconds
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#-------------------------------------------------------------------------------
# DOTFILES
#-------------------------------------------------------------------------------
print_header "Dotfiles"

# Download custom .zshrc configuration
# This contains aliases, exports, and shell customizations
# Source: https://github.com/ahmadawais/dotfiles
print_step "Backing up existing .zshrc..."
if [ -f "$HOME/.zshrc" ]; then
	cp "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d%H%M%S)"
	print_success "Backed up existing .zshrc"
else
	print_warning "No existing .zshrc found"
fi

print_step "Downloading .zshrc from dotfiles repo..."
curl -fsSL https://raw.githubusercontent.com/ahmadawais/dotfiles/master/.zshrc -o "$HOME/.zshrc"
print_success "Downloaded .zshrc"


#-------------------------------------------------------------------------------
# HOMEBREW
# The missing package manager for macOS (or Linux)
# Docs: https://brew.sh/
# GitHub: https://github.com/Homebrew/brew
#-------------------------------------------------------------------------------
print_header "Homebrew Package Manager"

if ! command -v brew &> /dev/null; then
    print_step "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    print_success "Homebrew installed"
else
    print_success "Homebrew already installed"
fi

# Add Homebrew to PATH for Apple Silicon Macs
# On M1/M2/M3, Homebrew installs to /opt/homebrew instead of /usr/local
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    print_success "Configured Homebrew for Apple Silicon"
fi

# Ensure Homebrew is up to date
print_step "Updating Homebrew..."
brew update

print_step "Upgrading existing packages..."
brew upgrade

#-------------------------------------------------------------------------------
# CLI TOOLS
# Essential command-line utilities
#-------------------------------------------------------------------------------
print_header "CLI Tools"

# wget - Network downloader
# Docs: https://www.gnu.org/software/wget/manual/wget.html
print_step "Installing wget (network downloader)..."
brew install wget

# bat - A cat clone with syntax highlighting and Git integration
# Docs: https://github.com/sharkdp/bat
# Usage: bat README.md (instead of cat README.md)
print_step "Installing bat (better cat with syntax highlighting)..."
brew install bat

# mackup - Backup and sync application settings to cloud storage
# Docs: https://github.com/lra/mackup
# Usage: mackup backup / mackup restore
print_step "Installing mackup (app settings backup)..."
brew install mackup

# pv - Pipe Viewer: monitor data progress through a pipeline
# Docs: https://www.ivarch.com/programs/pv.shtml
# Usage: pv file.tar.gz | tar xzf -
print_step "Installing pv (pipe progress viewer)..."
brew install pv

# jq - Lightweight JSON processor
# Docs: https://stedolan.github.io/jq/manual/
# Usage: curl api.example.com | jq '.data'
print_step "Installing jq (JSON processor)..."
brew install jq

# ffmpeg - Complete solution for recording, converting, and streaming
# Docs: https://ffmpeg.org/documentation.html
# Usage: ffmpeg -i input.mp4 output.gif
print_step "Installing ffmpeg (media converter)..."
brew install ffmpeg

# yt-dlp - YouTube video/audio downloader (youtube-dl fork, actively maintained)
# Docs: https://github.com/yt-dlp/yt-dlp
# Usage: yt-dlp "https://youtube.com/watch?v=..."
print_step "Installing yt-dlp (YouTube downloader)..."
brew install yt-dlp

# composer - Dependency manager for PHP
# Docs: https://getcomposer.org/doc/
# Usage: composer install
print_step "Installing composer (PHP package manager)..."
brew install composer

# gh - GitHub's official CLI tool
# Docs: https://cli.github.com/manual/
# Usage: gh pr create, gh issue list, gh repo clone
print_step "Installing gh (GitHub CLI)..."
brew install gh

# eza - Modern replacement for ls (actively maintained fork of exa)
# Docs: https://github.com/eza-community/eza
# Usage: eza -la --icons
print_step "Installing eza (modern ls replacement)..."
brew install eza

print_success "All CLI tools installed"

#-------------------------------------------------------------------------------
# APPLICATIONS - Terminals
#-------------------------------------------------------------------------------
print_header "Terminal Applications"

# Ghostty - Fast, native terminal emulator
# Docs: https://ghostty.org/
# Config: ~/.config/ghostty/config
print_step "Installing Ghostty (GPU-accelerated terminal)..."
brew install --cask ghostty

# iTerm2 - macOS terminal replacement with tons of features
# Docs: https://iterm2.com/documentation.html
# Features: Split panes, search, autocomplete, 256 colors
print_step "Installing iTerm2 (feature-rich terminal)..."
brew install --cask iterm2

print_success "Terminal apps installed"

#-------------------------------------------------------------------------------
# APPLICATIONS - Browsers
#-------------------------------------------------------------------------------
print_header "Browsers"

# Google Chrome
# Download: https://www.google.com/chrome/
print_step "Installing Google Chrome..."
brew install --cask google-chrome

print_success "Browsers installed"

#-------------------------------------------------------------------------------
# APPLICATIONS - Development
#-------------------------------------------------------------------------------
print_header "Development Tools"

# Visual Studio Code - Code editor
# Docs: https://code.visualstudio.com/docs
# Extensions sync: Sign in with GitHub
print_step "Installing Visual Studio Code & insiders..."
brew install --cask visual-studio-code
brew install --cask visual-studio-code@insiders

# Postman - API development and testing
# Docs: https://learning.postman.com/docs/
print_step "Installing Postman (API testing)..."
brew install --cask postman

# Local by Flywheel - Local WordPress development
# Docs: https://localwp.com/help-docs/
print_step "Installing Local (WordPress dev environment)..."
brew install --cask local

# GPG Suite - Encryption and signing tools
# Docs: https://gpgtools.org/
# Note: Import key from ~/Dropbox/bin/gpg after install
print_step "Installing GPG Suite (encryption tools)..."
brew install --cask gpg-suite

print_success "Development tools installed"

#-------------------------------------------------------------------------------
# APPLICATIONS - Productivity
#-------------------------------------------------------------------------------
print_header "Productivity Apps"

# Raycast - Spotlight replacement with extensions
# Docs: https://manual.raycast.com/
# Extensions: https://www.raycast.com/store
print_step "Installing Raycast (launcher & productivity)..."
brew install --cask raycast

# Rectangle - Window management with keyboard shortcuts
# Docs: https://github.com/rxhanson/Rectangle
# Shortcuts: Ctrl+Opt+Arrow keys
print_step "Installing Rectangle (window management)..."
brew install --cask rectangle

# Maccy - Clipboard manager (lightweight, open source)
# Docs: https://github.com/p0deje/Maccy
# Usage: Cmd+Shift+C to open clipboard history
print_step "Installing Maccy (clipboard manager)..."
brew install --cask maccy

# Dropbox - Cloud storage and sync
# Docs: https://www.dropbox.com/help
print_step "Installing Dropbox..."
brew install --cask dropbox

print_success "Productivity apps installed"

#-------------------------------------------------------------------------------
# APPLICATIONS - Communication
#-------------------------------------------------------------------------------
print_header "Communication Apps"

# Zoom - Video conferencing
# Docs: https://support.zoom.us/
print_step "Installing Zoom..."
brew install --cask zoom

# Microsoft Teams
# Docs: https://support.microsoft.com/en-us/teams
print_step "Installing Microsoft Teams..."
brew install --cask microsoft-teams

# Discord - Chat for communities and gaming
# Docs: https://support.discord.com/
print_step "Installing Discord..."
brew install --cask discord

# WhatsApp Desktop
print_step "Installing WhatsApp..."
brew install --cask whatsapp

print_success "Communication apps installed"

#-------------------------------------------------------------------------------
# APPLICATIONS - Media
#-------------------------------------------------------------------------------
print_header "Media Apps"

# VLC - Universal media player
# Docs: https://wiki.videolan.org/Documentation:Documentation/
print_step "Installing VLC (media player)..."
brew install --cask vlc

# IINA - Modern media player for macOS
# Docs: https://iina.io/
print_step "Installing IINA (modern media player)..."
brew install --cask iina

# ImageOptim - Image compression
# Docs: https://imageoptim.com/howto.html
print_step "Installing ImageOptim (image compression)..."
brew install --cask imageoptim

# WebTorrent - Streaming torrent client
# Docs: https://webtorrent.io/desktop/
print_step "Installing WebTorrent..."
brew install --cask webtorrent

print_success "Media apps installed"

#-------------------------------------------------------------------------------
# APPLICATIONS - Utilities
#-------------------------------------------------------------------------------
print_header "Utility Apps"

# Mounty - Remount NTFS drives with write support
# Docs: https://mounty.app/
print_step "Installing Mounty (NTFS write support)..."
brew install --cask mounty

# Cursorcerer - Hide cursor when typing
# Docs: https://doomlaser.com/cursorcerer-hide-your-cursor-at-will/
print_step "Installing Cursorcerer (auto-hide cursor)..."
brew install --cask cursorcerer

# Macs Fan Control - Monitor and control fans
# Docs: https://crystalidea.com/macs-fan-control
print_step "Installing Macs Fan Control..."
brew install --cask macs-fan-control

# Cloudflare WARP - VPN and DNS
# Docs: https://developers.cloudflare.com/warp-client/
print_step "Installing Cloudflare WARP (VPN)..."
brew install --cask cloudflare-warp

# Karabiner Elements - Keyboard customization
# Docs: https://karabiner-elements.pqrs.org/docs/
# Configs: https://ke-complex-modifications.pqrs.org/
print_step "Installing Karabiner Elements (keyboard remapping)..."
brew install --cask karabiner-elements

# OBS Studio - Streaming and recording
# Docs: https://obsproject.com/wiki/
print_step "Installing OBS (streaming software)..."
brew install --cask obs

print_success "Utility apps installed"

#-------------------------------------------------------------------------------
# APPLICATIONS - Optional
#-------------------------------------------------------------------------------
print_header "Optional Apps"

# Tunnelblick - OpenVPN client
# Docs: https://tunnelblick.net/documents.html
print_step "Installing Tunnelblick (VPN client)..."
brew install --cask tunnelblick

print_success "Optional apps installed"

#-------------------------------------------------------------------------------
# NODE.JS SETUP
# Using 'n' for Node version management (simpler than nvm)
# Docs: https://github.com/tj/n
#-------------------------------------------------------------------------------
print_header "Node.js Setup"

# Install n - Node version manager
# Simpler alternative to nvm
print_step "Installing n (Node version manager)..."
brew install n

# Create required directories and set ownership
# This allows n to install Node without sudo
print_step "Setting up Node directories..."
sudo mkdir -p /usr/local/n
sudo chown -R "$(whoami)" /usr/local/n
sudo mkdir -p /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
sudo chown -R "$(whoami)" /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share

# Install latest LTS version of Node
# LTS = Long Term Support (stable, recommended for production)
print_step "Installing Node.js LTS..."
n lts

# Install npm (n doesn't include npm by default)
# Docs: https://docs.npmjs.com/
print_step "Installing npm..."
curl -qL https://www.npmjs.com/install.sh | sh

# Verify installation
print_step "Verifying Node installation..."
echo "  Node: $(which node) - $(node --version)"
echo "  npm:  $(which npm) - $(npm --version)"

# Install pnpm - Fast, disk space efficient package manager
# Docs: https://pnpm.io/motivation
# Usage: pnpm install (instead of npm install)
print_step "Installing pnpm (fast package manager)..."
npm install -g pnpm@latest

# Global npm packages
# git-open - Open the GitHub page for your repo
# Docs: https://github.com/paulirish/git-open
# Usage: git open (opens repo in browser)
print_step "Installing global npm packages..."
npm install --global git-open

print_success "Node.js setup complete"

#-------------------------------------------------------------------------------
# ZSH & OH MY ZSH
# A delightful framework for managing your zsh configuration
# Docs: https://ohmyz.sh/
# GitHub: https://github.com/ohmyzsh/ohmyzsh
#-------------------------------------------------------------------------------
print_header "Shell Setup (Oh My Zsh)"

# Install Oh My Zsh
# Note: This will change your default shell to zsh
print_step "Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    print_success "Oh My Zsh installed"
else
    print_success "Oh My Zsh already installed"
fi

# zsh-autosuggestions - Fish-like autosuggestions
# Docs: https://github.com/zsh-users/zsh-autosuggestions
# Shows suggestions based on command history as you type
print_step "Installing zsh-autosuggestions plugin..."
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
fi

# zsh-syntax-highlighting - Fish-like syntax highlighting
# Docs: https://github.com/zsh-users/zsh-syntax-highlighting
# Highlights valid commands in green, errors in red
print_step "Installing zsh-syntax-highlighting plugin..."
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
fi

# Shades of Purple theme for Zsh
# Docs: https://github.com/ahmadawais/shades-of-purple-iterm2
# Full setup: https://ShadesOfPurple.pro/more
print_step "Installing Shades of Purple Zsh theme..."
curl -fsSL -o "$HOME/.oh-my-zsh/themes/shades-of-purple.zsh-theme" \
    https://raw.githubusercontent.com/ahmadawais/shades-of-purple-iterm2/master/shades-of-purple.zsh-theme

print_success "Shell setup complete"
print_warning "Add these plugins to ~/.zshrc: plugins=(git zsh-autosuggestions zsh-syntax-highlighting)"

#-------------------------------------------------------------------------------
# macOS PREFERENCES
# System-level customizations via defaults command
# Docs: https://macos-defaults.com/
# Reference: https://mths.be/macos
#-------------------------------------------------------------------------------
print_header "macOS Preferences"

# Finder: Allow quitting via ⌘ + Q
print_step "Enabling Finder quit option..."
defaults write com.apple.finder QuitMenuItem -bool true

# Finder: Show hidden files
print_step "Showing hidden files in Finder..."
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: Show all file extensions
print_step "Showing all file extensions..."
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: Show path bar at bottom
print_step "Showing path bar in Finder..."
defaults write com.apple.finder ShowPathbar -bool true

# Finder: Show status bar
print_step "Showing status bar in Finder..."
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: Default to list view
# Four-letter codes: icnv (icon), clmv (column), Flwv (cover flow), Nlsv (list)
print_step "Setting Finder default view to list..."
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder: Keep folders on top when sorting by name
print_step "Keeping folders on top in Finder..."
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Save dialogs: Expand by default
print_step "Expanding save dialogs by default..."
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Print dialogs: Expand by default
print_step "Expanding print dialogs by default..."
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Keyboard: Set a blazingly fast keyboard repeat rate
print_step "Setting fast key repeat rate..."
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Keyboard: Disable auto-correct
print_step "Disabling auto-correct..."
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Trackpad: Enable tap to click
print_step "Enabling tap to click..."
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Dock: Automatically hide and show
print_step "Setting Dock to auto-hide..."
defaults write com.apple.dock autohide -bool true

# Dock: Remove auto-hide delay
print_step "Removing Dock auto-hide delay..."
defaults write com.apple.dock autohide-delay -float 0

# Screenshots: Save to Desktop/Screenshots folder
print_step "Setting screenshot location..."
mkdir -p "$HOME/Desktop/Screenshots"
defaults write com.apple.screencapture location -string "$HOME/Desktop/Screenshots"

# Screenshots: Disable shadow in screenshots
print_step "Disabling screenshot shadows..."
defaults write com.apple.screencapture disable-shadow -bool true

# Safari: Show full URL in address bar
print_step "Showing full URL in Safari..."
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Safari: Enable developer menu
print_step "Enabling Safari developer menu..."
defaults write com.apple.Safari IncludeDevelopMenu -bool true

# TextEdit: Use plain text mode by default
print_step "Setting TextEdit to plain text..."
defaults write com.apple.TextEdit RichText -int 0

# Activity Monitor: Show all processes
print_step "Showing all processes in Activity Monitor..."
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Restart affected apps
print_step "Restarting Finder and Dock to apply changes..."
killall Finder 2>/dev/null || true
killall Dock 2>/dev/null || true

print_success "macOS preferences configured"

#-------------------------------------------------------------------------------
# UTILITY: CLEAR VLC HISTORY
# Removes recent play history from VLC for privacy
#-------------------------------------------------------------------------------
print_header "Clearing VLC History"

print_step "Clearing VLC recent play history..."
defaults write org.videolan.vlc NSRecentDocumentsLimit 0
defaults delete org.videolan.vlc.LSSharedFileList RecentDocuments 2>/dev/null || true
defaults write org.videolan.vlc.LSSharedFileList RecentDocuments -dict-add MaxAmount 0

print_success "VLC history cleared"

#-------------------------------------------------------------------------------
# PRO APPS (Paid/Licensed Software)
# These apps require licenses
#-------------------------------------------------------------------------------
print_header "Pro Apps"

# ScreenFlow - Screen recording and video editing
# Docs: https://www.telestream.net/screenflow/resources.htm
# License: search Gmail "Telestream Desktop product"
print_step "Installing ScreenFlow (screen recording)..."
brew install --cask screenflow

# Rocket Pro - Quick emoji picker (Slack-style :emoji: shortcuts)
# Docs: https://matthewpalmer.net/rocket/
# License: search Gmail "Rocket Pro"
print_step "Installing Rocket (emoji picker)..."
brew install --cask rocket

# ColorSnapper - Color picker for designers
# Docs: https://colorsnapper.com/
# License: search Gmail "Koole Sache Purchases"
print_step "Installing ColorSnapper (color picker)..."
brew install --cask colorsnapper

# ForkLift - Dual-pane file manager and FTP client
# Docs: https://binarynights.com/manual
print_step "Installing ForkLift (file manager)..."
brew install --cask forklift

# Setapp - Subscription app service (100+ mac apps)
# Docs: https://setapp.com/apps
print_step "Installing Setapp (app subscription service)..."
brew install --cask setapp

print_success "Pro apps installed"

#-------------------------------------------------------------------------------
# CLEANUP
#-------------------------------------------------------------------------------
print_header "Cleanup"

print_step "Cleaning up Homebrew cache..."
brew cleanup

print_step "Removing outdated versions..."
brew autoremove

print_success "Cleanup complete"

#-------------------------------------------------------------------------------
# COMPLETION
#-------------------------------------------------------------------------------
print_header "Setup Complete!"

echo ""
echo -e "${GREEN}Automated setup finished successfully!${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Restart your Mac to apply all system changes"
echo "  2. Open Terminal/iTerm and verify zsh plugins are working"
echo "  3. Check manual.md for:"
echo "     - License activation instructions"
echo "     - Manual app installations"
echo "     - Theme setup guides"
echo "     - GPG configuration"
echo ""
echo -e "${CYAN}cat manual.md${NC} to view the manual steps"
echo ""
