#!/bin/bash

check_dependencies() {
    command -v wget >/dev/null 2>&1 || { echo -e "\e[31mError: wget is not installed.\e[0m"; exit 1; }
    command -v unzip >/dev/null 2>&1 || { echo -e "\e[31mError: unzip is not installed.\e[0m"; exit 1; }
}

check_arguments() {
    if [ "$#" -ne 2 ]; then
        echo -e "\e[31mUsage: $0 <FontName> <FontURL>\e[0m"
        exit 1
    fi
}

create_font_directory() {
    FONT_DIR="$HOME/.local/share/fonts"
    if ! mkdir -p "$FONT_DIR"; then
        echo -e "\e[31mFailed to create font directory.\e[0m"
        exit 1
    fi
}

download_font() {
    echo -n "Downloading $FONT_NAME: "
    if wget --spider "$FONT_URL" 2>/dev/null; then
        wget --progress=bar:force:noscroll -O "$FONT_DIR/$FONT_NAME.zip" "$FONT_URL" > /dev/null 2>&1 &
        pid_download=$! # Store the process ID of the background process
        wait_for_process $pid_download
    else
        echo -ne "\r\033[2K"
        echo -e "\e[31mFailed to locate $FONT_NAME download URL.\e[0m"
        exit 1
    fi
}

wait_for_process() {
    pid=$1
    while kill -0 $pid > /dev/null 2>&1; do
        echo -n "."
        sleep 0.5
    done
    wait $pid
    echo -ne "\r\033[2K"
}

extract_font() {
    echo -n "Extracting $FONT_NAME: "
    unzip -o "$FONT_DIR/$FONT_NAME.zip" -d "$FONT_DIR" > /dev/null 2>&1 &
    pid_extraction=$! # Store the process ID of the background process
    wait_for_process $pid_extraction
}

cleanup() {
    echo -n "Cleaning up: "
    rm "$FONT_DIR/$FONT_NAME.zip" > /dev/null 2>&1 &
    pid_cleanup=$! # Store the process ID of the background process
    wait_for_process $pid_cleanup
}

refresh_font_cache() {
    echo -n "Refreshing font cache: "
    fc-cache -fv > /dev/null 2>&1 &
    pid_refresh=$! # Store the process ID of the background process
    wait_for_process $pid_refresh
}

main() {
    check_dependencies
    check_arguments "$@"
    
    FONT_NAME="$1"
    FONT_URL="$2"
    
    create_font_directory
    download_font
    extract_font
    cleanup
    refresh_font_cache
    
    echo -e "\e[32m$FONT_NAME has been installed.\e[0m"
}

main "$@"
