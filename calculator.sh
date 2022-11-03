sum_function() {

        sum=$(( number1 + number2 ))
}

while true
do
  echo "1. Add"
  echo "2. Subsctract"
  echo "3. Multiply"
  echo "4. Divide"
  echo "5. Average"
  echo "6. Quit"

  read -p "Enter your choice: " choice

  case $choice in
1) echo 
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        sum_function
        echo Answer=$sum
        ;;
2) echo 
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 - $number2 ))
        ;;
3) echo   
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 * $number2 ))
        ;;
4) echo   
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 / $number2 ))
        ;;
5) echo 
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        sum_function
        echo Answer=$(( $sum / 2))
        ;;
6) echo
        break ;;
esac

done
                                                                              47,8          Bot
