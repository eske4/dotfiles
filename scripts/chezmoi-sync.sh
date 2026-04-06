#!/bin/bash

# 1. Environment fixes for Hyprland
export PATH=$PATH:$HOME/.local/bin:/usr/bin:/usr/local/bin

CHEZMOI_DIR="$HOME/.local/share/chezmoi"

while true; do
    if [ -d "$CHEZMOI_DIR" ]; then
        cd "$CHEZMOI_DIR" || exit
        
        # Fetch silently
        git fetch -q origin
        
        BRANCH=$(git branch --show-current)
        LOCAL=$(git rev-parse HEAD)
        REMOTE=$(git rev-parse "origin/$BRANCH")

        if [ "$LOCAL" != "$REMOTE" ]; then
            # Display popup
            if zenity --question --title="Update Available" \
                      --text="New settings are ready for this PC. Apply?" \
                      --ok-label="Update" --cancel-label="Later"; then
                
                stdbuf -oL chezmoi update -v --force 2>&1 | zenity --progress --pulsate --text="Applying updates..." --auto-close
                
                # If the update finishes, it will close Zenity and notify
                zenity --info --text="Update complete!" --timeout=3
            fi
        fi
    fi
    sleep 3600
done

