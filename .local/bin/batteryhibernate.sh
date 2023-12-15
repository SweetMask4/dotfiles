#!/bin/dash

while true; do

    battery=$(cat /sys/class/power_supply/BAT?/capacity)
    state=$(cat /sys/class/power_supply/BAT?/status)

    if [ "$state" = "Discharging" ] && [ "$battery" -lt 20 ]; then
        playerctl stop --all-players # Stop all media
        notify-send "Battery Critically Low" "The computer will power off in 30 seconds to prevent data loss." -u critical -i "battery-alert" -r 9991
        sleep 30
        loginctl suspend
    fi
    sleep 60
done
