#!/bin/bash

# Set the WALLPAPER variable to the provided argument
WALLPAPER="$1"

# kill waybar process
killall waybar
sleep 0.2

#Update the color schemes
cp -f ~/.cache/wal/colors-tofi.conf "$HOME"/dotfiles/home/.config/tofi/config
cp -f ~/.cache/wal/colors-hyprland.conf "$HOME"/dotfiles/home/.config/hypr/conf/colors-hyprland.conf
cp -f ~/.cache/wal/colors-waybar.css "$HOME"/dotfiles/home/.config/waybar/colors-waybar.css
pywal-discord -d "$WALLPAPER" &
pywal-discord -t default &
pywalfox update &

# Start waybar again
waybar -c "$HOME/dotfiles/home/.config/waybar/config.jsonc"  -s "$HOME/dotfiles/home/.config/waybar/styles.css" &
