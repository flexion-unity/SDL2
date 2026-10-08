#!/bin/bash

expect << 'EOF'
set timeout -1
spawn telnet octopus
expect "login:"
send "root\r"
expect "Password:"
send "p00pp00p\r"
expect "#"
send "cd /root/SDL/irix\r"
expect "#"
send "make\r"
expect "#"
send "exit\r"
expect eof
EOF
