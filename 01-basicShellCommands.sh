#! /bin/bash

# SINGLE LINE COMMENT
# this is a single line comment

# ECHO COMMAND
echo "hello world"

: '
this is 
a multi-line
comment'

# VARIABLES
age=48
NAME="Jackie"

# ACCESSING VARIABLE USING dollar $ sign
# echo "My name is $NAME and I am $age years old"
# echo "Variable can also be accessed using dollar sign and paranthesis. For example, My name is ${NAME}."

# USER INPUT
# read -p "Enter your name: " USERNAME
# echo "Hello $USERNAME, nice to meet you!"

#CONDITIONALS
# SIMPLE IF STATEMENT
# if [ "$NAME" == "Brad" ]
# then
#     echo "Your name is Brad"
# fi

# ELSE-IF (elif)
# if [ "$NAME" == "Brad" ]
# then
#     echo "Your name is Brad"
# elif [ "$NAME" == "Jack" ]
# then
#     echo "Your name is Jack"
# else
#     echo "Your name is NEITHER Brad NOR Jack"
# fi

# COMPARISON
########
# val1 -eq val2 Returns true if the values are equal
# val1 -ne val2 Returns true if the values are not equal
# val1 -gt val2 Returns true if val1 is greater than val2
# val1 -ge val2 Returns true if val1 is greater than or equal to val2
# val1 -lt val2 Returns true if val1 is less than val2
# val1 -le val2 Returns true if val1 is less than or equal to val2
########
# if [ $age -gt 15 ]
# then
#     echo "Can buy alcohol"
# else
#     echo "Cannot buy alcohol"
# fi

#if [ $age -gt 11 ] && [ $age -lt 25 ]
#if [[ $age -gt 11 && $age -lt 25 ]]
# if [[ "$age" -gt 11 && "$age" -lt 25 ]]
# then
#     echo "Can get discounted youth ticket"
# else
#     echo "Cannot get youth ticket"
# fi


# OR condition

#if [ "$age" -lt 11 -o "$age" -gt 65 ]
# if [[ "$age" -lt 11 || "$age" -gt 65 ]]
# then
#     echo "Can get discounted ticket"
# else
#     echo "Cannot get discounted ticket"
# fi

# FILE CONDITIONS
########
# -d file   True if the file is a directory
# -e file   True if the file exists (note that this is not particularly portable, thus -f is generally used)
# -f file   True if the provided string is a file
# -g file   True if the group id is set on a file
# -r file   True if the file is readable
# -s file   True if the file has a non-zero size
# -u    True if the user id is set on a file
# -w    True if the file is writable
# -x    True if the file is an executable
########

# CHECK IF THE FILE EXISTS
# FILE="test.txt"
# if [ ! -e $FILE ]
# then
#     echo "$FILE does not exist"
# elif [ -f $FILE ]
# then
#     echo "$FILE is a file"
# else
#     echo "$FILE is not a file"
# fi

# CASE STATEMENTS
# read -p "Are you below 18? Y/N " ANSWER
# case "$ANSWER" in
#     [yY] | [yY][eE][sS])
#         echo "You can have a discounted train ticket"
#         ;;
#     [nN] | [nN][oO])
#         echo "You CANNOT have a discounted train ticket"
#         ;;
#     *)
#         echo "Please enter y/yes or n/no"
#         ;;
# esac

# LOOP
# SIMPLE FOR LOOP
# NAMES="Brad Kenin Alice Mark"
# for NAME in $NAMES
#     do
#         echo "Hello $NAME"
# done

# FOR LOOP TO RENAME FILES
# FILES=$(ls *.txt)
# NEW=new
# for FILE in $FILES
#     do
#         echo "Renaming $FILE to new-$FILE"
#         mv $FILE $NEW-$FILE
# done

# WHILE - READ THROUGH A FILE LINE BY LINE
# BUG: This code does not outputs the content of the file if the file has just 1 line.
# BUG: This code does not outputs the last line of the file
# LINE=1
# while read -r CURRENT_LINE
#     do
#         echo "$LINE: $CURRENT_LINE"
#         ((LINE++))
# done < ./new-2.txt

# FUNCTION
# function sayHello() {
#     echo "Hello World, say Hello"
# }

# # Calling a Function
# sayHello

#FUNCTION WITH PARAMS
# function greet(){
#     echo "Hello. I am $1 and I am $2"
# }
# Invoking the function
# greet "Brad", "36"

# CREATE FOLDER AND WRITE TO A FILE
# mkdir hello
# touch "hello/world.txt"
# echo "Hello World" >> "hello/world.txt"
# echo "Created hello/world.txt"


# MATHS
expr 100 + 50
num1=200
expr $num1 + 20
expr 100 \* 25
num2=300
sum=`expr $var1 + $var2`
# num3=$num1 + $num2
echo "Num3 is $num3"