# login to tial

```
rip config --tidal
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
pip3 install streamprip --upgrade
```

If that does not work:

```
pipx install git+https://github.com/nathom/streamrip.git@dev --force
```
