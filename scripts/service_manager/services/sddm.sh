#!/bin/bash
sudo systemctl enable sddm

yay -S sddm-sugar-dark --noconfirm
sudo rm -rf "/usr/share/sddm/themes/sugar-dark"

sudo mkdir -p /etc/sddm.conf.d

sudo mkdir -p /usr/share/sddm/themes/sugar-dark
sudo cp -rT "$HOME/dotfiles/home/.config/sddm/sugar-dark" "/usr/share/sddm/themes/sugar-dark"

sudo cp -r "$HOME/dotfiles/home/.config/sddm/sddm.conf" "/etc/sddm.conf.d/sddm.conf"
