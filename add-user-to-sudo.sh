#!/bin/bash

# Prompt for username
read -p "Enter the username: " username

# Check if user exists
if id "$username" &>/dev/null; then
    echo "User $username already exists."
else
    echo "User $username does not exist."
    exit 1
fi

# Check if 'wheel' group exists
if grep -qE '^(wheel):' /etc/group; then
    if usermod -aG wheel "$username" &>/dev/null; then
        echo "User $username added to the 'wheel' group successfully."
    else
        echo "Failed to add $username to 'wheel' group."
    fi
else
    echo "'wheel' group does not exist."
fi

# Check if 'sudo' group exists
if grep -qE '^(sudo):' /etc/group; then
    if usermod -aG sudo "$username" &>/dev/null; then
        echo "User $username added to the 'sudo' group successfully."
    else
        echo "Failed to add $username to 'sudo' group."
    fi
else
    echo "'sudo' group does not exist."
fi

echo "Bye"
