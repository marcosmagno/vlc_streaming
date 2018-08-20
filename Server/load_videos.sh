#!/usr/bin/expect -f

#If it all goes pear shaped the script will timeout after 20 seconds.
set timeout 20

set password "1"
set server_name "localhost"
set server_port 4212
set videos_catalog_file "videosComplete.vlm"

#This spawns the telnet program and connects it to the variable name
spawn telnet $server_name $server_port

expect "*?assword:*"
send -- "$password\r"
send -- "del all\r"
send -- "load $videos_catalog_file\r"
send -- "show\r"
send -- "quit\r"
send -- "\r"
expect eof

