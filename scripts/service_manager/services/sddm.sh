#!/bin/bash
sudo systemctl enable sddm

sudo pacman -S qt5-graphicaleffects qt5-quickcontrols2 qt5-svg

sudo mkdir -p /etc/sddm.conf.d
sudo mkdir -p /usr/share/sddm/themes/sugar-dark

sudo ln -sfn "$HOME/dotfiles/home/.config/sddm/sugar-dark" "/usr/share/sddm/themes/sugar-dark"
sudo ln -sfn "$HOME/dotfiles/home/.config/sddm/sddm.conf" "/etc/sddm.conf.d/sddm.conf"

