#!/bin/bash

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

mount "$1" /home/vkutuev/Documents/ext/

