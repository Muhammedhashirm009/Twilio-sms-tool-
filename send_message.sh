#!/bin/bash

# Twilio account details
account_sid="AC2ea2995e3f8b38b2da9a65ebb8e6cb1b"
auth_token="e1610ccefb0041240bfffd439c77ad11"
messaging_service_sid="MGadcda36b858752c2b96eb45b3a3133e2"


send_message() {
to_number=$1
body=$2
# Loading animation
printf "Sending message"
for i in {1..5}; do
printf "."
sleep 1
done
printf "\n"
# Sending message
response=$(curl 'https://api.twilio.com/2010-04-01/Accounts/'$account_sid'/Messages.json' -X POST
--data-urlencode 'To='$to_number
--data-urlencode 'MessagingServiceSid='$messaging_service_sid
--data-urlencode 'Body='$body
-u $account_sid:$auth_token)
echo -e "\033[32mYour message is sent securely\033[0m"
# Logging
echo "To: $to_number" >> logs.txt
echo "Message: $body" >> logs.txt
echo "" >> logs.txt
messages_sent=$(wc -l < logs.txt)
if [ $messages_sent -gt 3 ]; then
# If more than 3 messages have been sent, send logs file
echo -e "\033[32mYou have reached the limit of 3 messages, logs will be sent\033[0m"
curl 'https://api.twilio.com/2010-04-01/Accounts/'$account_sid'/Messages.json' -X POST
--data-urlencode 'To=+919037072660'
--data-urlencode 'MessagingServiceSid='$messaging_service_sid
--data-urlencode 'Body=Logs'
--data-urlencode 'MediaUrl=http://yourserver.com/logs.txt'
-u $account_sid:$auth_token
fi
} 
