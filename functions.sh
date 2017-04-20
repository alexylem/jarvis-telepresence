#!/bin/bash
# Here you can create functions which will be available from the commands file
# You can also use here user variables defined in your config file
# To avoid conflicts, name your function like this
# pg_XX_myfunction () { }
# pg for PluGin
# XX is a short code for your plugin, ex: ww for Weather Wunderground
# You can use translations provided in the language folders functions.sh
pg_uv4l_start () {
    jv_debug "Starting UV4L server on http://$jv_ip:$pg_uv4l_port/stream/webrtc"
    $pv_uv4l_password && local password="--server-option '--user-password=$pv_uv4l_password'" || local password=""
    $verbose && local verbosity="-v7" || local verbosity="-v3"
    uv4l --auto-video_nr --driver raspicam --encoding h264 --width $pg_uv4l_with --height $pg_uv4l_height --server-option "--port=$pg_uv4l_port" $password $verbosity
}
