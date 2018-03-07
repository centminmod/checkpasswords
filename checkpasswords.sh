#!/bin/bash
#####################################################
# modified version of cloudflare shell script example
# https://blog.cloudflare.com/validating-leaked-passwords-with-k-anonymity/
# 
# just pass the password as an option to the script
# i.e.
# 
# ./checkpasswords.sh YOURPASSWORD
# 
# using pwgen generated passwords checking
# 
# ./checkpasswords.sh $(pwgen -1cnys 21)
#####################################################

password=$1
hash="$(echo -n $password | openssl sha1)"
hash=${hash#(stdin)= }
upperCase="$(echo $hash | tr '[a-z]' '[A-Z]')"
prefix="${upperCase:0:5}"
response=$(curl -s https://api.pwnedpasswords.com/range/$prefix)
while read -r line; do
  lineOriginal="$prefix$line"
  if [ "${lineOriginal:0:40}" == "$upperCase" ]; then
    echo "[unsafe] Password found in breached database."
    exit 1
  fi
done <<< "$response"

echo "[safe] Password not found in breached database."
exit 0