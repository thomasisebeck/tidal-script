#!/bin/bash

# Run this script to delete everything in the local playlist

# Cut Favorites.m3u from the ipod and put in in the script dir

M3U_FILE="./Favorites.m3u"
BASE_PATH="/run/media/thomas/85E8-7A85"
REMOVED_FILE_NAME="removed.txt"

echo "starting..."

while IFS= read -r line; do
# Skip empty lines or comments
[[ -z "$line" ]] && continue

# Replace prefix
fixed_path="${line/85E8-7A85:/$BASE_PATH/}"



echo "DELETING THESE FILES:"
echo "--------------------------"

if [ -f "$fixed_path" ]; then
    filename=$(basename "$fixed_path")
    clean_name=$(echo "$filename" | sed -E 's/^[0-9]+\. //' | sed 's/\.flac$//')
    echo "$clean_name" >> removed.txt
    echo "$clean_name"
    rm "$fixed_path"
else
    echo "Not found: $fixed_path"
fi

done < "$M3U_FILE"

echo "--------------------------"

echo "Done."

while IFS= read -r line; do
    encoded=$(printf '%s' "$line" | sed 's/ /%20/g')
    xdg-open "https://tidal.com/search?q=$encoded"
done < removed.txt
