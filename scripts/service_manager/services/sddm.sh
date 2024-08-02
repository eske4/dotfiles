#!/bin/bash
sudo systemctl enable sddm

yay -S sddm-sugar-dark --noconfirm

sudo mkdir -p /etc/sddm.conf.d

sudo ln -sfn "$HOME/dotfiles/home/.config/sddm/sddm.conf" "/etc/sddm.conf.d/sddm.conf"

