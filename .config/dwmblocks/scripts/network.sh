#!/bin/bash

connections=$(ip a | grep ens5f5 | grep -c inet)
wifi_connections=$(ip a | grep wls1 | grep -c inet)
if [[ $connections -eq 1 ]]; then
	echo "  "
elif [[ $wifi_connections -eq 1 ]]; then
	echo "  "
else
	echo " 󰤭 "
fi
