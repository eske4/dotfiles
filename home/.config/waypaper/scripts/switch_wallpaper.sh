#!/bin/bash

# Set the WALLPAPER variable to the provided argument
WALLPAPER=$(basename "$1")

if [[ -n $WALLPAPER ]]; then

    # Generate colorscheme
    wpg -s "$WALLPAPER" 


    # kill waybar process
    killall waypaper
    killall waybar
    sleep 0.2

    # Apply colorscheme
    cp -f ~/.cache/wal/colors-tofi.conf "$HOME"/dotfiles/home/.config/tofi/config
    cp -f ~/.cache/wal/colors-hyprland.conf "$HOME"/dotfiles/home/.config/hypr/conf/colors-hyprland.conf
    cp -f ~/.cache/wal/colors-waybar.css "$HOME"/dotfiles/home/.config/waybar/colors-waybar.css
    cp -f ~/.cache/wal/colors-swaync.css "$HOME"/dotfiles/home/.config/swaync/colors-swaync.css
    cp -f ~/.cache/wal/colors-wlogout.css "$HOME"/dotfiles/home/.config/wlogout/colors-wlogout.css
    pywal-discord -d "$WALLPAPER" &
    pywal-discord -t default &
    pywalfox update &

    # Switch Hyprlock and sddm background
    
    if [[ "$1" == *.jpg || "$1" == *.png ]]; then
        cp -r "$HOME/dotfiles/home/.config/wpg/.current" "$HOME/dotfiles/home/Wallpapers/.current"
        cp -r "$1" "$HOME/dotfiles/home/.config/sddm/sugar-dark/default.png"
    fi


    # Start waybar again
    waybar -c "$HOME/dotfiles/home/.config/waybar/config.jsonc"  -s "$HOME/dotfiles/home/.config/waybar/styles.css" &
    swaync-client -rs

    notify-send -t 6000 -i "$HOME/dotfiles/home/.config/icons/wallpaper.svg" "Wallpaper changed" "$(echo "$WALLPAPER")"
fi
