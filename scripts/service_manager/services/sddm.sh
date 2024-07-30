#!/bin/bash
sudo systemctl enable sddm

sudo cp -r "$HOME/dotfiles/home/.config/sddm/sugar-dark/" "/usr/share/sddm/themes/sugar-dark/"
sudo cp -r "$HOME/dotfiles/home/.config/sddm/sddm.conf" "/etc/sddm.conf.d/sddm.conf"
