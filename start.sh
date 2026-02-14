#!/bin/bash

export DISPLAY=:1

# start virtual display
Xvfb :1 -screen 0 1280x800x16 &
sleep 3

# start firefox with your cookies
firefox --profile /profile "https://idx.google.com/vps123-73177745" &

# keep refreshing every 10 minutes
while true; do
  sleep 600
  pkill -f firefox
  sleep 2
  firefox --profile /profile "https://idx.google.com/vps123-73177745" &
done