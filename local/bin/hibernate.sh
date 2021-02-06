#!/usr/bin/env bash

WARN=0
while true
do
    level=$(cat /sys/class/power_supply/BAT0/capacity)
    status=$(cat /sys/class/power_supply/BAT0/status)
    if [ "$level" -le 5 ] && [ "$status" != "Charging" ]
        then ~/.local/bin/lock && systemctl hibernate
    fi
    if [ "$level" -le 10 ] && [ "$status" != "Charging" ]
        then [ ! "$WARN" ] && dunstify -u critical "WARNING: Low Battery." && WARN=1
    fi
    if [ "$status" == "Charging" ]
        then WARN=0 
    fi
    sleep 10s
    echo $WARN
done
