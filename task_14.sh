#!/bin/bash

win_count=0
lose_count=0
step=1
all_randon_numbers=(0 0 0 0 0 0 0)
is_playing=true
check_for_number='^[0-9]+$'


echo  "Welcome to a great game.."

while [ "$is_playing" = "true" ]; do
    (( random_number = RANDOM % 10 + 140 ))
    echo "Step: $step"
    read -p "Enter number from (140-149) (q - quit) :" input

    while ! [[ $input =~ $check_for_number ]]; do
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

    if [ "$input" -le "149" ] && [ "$input" -ge "140" ]; then
        if [ "$input" = "$random_number" ]; then
            echo "Congratulations! You guessed it!"
            win_count=$((win_count + 1))
        else
            echo "Sorry, but You lose.. Good luck next!"
        fi
        echo "Hit: $((win_count * 100 / step))% Miss : $(((step - win_count)* 100 / step))%"
    else 
        echo "Please, input correct number from 140 to 149 "
        step=$((step - 1))
    fi
    if [ "$input" = "$random_number" ]; then 
        temp_arr[0]="$random_number+"
    else
        temp_arr[0]="$random_number"
    fi
    for (( i = 0; i < 7; i++ )); do
        temp_arr[$i+1]=${all_randon_numbers[$i]}
    done
    all_randon_numbers=("${temp_arr[@]}")
    echo "Numbers: ${all_randon_numbers[@]}"
    step=$((step + 1))
done
echo "Good luck!"
echo "Hit: $((win_count * 100 / (step-1)))% Miss : $(((step - win_count - 1) * 100 / (step-1)))%"