#!/bin/bash
# Infinite loop, check every 3600 seconds (1 hour)
while true; do
    # 1. Fetch changes in the background
    (cd "$HOME/.local/share/chezmoi" && git fetch -q)
    
    # 2. Check if local is behind remote
    LOCAL=$(cd "$HOME/.local/share/chezmoi" && git rev-parse @)
    REMOTE=$(cd "$HOME/.local/share/chezmoi" && git rev-parse @{u})

    if [ "$LOCAL" != "$REMOTE" ]; then
        # Trigger the popup only if updates exist
        if zenity --question --title="Dotfiles Update" \
                  --text="New settings are ready. Apply them now?" \
                  --ok-label="Update" --cancel-label="Later"; then
            chezmoi update -v | zenity --progress --pulsate --text="Updating..." --auto-close
        fi
    fi

    # Wait 1 hour before checking again
    sleep 3600
done
