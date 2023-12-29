#!/bin/sh

while true; do
    men=$(free -h | awk 'NR==2{print $3}' | cut -d '.' -f 1)
    if [ "$men" -gt 2 ] && [ "$men" != "*M*" ]; 
    then
        pid=$(ps -u "$USER" -o pid,%mem --sort=-%mem | awk 'NR>1{print $1; exit}')
        choice=$(printf "yes\nno" | dmenu -p "Your memory usage is high, do you want to kill a process?")
        if [ "$choice" = "no" ]; then
            kill -9 "$pid"
        fi
    fi
    sleep 60
done
