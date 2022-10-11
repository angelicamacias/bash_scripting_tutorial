#!/bin/bash

M1="Junary"
M2="Febrary"
M3="March"
M4="April"
M5="May"
M6="June"
M7="July"
M8="August"
M9="September"
M10="October"
M11="November"
M12="Dicember"


if [[ $# > 1 ]]; then 
	echo "Just one argument"
	 exit 87 
fi 


if [[ $1 = 1 ]]; then 
	echo "Month $M1"
elif [[ $1 = 2 ]]; then 
	echo "Month $M2"
elif [[ $1 = 3 ]]; then 
	echo "Month $M3"
elif [[ $1 = 4 ]]; then 
	echo "Month $M4"
elif [[ $1 = 5 ]]; then
        echo "Month $M5"
elif [[ $1 = 6 ]]; then
        echo "Month $M6"
elif [[ $1 = 7 ]]; then
        echo "Month $M7"
elif [[ $1 = 8 ]]; then
        echo "Month $M8"
elif [[ $1 = 9 ]]; then
        echo "Month $M9"
elif [[ $1 = 10 ]]; then
        echo "Month $M10"
elif [[ $1 = 11 ]]; then
        echo "Month $M11"
elif [[ $1 = 12 ]]; then
        echo "Month $M12"
elif [[ $1 > 12 ]]; then
	echo "Is not a month"
fi
