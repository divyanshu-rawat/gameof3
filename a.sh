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

##  creating name pipe and channelizing the output on to a different terminal.
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

## start the interaction
echo "$random" > "$output"

while true; do
    ## read number sent from other player
    read current < "$input"

    ## the keyword "won" means that Player 2 has won.
    if [[ "$current" -eq "won" ]]; then
        echo
        echo "LOSER: $player_name!"
        exit
    fi

    echo "Number received: $current"

    ## find the nearest number, that is divisible by 3.
    ## built-in command let for performing arithmetic operations.
    if (( current % 3 == 0 )); then
        let "next = ((current / 3))"
    elif (( (current + 1) % 3 == 0 )); then
        let "next = (((current + 1) / 3))"
    elif (( (current - 1) % 3 == 0 )); then
        let "next = (((current - 1) / 3))"
    fi

    ## next == 1, implies Player 1 has won!.
    if (( next == 1 )); then
        echo
        echo "WINNER: $player_name!"
        echo "won" > "$output"
        exit
    fi

    echo "Number sent: $next"
    ## else, Player 2 turn.
    echo "$next" > "$output"

done