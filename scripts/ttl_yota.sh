#!/bin/bash

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

TTL=${1:-65}
echo ${TTL} > /proc/sys/net/ipv4/ip_default_ttl
iptables --table=mangle --append=POSTROUTING -j TTL --ttl-set ${TTL}
ping 127.0.0.1 -c 4
