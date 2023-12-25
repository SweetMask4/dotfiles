#!/bin/bash

while true; do
    men=$(free -h | awk 'NR==2{print $3}' | cut -d '.' -f 1)
    menF=$(free -h | awk 'NR==2{print $3}' | tr -d 'Gi')
    if [ "$men" -gt 2 ]; then
        pid=$(ps -u "$USER" -o pid,%mem --sort=-%mem | awk 'NR>1{print $1; exit}')
        choice=$(echo -e "yes\nno" | dmenu -p "Your memory usage is high, do you want to kill a process?")
        if [ "$choice" = "no" ]; then
            kill -9 "$pid"
        fi
    fi

    if (( $(echo "$menF >= 3.4" | bc -l) )); then
        kill -9 "$pid"
    fi

    sleep 60
done
