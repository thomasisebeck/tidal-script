# update streamrip 

~/.pyenv/versions/3.12.2/bin/pip install --force-reinstall --no-cache-dir git+https://github.com/nathom/streamrip.git@main

# login to tial

```
rip config
```

To log in again, delete the keys with:

```
nvim ~/.cofig/streamrip/config.toml
```

# steps

1. export Favorites.m3u on the sd card
1. copy Favorites.m3u from sd to this dir
1. run delete local files script
1. unheart those songs in tidal (in removed.txt)
1. run the tidal.sh script

# if failing

First try:

```
python -m venv .venv
source .venv/bin/activate
pip install streamprip --upgrade
```

If that does not work:

```
pipx install git+https://github.com/nathom/streamrip.git@dev --force
```

# Delete missing tracks and find duplicates

Export library from TuneMyMusic and leave it 'My Tidal Library.csv'

Run the delete-missing-tracks script:
Initiate the download again

Or the find-duplicats script:
Delete from tidal and from the database
