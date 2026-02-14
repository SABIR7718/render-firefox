#!/bin/bash

Xvfb :1 -screen 0 1280x800x16 &
sleep 3

export DISPLAY=:1

# Start desktop
startxfce4 &

sleep 5

# Start Firefox with your profile
firefox --profile /profile &

# Start VNC
x11vnc -display :1 -nopw -forever -shared -localhost &

# Web access
websockify --web=/usr/share/novnc/ 0.0.0.0:8080 localhost:5900