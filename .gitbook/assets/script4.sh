#!/bin/bash
ip_address=$(cat /home/jose/.config/polybar/script3.sh)
echo "%{F#ffffff} IP Victima ${F#ffffff}$ip_address%{u-}"
