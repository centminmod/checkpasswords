Modified version of Cloudflare shell script example [here](https://blog.cloudflare.com/validating-leaked-passwords-with-k-anonymity/)


Just pass the password as an option to the script

i.e.
 
    ./checkpasswords.sh YOURPASSWORD

example of weak password found in breached database

    ./checkpasswords.sh 123                           
    [unsafe] Password found in breached dataabase.

example of stronger unique password not found in breached databased

    ./checkpasswords.sh OVIgdv2Ttn9ep5zs1pM76
    [safe] Password not found in breached database.

using pwgen generated passwords checking
 
    ./checkpasswords.sh $(pwgen -1cnys 21)

output

    ./checkpasswords.sh $(pwgen -1cnys 21)
    [safe] Password not found in breached database.