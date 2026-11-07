#!/bin/bash

M3U_FILE="./gramophone_favourite.m3u"
BASE_PATH="/run/media/thomas/"
REMOVED_FILE_NAME="removed.txt"

echo "starting..."
> "$REMOVED_FILE_NAME"

while IFS= read -r line || [ -n "$line" ]; do
    # Strip trailing carriage returns (\r) from Android line endings
    line="${line%$'\r'}"

    # Skip empty lines and M3U metadata headers
    [[ -z "$line" ]] && continue
    [[ "$line" == "#"* ]] && continue

    # Replace relative path prefix
    fixed_path="${line/#..\/..\/..\//$BASE_PATH}"

    echo "DELETING THESE FILES:"
    echo "--------------------------"

    if [ -f "$fixed_path" ]; then
        filename=$(basename "$fixed_path")
        clean_name=$(echo "$filename" | sed -E 's/^[0-9]+\. //' | sed 's/\.flac$//' | sed 's/\.opus$//')
        echo "$clean_name" >> "$REMOVED_FILE_NAME"
        echo "$clean_name"
        rm "$fixed_path"
    else
        echo "Not found: $fixed_path"
    fi

done < "$M3U_FILE"

echo "--------------------------"
echo "Done."

while IFS= read -r line || [ -n "$line" ]; do
    line="${line%$'\r'}"
    [[ -z "$line" ]] && continue
    encoded=$(printf '%s' "$line" | sed 's/ /%20/g')
    xdg-open "https://tidal.com/search?q=$encoded"
done < "$REMOVED_FILE_NAME"
