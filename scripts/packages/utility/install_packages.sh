#!/bin/bash

# Function to check if a line is a comment
check_if_comment() {
    local line=$1
    if [[ "${line:0:1}" == "#" ]]; then
        echo "$line"
        return 0
    fi
    return 1
}

# Function to install a package
install_package() {
    local package=$1
    # Display a message indicating the package is being installed
    echo -n "Installing package: $package ..."
    yay -S --noconfirm "$package" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        if [ "$package" == 'rustup' ]; then
            sudo pacman -R --noconfirm rust > /dev/null 2>&1
        fi
        echo -e "\e[32m[OK]\e[0m"
    else
        echo -e "\e[31m[Failed]\e[0m"
    fi
}

# Path to the file containing the list of packages
PACKAGE_LIST="$1"

# Check if the package list file exists
if [ ! -f "$PACKAGE_LIST" ]; then
    echo "Package list file not found: $PACKAGE_LIST"
    exit 1
fi

# Install packages using pacman
while IFS= read -r package; do

    # Ignore empty lines
    if [ -z "$package" ]; then
        continue
    fi

    # Check if it's a comment
    if check_if_comment "$package"; then
        continue
    fi

    # Install the package
    install_package "$package"

done < "$PACKAGE_LIST"
