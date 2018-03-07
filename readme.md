Modified version of Cloudflare shell script example [here](https://blog.cloudflare.com/validating-leaked-passwords-with-k-anonymity/)


Just pass the password as an option to the script

i.e.
 
    ./checkpasswords.sh YOURPASSWORD

 using pwgen generated passwords checking
 
    ./checkpasswords.sh $(pwgen -1cnys 21)

output

    ./checkpasswords.sh $(pwgen -1cnys 21)
    [safe] Password not found in breached database.