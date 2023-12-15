#!/bin/bash
interface="wlan0"  # Reemplaza "eth0" con el nombre de tu interfaz de red

# Genera una nueva dirección MAC aleatoria
# new_mac=$(macchanger -r $interface | grep "New MAC" | awk '{print $3}')

# Cambia la dirección MAC de la interfaz de red
ip link set dev $interface down
macchanger -r -b $interface
ip link set dev $interface up
