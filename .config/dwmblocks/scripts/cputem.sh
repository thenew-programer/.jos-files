#!/bin/sh

temp() {
    temp=$(sensors | awk '/Core 0/ { print $3 }' | sed "s/+//;s/\.[0-9]//;s/°C//")
    echo "$temp"
}


temp="$(temp)"
echo ${temp}°C
