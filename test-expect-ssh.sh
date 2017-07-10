#!/usr/bin/expect

set timeout 5

spawn ssh rdop@192.168.1.22

expect {
    "rdop@192.168.1.22's password: " {
        send "${yourpassword}\r"
    }
}

expect {
    "rdop@gitlab-M32AA:~$ " {
        send "ls -al\r"
        exp_continue
    }
    # IF found final file
    "yourdomain.key" {
        send "df\r"
    }
}

send "exit\r"

expect eof
