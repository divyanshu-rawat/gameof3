#! /bin/bash

## set -x

## Pipe Names
output=aOutput
input=bOutput


## checking arguments from the shell.
## if 0(No Argument) then default name(player 1),

if [ $# -eq 0 ]; then
    player_name="player 1"
fi

## if 1 argument then suggested name($1 grabs value of argument).
if [ $# -eq 1 ]; then
    player_name="$1"
fi

echo "Player Name: $player_name"

## generate the random number.
random=$(jot -r 1 10 99)
echo "Random number: $random"

##  creating namer pipe and channelizing the output on to a different terminal.
##  check to see if named pipe exists before, initially evaluates to false.
if [ ! -p "$output" ]; then
    mkfifo "$output"
fi

if [ ! -p "$input" ]; then
    mkfifo "$input"
fi

## if the random number generated is 1, then game is already over.
if (( random == 1 )); then
    echo
    echo "WINNER: $player_name!"
    echo "won" > "$output"
    exit
fi