#!/bin/bash

# Ensure the script receives one argument (the source folder structure to read)
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <source-folder>"
    exit 1
fi

SOURCE_FOLDER="$1"

# Check if the source folder exists
if [ ! -d "$SOURCE_FOLDER" ]; then
    echo "Source folder does not exist: $SOURCE_FOLDER"
    exit 1
fi

# Iterate over each directory in the source folder
find "$SOURCE_FOLDER" -type d | while read -r dir; do
    # Get the relative path from the source folder
    relative_path="${dir#$SOURCE_FOLDER/}"
    
    # Form the corresponding directory in the home directory
    target_dir="$HOME/$relative_path"
    
    # Check if the target directory exists in the home directory
    if [ -d "$target_dir" ]; then
        echo "Deleting directory: $target_dir"
        rm -rf "$target_dir"
    else
        echo "Directory does not exist: $target_dir"
    fi
done

echo "Deletion process completed."

