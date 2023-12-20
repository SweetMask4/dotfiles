#!/bin/dash

while true; do
    men=$(free -h | sed -n '2p' | awk '{ print $3}' | cut -d '.' -f 1)
    if [ "$men" -gt 2 ];
    then
        pid=$(ps -u "$USER" -o pid,%mem | sort -b -k 2 -r | sed -n '1!p' | head -n 1 | awk '{ print $1 }')
        choice=$(echo "yes\nno" |  dmenu -p "You memory usage is high, wanna die?" )
        if [ "$choice" = "no" ];
        then
            kill -9 "$pid"
        fi
    fi
    sleep 60
done
