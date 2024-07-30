#!/bin/bash

# kill waybar process
killall waybar
sleep 0.2

# Start waybar
waybar -c "$HOME/dotfiles/home/.config/waybar/config.jsonc"  -s "$HOME/dotfiles/home/.config/waybar/styles.css" &
