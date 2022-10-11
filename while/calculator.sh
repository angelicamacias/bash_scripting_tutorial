#!/bin/bash

echo "Select the following option to continue" 

option=0

while [ $option != 5 ]
do
echo "=================================================================="
echo "OPTIONS: "
echo "press 1 to Add two numbers"
echo "press 2 to substract two numbers"
echo "press 3 to multiply two numbers"
echo "press 4 to divide two numbers"
echo "press 5 to exit the program"

read option

        if [[ $option == 1 ]]; then
                clear
                echo "This screen will return the sum of two values."
                echo ""
                echo "Enter first operand of the sum "
                read num1
                echo "Enter the second operand of the sum "
                read num2
                echo ""
                echo "-> The sum of $num1 and $num2 is $(($num1 + $num2))"
                echo ""
        fi
        if [[ $option == 2 ]]; then
                clear
                echo "This screen will return the substraction of two values."
                echo ""
                echo "Enter first operand of the substraction "
                read num1
                echo "Enter the second operand of the substraction "
                read num2
                echo ""
                echo "-> The substraction of $num1 and $num2 is $(($num1 - $num2))"
                echo ""
        fi
        if [[ $option == 3 ]]; then
                clear
                echo "This screen will return the substr the multiplication of two values."
                echo ""
                echo "Enter first operand of the multiplication"
                read num1
                echo "Enter the second operand of the multiplication"
                read num2
                echo ""
                echo "-> The substraction of $num1 and $num2 is $(($num1 * $num2))"
                echo ""
        fi
        if [[ $option == 4 ]]; then
                clear
                echo "This screen will return the substr the division of two values."
                echo ""
                echo "Enter first operand of the division"
                read num1
                echo "Enter the second operand of the division"
                read num2
                echo ""
                echo "-> The substraction of $num1 and $num2 is $(($num1 / $num2))"
                echo ""
        fi        

done