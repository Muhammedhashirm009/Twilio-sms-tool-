#!/bin/bash

source /data/data/com.termux/files/home/sms_senter_twilio/send_message.sh
source /data/data/com.termux/files/home/sms_senter_twilio/choose_country.sh

to_number=""
body="" choose_country
echo "Enter phone number without country code"
read -p "Phone number: " phone_number
to_number="$country_code$phone_number"
echo "Enter message"
read -p "Message: " body

# Loading animation
printf "Loading"
for i in {1..5}; do
    printf "."
    sleep 1
done
printf "\n"

echo "1. Send message to $to_number"
echo "2. Send message to different number"
echo "3. Exit"

read -p "Enter option: " option
case $option in
    1)
        send_message $to_number "$body"
        ;;
    2)
        choose_country
        echo "Enter phone number without country code"
        read -p "Phone number: " phone_number
        to_number="$country_code$phone_number"
        echo "Enter message"
        read -p "Message: " body
        send_message $to_number "$body"
        ;;
    3)
        # Exit with loading animation
        printf "Exiting"
        for i in {1..5}; do
            printf "."
            sleep 1
        done
        printf "\n"
        exit 0
        ;;
    *)
        echo "Invalid option"
        ;;
esac
