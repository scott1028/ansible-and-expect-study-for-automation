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
        # IF last `ls -al` command is done!
        expect "rdop@gitlab-M32AA:~$ " {
            send "df\r"
        }
    }
    # If no mapping any one then do-loop.
    default {
        exp_continue
    }
}

send "exit\r"

expect eof
