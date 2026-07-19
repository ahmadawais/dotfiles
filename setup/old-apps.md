Removed apps from @mac-setup.sh:

```sh

# SwitchResX - Advanced resolution control
# Docs: https://www.madrau.com/support/support.html
# License: search Gmail "switchresx"
if confirm "Install SwitchResX (resolution control)?"; then
    print_step "Installing SwitchResX..."
    brew install --cask switchresx
    print_success "SwitchResX installed"
fi

# Hazel - Automated file organization
# Docs: https://www.noodlesoft.com/manual/hazel/
# License: search Gmail "noodlesoft.com"
if confirm "Install Hazel (file automation)?"; then
    print_step "Installing Hazel..."
    brew install --cask hazel
    print_success "Hazel installed"
fi

```
