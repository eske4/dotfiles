#!/bin/bash

chsh -s "$(which zsh)"
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
sudo rm -rf .zshrc
