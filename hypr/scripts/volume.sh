#!/bin/sh
# NAME
#     volume.sh - Increase/decrease/mute volume using PulseAudio pactl
# SYNOPSIS 
#     volume.sh <raise|lower|mute>
# Suggested location: ~/scripts/volume.sh

step=5   # number of percentage points to increase/decrease volume
max=200  # do not increase volume above this percentage

function get_current_volume() {
  pactl get-sink-volume @DEFAULT_SINK@ | awk -F '/' '{print $2}' | grep -o '[0-9]\+'
}

if [ $1 == "raise" ]; then

  # Modification: only increase volume if current volume is less than `max`
  if [ `get_current_volume` -lt ${max} ]; then
    pactl set-sink-volume @DEFAULT_SINK@ "+${step}%"
  fi
# The rest of the script is identical to the original `volume.sh`
elif [ $1 == "lower" ]; then
  pactl set-sink-volume @DEFAULT_SINK@ "-${step}%"
elif [ $1 == "mute" ]; then
  pactl set-sink-mute @DEFAULT_SINK@ toggle
else
  echo "Unrecognized parameter: ${1}"
  echo "Usage should be: volume.sh <raise|lower|mute>"
fi

