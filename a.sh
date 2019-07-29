#! /bin/bash

## set -x
## checking arguments from the shell.
## if 0(No Argument) then default name(player 1),

if [ $# -eq 0 ]; then
    player_name="player 1"
fi

## iff 1 argument then suggested name($1 grabs value of argument).
if [ $# -eq 1 ]; then
    player_name="$1"
fi

echo "Player Name: $player_name"