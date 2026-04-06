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
            # 1. Ask the question
            if zenity --question --title="Update Available" \
                --text="New settings are ready for this PC. Apply?" \
                --ok-label="Update" --cancel-label="Later" --timeout=60; then
    
                # 2. Run the update with a simple 'pulsate' bar
                # We use a subshell to run the command and pipe only to a progress bar
                (
                  # We add --force to ensure no 'overwrite?' prompts stop the script
                  # We add --tty=false to tell chezmoi 'don't wait for a keyboard'
                  chezmoi update --force --no-tty
                ) | zenity --progress --pulsate --text="Applying updates..." --auto-close --no-cancel
    
                # 3. Final notification
                notify-send "Chezmoi" "Update complete!" --icon=checkbox-checked-symbolic
            fi
            # Display popup
        fi

    fi
    sleep 3600
done

