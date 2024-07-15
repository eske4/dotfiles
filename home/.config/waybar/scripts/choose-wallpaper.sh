#!/bin/bash

# Fetch all wallpapers in the folder
wpg -a ~/dotfiles/home/Wallpapers/*

# Select wallpaper from tofi menu
WALLPAPER=$(wpg -l | tofi --prompt-text "Select Wallpaper:")

# If wallpaper is selected, set wallpaper and restart waybar
if [[ -n $WALLPAPER ]]; then
    wpg -s "$WALLPAPER" 
    sleep 0.5

    swww img "$HOME"/dotfiles/home/.config/wpg/.current"" --transition-duration 0.1 --transition-step 2 --transition-fps 144 &


    # Send notification with a nice icon
    notify-send -t 6000 -i "$HOME/dotfiles/home/.config/icons/wallpaper.svg" "Wallpaper changed" "$(echo "$WALLPAPER")"
    # Restart waybar
    "$HOME/dotfiles/home/.config/waybar/launch-waybar.sh" "$WALLPAPER" &
fi
