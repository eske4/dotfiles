#!/bin/bash

# Install necessary packages
sudo pacman -Syu --noconfirm
sudo pacman -S qemu-full virt-manager iptables-nft dnsmasq bridge-utils --noconfirm

# Add the current user to necessary groups
sudo usermod -aG libvirt "$USER"
sudo usermod -aG libvirt-qemu "$USER"
sudo usermod -aG kvm "$USER"
sudo usermod -aG input "$USER"
sudo usermod -aG disk "$USER"

# Enable and start services
sudo systemctl enable --now libvirtd
sudo systemctl enable --now dnsmasq

# Start and autostart the default network
sudo virsh net-start default
sudo virsh net-autostart default

# Notify user to log out and log back in
echo "Setup complete. Please log out and log back in for the group changes to take effect."

# This link https://forum.level1techs.com/t/failed-to-start-network-default-libvirt-errors-why-how-to-fix/207789/13 has a solution if there a bugs for now
