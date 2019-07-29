#! /bin/bash

# Pipe Names
input=aOutput
output=bOutput

# set -x

if [ $# -eq 0 ]; then
    player_name="player 2"
fi

if [ $# -eq 1 ]; then
    player_name="$1"
fi

echo "Player Name: $player_name"
