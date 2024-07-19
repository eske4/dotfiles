#!/bin/bash

# Fetch all wallpapers in the folder
wpg -a ~/dotfiles/home/Wallpapers/*

# Get wallpaper name from waypaper parameter
WALLPAPER=$(basename "$1")

# If wallpaper is selected, set wallpaper and restart waybar
if [[ -n $WALLPAPER ]]; then
    wpg -s "$WALLPAPER" 

    # Send notification with a nice icon
    notify-send -t 6000 -i "$HOME/dotfiles/home/.config/icons/wallpaper.svg" "Wallpaper changed" "$(echo "$WALLPAPER")"
    # Restart waybar
    "$HOME/dotfiles/home/.config/waybar/launch-waybar.sh" "$WALLPAPER" &

fi

