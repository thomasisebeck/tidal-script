import csv
from collections import Counter

CSV_FILE = "My TIDAL Library.csv"

# Array of all your target playlists
PLAYLISTS = [
    "ALT-CRTL-DEL", "GLITCH", "SILHOUETTES",
    "ASTRAL", "KOOKY", "SNAP",
    "BETA", "LATTE", "SOUNDSCAPE",
    "BUBBLE", "LEXEME", "SUSHI",
    "CADENCE", "LICK", "SWING",
    "CHIMERA", "LOTUS", "SYNTH",
    "EGAL", "LOVE", "THROWBACK",
    "FLATLINE", "MEMPHIS", "TRISKELION",
    "FRAGMENT", "NOISE",
    "FRETLESS", "SIGMOID"
]

# Outer loop to iterate through every playlist in the array
for playlist in PLAYLISTS:
    tracks = []

    # Read the CSV file for the current playlist
    with open(CSV_FILE, mode='r', encoding='utf-8-sig') as f:
        reader = csv.DictReader(f)
        for row in reader:
            if row.get('Playlist name') == playlist:
                tracks.append(f"{row.get('Artist name')} - {row.get('Track name')}")

    # Count occurrences and filter for tracks that appear more than once
    duplicates = [track for track, count in Counter(tracks).items() if count > 1]

    # Only print output if duplicates actually exist for this playlist
    if duplicates:
        print(f"[{playlist}] - Found duplicate tracks inflating the CSV count:")
        for duplicate in duplicates:
            print(f" - {duplicate}")
        print("-" * 50)
