#!/bin/bash

# Prompt for username
read -p "Enter the username: " username

# Check if the user exists
if id "$username" &>/dev/null; then
    echo "User $username already exists."
else
    echo "User $username does not exist."
    exit 1
fi

# Path for the sudoers file
sudoers_file="/etc/sudoers.d/$username"

# Create the sudoers file 
echo "$username ALL=(ALL) NOPASSWD:ALL" | sudo tee "$sudoers_file" > /dev/null

# Set permissions 
sudo chmod 440 "$sudoers_file"

# Verify
ls -l "$sudoers_file"

echo "User $username has been granted passwordless sudo via $sudoers_file."
