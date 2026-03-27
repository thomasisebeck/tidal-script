#!/bin/bash

urls=(
#  "https://tidal.com/browse/playlist/3799408e-8129-48d4-8e46-a7b77189937e"
https://tidal.com/browse/playlist/3631bbb7-7040-4363-b22c-41aab65d6a0a
# "https://tidal.com/browse/playlist/0fa58b92-886c-4070-84da-2ba2b45cc519"
# "https://tidal.com/browse/playlist/1ea538c6-59bd-4bdc-b7fc-1189e0468b65"
# "https://tidal.com/browse/playlist/1bf541a7-d18d-4739-824e-9db6ef532410"
# "https://tidal.com/browse/playlist/30c336a0-c786-47e1-828c-0696c9f98505"
# "https://tidal.com/browse/playlist/54776b2f-fb7f-4348-828c-43e79e1bbbea"
# "https://tidal.com/browse/playlist/7ef887d1-d5b0-4604-b021-35da4ee33524"
# "https://tidal.com/browse/playlist/43c351fb-711b-4e48-b5c1-02e7697bfe65"
# "https://tidal.com/browse/playlist/8b631d80-2bc0-4543-809f-7d1f58ec2c21"
# "https://tidal.com/browse/playlist/3ebc4617-65d6-40b7-baf7-502676a1b6ba"
# "https://tidal.com/browse/playlist/9ac35dbd-71ae-47c3-87da-c06d5514a73c"
# "https://tidal.com/browse/playlist/a8f97012-7e94-4098-8b54-bdee67a8b212"
# "https://tidal.com/browse/playlist/666457a2-d903-4d56-ada3-884fd8e04e09"
# "https://tidal.com/browse/playlist/af2c046c-73e1-4ac9-a9a7-5e7d507b378a"
# "https://tidal.com/browse/playlist/400fc6d3-6944-41ab-96cd-c421709bf3bb"
# "https://tidal.com/browse/playlist/616aa074-414d-4590-bd0b-506a0b802054"
# "https://tidal.com/browse/playlist/f7c219ab-5246-459a-b6df-38494c15a1d6"
# "https://tidal.com/browse/playlist/48ae2d3f-5830-4c6e-be73-78b27750c295"
# "https://tidal.com/browse/playlist/5d763aed-4950-4eb9-96e4-8b62210d0a22"
# "https://tidal.com/browse/playlist/904c476b-d15a-44a4-830d-f414afc7b716"
# "https://tidal.com/browse/playlist/252d842c-d48a-4bd4-92b5-f6a73e31a9a9"
)

for url in "${urls[@]}"; do
    echo "Downloading: $url"
    rip url "$url"
    echo "Finished: $url"
    echo "--------------------------------------"
done
