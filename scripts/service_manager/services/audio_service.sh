#!/bin/bash

# Disable PulseAudio ensuring it uses PipeWire

sudo systemctl stop pulseaudio.service
sudo systemctl disable pulseaudio.service
sudo systemctl mask pulseaudio.service

# Setup PipeWire service

systemctl --user enable pipewire
systemctl --user enable pipewire-pulse
systemctl --user enable wireplumber
