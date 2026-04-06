while read -r package || [[ -n "$package" ]]; do
    # Remove whitespace and comments
    package=$(echo "$package" | sed 's/#.*//' | xargs)

    # Skip empty lines
    [[ -z "$package" ]] && continue

    # Perform the check
    if ! pacman -Si "$package" &> /dev/null; then
        echo "❌ NOT FOUND: $package"
    fi
done < pkglist-arch.txt
