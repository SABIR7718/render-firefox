#!/bin/bash

# virtual display
Xvfb :1 -screen 0 1280x720x16 &
sleep 2

# window manager
fluxbox &

# start firefox with your cookies
firefox --profile /profile &

# vnc (internal)
x11vnc -display :1 -nopw -forever -shared -localhost &

# novnc web (ONLY exposed port)
websockify --web=/usr/share/novnc/ 0.0.0.0:8080 localhost:5900