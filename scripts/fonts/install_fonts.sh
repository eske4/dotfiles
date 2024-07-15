#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

# Define font installer script
FONT_INSTALLER="utility/font_install_script.sh"

# Define an array of fonts to install, each element containing font name and URL
declare -A fonts=(
    ["FiraCode"]="https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip"
    ["Maple"]="https://github.com/subframe7536/maple-font/releases/download/v7.0-beta3/MapleMono-Hinted.zip"
)

# Loop through the fonts array and install each font
for font_name in "${!fonts[@]}"; do
    font_url="${fonts[$font_name]}"
    bash "${SCRIPT_DIR}/${FONT_INSTALLER}" "$font_name" "$font_url"
    if [ $? -ne 0 ]; then
        echo "Failed to install font $font_name."
    fi
done
