#! /bin/bash

read -p "Enter your name: " NAME
echo "Welcome ${NAME}"

# setting the NAME variable as readonly.
readonly NAME
NAME="Abhikriti" # cannot update the variable as it is readonly
echo "Exit status of the command: $?"

# intializing a readonly variable
readonly SERVICE="create-user"
echo "The service name is ${SERVICE}"

# cannot update the value of the variable SERVICE as it is readonly
SERVICE="update-user"

# do not show the user input on the screen
read -s -p "Enter your password: " PASSWORD
echo "Your password is ${PASSWORD}"

echo "End of script"