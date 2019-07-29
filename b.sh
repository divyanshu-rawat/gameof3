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


while true; do
    ## read number sent from Player 1
    read current < "$input"

    ## the keyword "won" means that Player 1 has one.
    if [[ "$current" -eq "won" ]]; then
        echo
        echo "LOSER: $player_name!"
        exit
    fi

    echo "Number received: $current"

    ## find the nearest number, that is divisible by 3.
    ## Sbuilt-in command let for performing arithmetic operations.
    if (( current % 3 == 0 )); then
        let "next = ((current / 3))"
    elif (( (current + 1) % 3 == 0 )); then
        let "next = (((current + 1) / 3))"
    elif (( (current - 1) % 3 == 0 )); then
        let "next = (((current - 1) / 3))"
    fi

    echo "Number sent: $next"

    ## next == 1, implies Player 2 has won!.
    if (( next == 1 )); then
        echo
        echo "WINNER: $player_name!"
        echo "won" > "$output"
        exit
    fi

    ## else, Player 1 turn.
    echo "$next" > "$output"

done

# set +x
