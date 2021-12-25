#!/bin/bash

finish_array=0
step=1
last_numbers=()
is_playing=true
check='^[0-9]+$'

while [ "$is_playing" = "true" ]; do
    (( random_number = RANDOM % 10 + 100 ))
    echo "Step: $step"
    read -p "Please enter number from 100 to 109 (q - quit) :" input

    while ! [[ $input =~ $check ]]; do
        if [ "$input" = "q" ]; then
            is_playing=false
            break;
        fi
        echo "Yours input is not number!"
        echo "Please, input a number...."
        read input
    done

    if [ "$is_playing" = "false" ]; then
        break;
    fi

    if [ "$input" -le "109" ] && [ "$input" -ge "100" ]; then
        if [ "$input" = "$random_number" ]; then
            echo "Great!"
            finish_array=$((finish_array + 1))
        else
            echo "Miss"
        fi
        echo "Hit: $((finish_array * 100 / step))% Miss : $(((step - finish_array)* 100 / step))%"
    else 
        echo "Please, write correct number from 100 to 109"
        step=$((step - 1))
    fi
    if [ "$input" = "$random_number" ]; then 
        array[0]="$random_number+"
    else
        array[0]="$random_number"
    fi
    for (( i = 0; i < 7; i++ )); do
        array[$i+1]=${last_numbers[$i]}
    done
    
    last_numbers=("${array[@]}")
    echo "Numbers: ${last_numbers[@]}"
    step=$((step + 1))
done
echo "Good luck!"
echo "Hit: $((win_count * 100 / (step-1)))% Miss : $(((step - win_count - 1) * 100 / (step-1)))%"
