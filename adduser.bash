#!/bin/bash
#Author:- Nandkumar Patil

# Check if script is run with root privileges
if [[ $(id -u) -ne 0 ]]; then
    echo "This script must be run as root. Please use sudo."
    exit 1
fi

# Define an array of user details
USERS=(
   "vijaym Saturn@8901 /home/vijaym"
   "junaidi Saturn@8901 /home/junaidi"
   "yogendras Saturn@8901 /home/yogendras"
   "rohant Saturn@8901 /home/rohant"
   "prakashs Saturn@8901 /home/prakashs"
   "dnyaneshwark Saturn@8901 /home/dnyaneshwark"
   "shubhamt Saturn@8901 /home/shubhamt"
   "nandkuamrp Saturn@8901 /home/nandkumarp"
)

# Loop through the array and create users
for user_info in "${USERS[@]}"; do
    IFS=' ' read -r username password home_dir <<< "$user_info"

    # Create the user with the adduser command
    adduser --disabled-password --gecos "" $username

    # Set the password for the user
    echo "$username:$password" | chpasswd


    # create the user's home directory
    mkdir -p $home_dir
    chown -R $username:$username $home_dir

    echo "User $username created successfully."
done
