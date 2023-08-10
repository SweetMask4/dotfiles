#!/usr/bin/env bash

# Run 'ip a' to retrieve information about network interfaces and filter it using 'grep'
interfaces=$(ip a | grep -E "^[0-9]+: " | awk -F ': ' '{print $2}')

# Function to change the MAC address to a random one and then bring up the interface
start() {
    # Display the interface menu and get user's selection
    echo "Select an interface:"
    select_interface

    sudo ifconfig "$INTERFACE" down
    sudo macchanger -b -r "$INTERFACE"
    sudo ifconfig "$INTERFACE" up
}

# Function to reset the MAC address to its original value and then bring up the interface
stop() {
    # Display the interface menu and get user's selection
    echo "Select an interface:"
    select_interface

    sudo ifconfig "$INTERFACE" down
    sudo macchanger -p "$INTERFACE"
    sudo ifconfig "$INTERFACE" up
}

# Function to display the interface menu and get user's selection
select_interface() {
    counter=1
    for interface in $interfaces; do
        echo "$counter. $interface"
        ((counter++))
    done

    read -rp "Choose an option: " choice

    if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
        echo "Invalid option."
        exit 1
    fi

    if (( choice >= 1 && choice <= counter - 1 )); then
        INTERFACE=$(echo "$interfaces" | sed -n "${choice}p")
        echo "You have selected the interface: $INTERFACE"
    else
        echo "Invalid option."
        exit 1
    fi
}

# Main script
case "$1" in
    start) start ;;
    stop) stop ;;
    *) echo "Invalid option. Please enter 'start' or 'stop'."
       echo "Please run this script with sudo." ;;
esac

