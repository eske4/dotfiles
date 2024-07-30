#!/bin/bash

# Get the directory of the script
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

# Install yay
bash "${SCRIPT_DIR}/core/install_yay.sh"

# Install rustup toolchains
bash "${SCRIPT_DIR}/utility/install_rustup_tools.sh" "${SCRIPT_DIR}/packages/development_packages.txt"

# Install development packages
bash "${SCRIPT_DIR}/utility/install_packages.sh" "${SCRIPT_DIR}/packages/development_packages.txt"

# Install system packages
bash "${SCRIPT_DIR}/utility/install_packages.sh" "${SCRIPT_DIR}/packages/system_packages.txt"
