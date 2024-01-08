#!/bin/sh
interface="wlan0"  # Replace "eth0" with the name of your network interface

# Change the MAC address of the network interface
ip link set dev $interface down
macchanger -r -b $interface
ip link set dev $interface up
