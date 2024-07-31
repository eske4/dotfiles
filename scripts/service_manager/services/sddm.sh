#!/bin/bash
sudo systemctl enable sddm

sudo rm -rf "/usr/share/sddm/themes/sugar-dark"
yay -S sddm-sugar-dark
sudo rm -rf "/usr/share/sddm/themes/sugar-dark"

sudo mkdir -p /etc/sddm.conf.d

sudo mkdir -p /usr/share/sddm/themes/sugar-dark
sudo cp -rT "$HOME/dotfiles/home/.config/sddm/sugar-dark" "/usr/share/sddm/themes/sugar-dark"

sudo cp -r "$HOME/dotfiles/home/.config/sddm/sddm.conf" "/etc/sddm.conf.d/sddm.conf"
