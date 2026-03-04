#!/bin/sh
echo "%{F#FFFFFF}IP %{F#ffffff}$(/usr/sbin/ifconfig eth0 | grep "inet " | awk '{print $2}')%{u-}"

