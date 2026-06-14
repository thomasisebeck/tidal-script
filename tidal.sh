#!/bin/bash

urls=(
#"https://tidal.com/browse/playlist/3d2c51c2-b3be-4ba2-9849-8980bfc25d17" # CHIMERA
 "https://tidal.com/browse/playlist/0fa58b92-886c-4070-84da-2ba2b45cc519" # ALT
 "https://tidal.com/browse/playlist/1ea538c6-59bd-4bdc-b7fc-1189e0468b65" # ASTRAL
 "https://tidal.com/browse/playlist/1bf541a7-d18d-4739-824e-9db6ef532410" # BETA
 "https://tidal.com/browse/playlist/30c336a0-c786-47e1-828c-0696c9f98505" # BUBBLE
 "https://tidal.com/browse/playlist/54776b2f-fb7f-4348-828c-43e79e1bbbea" # CADENCE
 "https://tidal.com/browse/playlist/480fcde9-059d-40b5-bea3-c5884badccd7" # EGAL
 "https://tidal.com/browse/playlist/7ef887d1-d5b0-4604-b021-35da4ee33524" # FLATLINE
 "https://tidal.com/browse/playlist/a92ac6ae-66df-4575-9825-30d5bf05bcfa" # FRAGMENT
 "https://tidal.com/browse/playlist/43c351fb-711b-4e48-b5c1-02e7697bfe65" # FRETLESS
 "https://tidal.com/browse/playlist/8b631d80-2bc0-4543-809f-7d1f58ec2c21" # GLITCH
 "https://tidal.com/browse/playlist/3ebc4617-65d6-40b7-baf7-502676a1b6ba" # KOOKY
 "https://tidal.com/browse/playlist/f6caf9a6-ecad-40e8-a005-ad9963b2b057" # LATTE
 "https://tidal.com/browse/playlist/fe62da84-ff98-4e9c-adff-7ff726f18753" # LEXEME
 "https://tidal.com/browse/playlist/a65ea2b3-5f81-494c-bc96-14c2fb02f119" # LICK
 "https://tidal.com/browse/playlist/3799408e-8129-48d4-8e46-a7b77189937e" # LOTUS
 "https://tidal.com/browse/playlist/666457a2-d903-4d56-ada3-884fd8e04e09" # LOVE
 "https://tidal.com/browse/playlist/af2c046c-73e1-4ac9-a9a7-5e7d507b378a" # MEMPHIS
 "https://tidal.com/browse/playlist/3631bbb7-7040-4363-b22c-41aab65d6a0a" # NOISE
 "https://tidal.com/browse/playlist/0630872b-8eb0-43fc-b61a-035f437eb0c8" # SIGMOID
 "https://tidal.com/browse/playlist/616aa074-414d-4590-bd0b-506a0b802054" # SILHOUETTES
 "https://tidal.com/browse/playlist/25604b19-9ad9-42ef-8901-054061b417a0" # SNAP
 "https://tidal.com/browse/playlist/2bdf5c87-d967-41db-81c3-2cd4262ce9f5" # SOUNDSCAPE
 "https://tidal.com/browse/playlist/1d3601fe-575e-43c0-9591-553f46419f25" # SUSHI
 "https://tidal.com/browse/playlist/5d763aed-4950-4eb9-96e4-8b62210d0a22" # SWING
 "https://tidal.com/browse/playlist/904c476b-d15a-44a4-830d-f414afc7b716" # SYNTH
 "https://tidal.com/browse/playlist/2c70a8e4-af10-4570-bcce-666e48550706" # THROWBACK
 "https://tidal.com/browse/playlist/481bb0f9-c452-4038-affd-1e9994f29f94" # TRISKELION
)

for url in "${urls[@]}"; do
    echo "Downloading: $url"
    # rip -c FLAC -q 3 -ndb url "$url"
    rip -c FLAC -q 3 url "$url"
    echo "Finished: $url"
    echo "Sleeping...";
    sleep $(( 15 + RANDOM % 15 ))

    echo "--------------------------------------"
done
