#!/bin/sh

# case $BLOCK_BUTTON in
# 	1) notify-send " Memory hogs" "$(ps axch -o cmd:15,%mem --sort=-%mem | head)" ;;
# 	2) setsid -f "st" -e htop ;;
# 	3) notify-send " Memory module" "\- Shows Memory Used/Total.
# - Click to show memory hogs.
# - Middle click to open htop." ;;
# 	6) "st" -e "code" "$0" ;;
# esac
#
# free --mebi | sed -n '2{p;q}' | awk '{printf ("[%2.2fGiB/%2.2fGiB]\n", ( $3 / 1024), ($2 / 1024))}'
#
#
mem() {
    echo "$(free -h --giga | awk '/^Mem:/ { print $3 }')"
}

mem="$(mem)"

# echo "CPU: $load $temp"
# echo "${load}%   ${temp}°C  $mem  "
# echo " ${load}%  ${temp}°C"
echo "$mem"
