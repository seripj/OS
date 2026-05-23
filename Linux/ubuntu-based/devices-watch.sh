#!/bin/bash

pactl subscribe | while read -r line; do
    if echo "$line" | grep -q "Event 'new'\|Event 'remove'\|Event 'change'"; then

        WIRELESS=$(pactl list short sinks | grep "Wireless" | awk '{print $2}')
        USB=$(pactl list short sinks | grep "USB" | awk '{print $2}')

        if [ ! -z "$WIRELESS" ]; then
            pactl set-default-sink "$WIRELESS"
        elif [ ! -z "$USB" ]; then
            pactl set-default-sink "$USB"
        fi
    fi
done