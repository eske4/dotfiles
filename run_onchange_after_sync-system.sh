#!/bin/bash
set -e

# --- CHEZMOI HASH TRACKING ---
# Changes to these files will automatically trigger this script:
# pkglist hash: {{ include "dotfiles/pkglist.txt" | sha256sum }}
# services hash: {{ include "dotfiles/services.txt" | sha256sum }}

echo "==> Starting system sync workflow..."

# ---------------------------------------------------------
# STEP 1: Check and Setup CachyOS Repository
# ---------------------------------------------------------
if ! grep -q "\[cachyos\]" /etc/pacman.conf; then
    echo "==> CachyOS repo not found. Setting it up..."
    
    # Download and execute the official CachyOS repo setup installer
    cd /tmp
    curl -O https://mirror.cachyos.org/cachyos-repo.tar.xz
    tar xvf cachyos-repo.tar.xz
    cd cachyos-repo
    sudo ./cachyos-repo.sh --install
    cd ~
    
    echo "==> CachyOS repository added successfully."
else
    echo "==> CachyOS repository already configured."
fi

# ---------------------------------------------------------
# STEP 2: Install Missing Packages
# ---------------------------------------------------------
echo "==> Syncing packages from manifest..."

# Update databases first
sudo pacman -Syu --noconfirm

# Read your chezmoi-managed package file and install any missing packages
if [ -f "$HOME/.config/dotfiles/pkglist.txt" ]; then
    # --needed ensures it skips packages that are already installed
    sudo pacman -S --needed --noconfirm - < "$HOME/.config/dotfiles/pkglist.txt"
else
    echo "Warning: Package list file not found at ~/.config/dotfiles/pkglist.txt"
fi

# ---------------------------------------------------------
# STEP 3: Setup and Reapply System Services
# ---------------------------------------------------------
echo "==> Syncing systemd services..."

if [ -f "$HOME/.config/dotfiles/services.txt" ]; then
    while IFS= read -r service; do
        # Skip empty lines or comments
        [[ -z "$service" || "$service" =~ ^# ]] && continue

        echo "Ensuring service is active and enabled: $service"
        sudo systemctl enable --now "$service"
    done < "$HOME/.config/dotfiles/services.txt"
else
    echo "Warning: Services list file not found at ~/.config/dotfiles/services.txt"
fi

echo "==> System sync complete!"
