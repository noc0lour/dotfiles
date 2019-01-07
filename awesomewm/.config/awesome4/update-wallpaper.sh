#!/bin/sh
state=0;
while [ $state -ne 70 ]; do
state=$(dbus-send --system --print-reply \
    --dest=org.freedesktop.NetworkManager \
    /org/freedesktop/NetworkManager \
    org.freedesktop.NetworkManager.state 2>/dev/null \
| awk '/uint32/{print $2}');
sleep 1;
done;
/usr/bin/wget https://source.unsplash.com/random/1600x900 -O - > ~/.config/awesome/background.jpg
convert ~/.config/awesome/background.jpg ~/.config/awesome/background.png
pkill -HUP awesome
