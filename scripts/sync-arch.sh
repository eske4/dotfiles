#!/bin/bash
# 1. Capture the argument
PACKAGES_FILE="$1"

# 2. Check if the argument was provided and if the file exists
if [[ -z "$PACKAGES_FILE" ]]; then
    echo "Error: No package list path provided."
    echo "Usage: ./sync-arch.sh /path/to/packages.txt"
    exit 1
fi

if [[ ! -f "$PACKAGES_FILE" ]]; then
    echo "Error: Package list not found at: $PACKAGES_FILE"
    exit 1
fi

PACKAGES=$(grep -v '^#' "$PACKAGES_FILE" | xargs)

# 4. System Update & Base Tools
echo ":: Updating system and installing packages from repositories..."
pkexec pacman -Syu --needed --noconfirm base-devel git $PACKAGES

# 6. Zsh and Zap Framework
echo ":: Setting up Zsh and Zap..."
if [ ! -d "$HOME/.local/share/zap" ]; then
    # --keep ensures your dot_zshrc from Chezmoi isn't deleted
    zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep
fi

# 7. Default Shell Change
if command -v zsh &> /dev/null; then
    echo ":: Changing default shell to Zsh..."
    pkexec chsh -s "$(which zsh)" "$USER"
fi

if command -v xdg-user-dirs-update &> /dev/null; then
    echo ":: Updating standard folder structure..."
    xdg-user-dirs-update
fi


echo ":: Sync completed"
