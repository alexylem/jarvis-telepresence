#!/bin/bash
# Use only if you need to undo changes on the user system such as removing software
pkill uv4l
jv_remove uv4l uv4l-raspicam uv4l-server uv4l-webrtc
sudo rm /etc/apt/sources.list.d/uv4l.list
