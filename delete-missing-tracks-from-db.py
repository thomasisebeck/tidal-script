import os
import csv
import re
import sqlite3
from collections import defaultdict

# --- Configuration ---
CSV_FILE = "library.csv" 
MUSIC_DIR = "/run/media/thomas/2C70-FF87/Music/"
DB_PATH = "/home/thomas/.config/streamrip/downloads.db"

def clean_string(s):
    if not s:
        return ""
    s = re.sub(r'\(.*?\)|\[.*?\]', '', s)
    return "".join(c.lower() for c in s if c.isalnum())

def get_local_files(playlist_dir):
    local_tracks = set()
    if not os.path.exists(playlist_dir):
        return local_tracks

    for file in os.listdir(playlist_dir):
        if file.lower().endswith(('.flac', '.mp3', '.m4a', '.wav', '.ogg')):
            name_without_ext = os.path.splitext(file)[0]
            local_tracks.add(clean_string(name_without_ext))
            
    return local_tracks

def main():
    playlists = defaultdict(list)
    
    # 1. Parse CSV and grab the Tidal ID
    try:
        with open(CSV_FILE, mode='r', encoding='utf-8-sig') as f:
            sample = f.read(2048)
            f.seek(0)
            sniffer = csv.Sniffer()
            dialect = sniffer.sniff(sample)
            
            reader = csv.DictReader(f, dialect=dialect)
            
            for row in reader:
                row = {k.strip(): v for k, v in row.items() if k}
                
                track_name = row.get('Track name', '').strip()
                artist_name = row.get('Artist name', '').strip()
                playlist_name = row.get('Playlist name', '').strip()
                tidal_id = row.get('Tidal - id', '').strip()
                
                if track_name and playlist_name and tidal_id:
                    playlists[playlist_name].append({
                        'track': track_name,
                        'artist': artist_name,
                        'id': tidal_id
                    })
    except FileNotFoundError:
        print(f"Error: Could not find '{CSV_FILE}'.")
        return

    total_missing = 0
    missing_ids = []
    
    print(f"Scanning directory: {MUSIC_DIR}\n")
    
    # 2. Find missing tracks
    for playlist_name, tracks in playlists.items():
        playlist_dir = os.path.join(MUSIC_DIR, playlist_name)
        local_files = get_local_files(playlist_dir)
        
        missing_in_playlist = []
        
        for expected in tracks:
            clean_expected_track = clean_string(expected['track'])
            
            match_found = any(
                clean_expected_track in local_file or local_file in clean_expected_track 
                for local_file in local_files
            )
            
            if not match_found:
                missing_in_playlist.append(expected)
                missing_ids.append(expected['id'])
        
        if missing_in_playlist:
            print(f"[{playlist_name}] - Missing {len(missing_in_playlist)} tracks:")
            for missing in missing_in_playlist:
                print(f"   x {missing['artist']} - {missing['track']} (ID: {missing['id']})")
            print("-" * 40)
            
            total_missing += len(missing_in_playlist)

    if total_missing == 0:
        print("Success! No missing tracks found. Database requires no cleanup.")
        return

    print(f"\nScan complete. Total missing tracks identified: {total_missing}")
    
    # 3. Database Cleanup
    if not os.path.exists(DB_PATH):
        print(f"\n[!] Error: Database not found at {DB_PATH}")
        print("Cannot perform SQL cleanup.")
        return

    print("\n--- Executing Streamrip Database Cleanup ---")
    
    try:
        # Connect to the SQLite database
        conn = sqlite3.connect(DB_PATH)
        cursor = conn.cursor()
        
        # Remove duplicates in case the same track was missing across multiple playlists
        unique_missing_ids = list(set(missing_ids))
        
        deleted_count = 0
        for track_id in unique_missing_ids:
            # Print the exact SQL statement for your logging/visibility
            sql_statement = f"DELETE FROM downloads WHERE id = {track_id};"
            print(f"Executing: {sql_statement}")
            
            # Execute with parameterized query for safety
            cursor.execute("DELETE FROM downloads WHERE id = ?", (track_id,))
            deleted_count += cursor.rowcount
            
        # Commit the transaction
        conn.commit()
        print(f"\nDatabase cleanup complete! {deleted_count} stale entries removed.")
        
    except sqlite3.Error as e:
        print(f"\n[!] SQLite Database Error: {e}")
    finally:
        if conn:
            conn.close()

if __name__ == "__main__":
    main()
