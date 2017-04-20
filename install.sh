#!/bin/bash
# Use only if you need to perform changes on the user system such as installing software
pg_uv4l_install () {
    local is_supported=false
    if [ "$platform" = "linux" ]; then
        if [ "$jv_os_name" == "raspbian" ]; then
            if [ "$jv_os_version" == 8 ]; then
                is_supported=true
            fi
        fi
    fi
    
    if [ "$is_supported" == false ]; then
        jv_error "UV4L is only supported on Raspberry Pi 2+ using Rasbpian 8 Jessie"
        exit 1
    fi
    
    curl http://www.linux-projects.org/listing/uv4l_repo/lrkey.asc | sudo apt-key add -
    echo 'deb http://www.linux-projects.org/listing/uv4l_repo/raspbian/ jessie main' >/tmp/uv4l.list
    sudo cp /tmp/uv4l.list /etc/apt/sources.list.d/
    rm /tmp/uv4l.list #http://stackoverflow.com/questions/1584066/append-to-etc-apt-sources-list
    
    jv_update
    jv_install uv4l uv4l-raspicam uv4l-server uv4l-webrtc # uv4l core, raspi cam support, server, audio
}

pg_uv4l_install
