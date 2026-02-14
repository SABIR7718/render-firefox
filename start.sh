#!/bin/bash

export DISPLAY=:1

# Start virtual display
Xvfb :1 -screen 0 1280x800x16 &
sleep 3

echo "Starting Firefox..."

while true
do
    firefox --profile /profile "https://idx.google.com/vps123-73177745"
    echo "Firefox closed. Restarting in 10 seconds..."
    sleep 10
done