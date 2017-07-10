### Ansible Usage

```
ansible-playbook test-from-script.yml -i inventory.cfg -vvv
```

- Using a SSH password instead of a key is not possible because Host Key checking is enabled and sshpass does not support this.  Please add this host's fingerprint to your known_hosts file to manage this host 問題解法

```
export ANSIBLE_HOST_KEY_CHECKING=FALSE && ansible-playbook -i inventory.cfg test-multiline-command.yml -vvv
```

```
ansible-playbook -e 'host_key_checking=False' yourplaybook.yml
```

### Reference

- http://stackoverflow.com/questions/24851575/ansible-how-to-pass-multiple-commands
- http://docs.ansible.com/ansible/script_module.html#examples
- http://docs.ansible.com/ansible/intro_inventory.html#list-of-behavioral-inventory-parameters
- https://docs.ansible.com/ansible/list_of_commands_modules.html

### Expect Usage

- Expect是一種將現有的實用程序組合起來的膠合劑，通常考慮的是如何使Expect利用系統現有的工具解決問題而不是如何在Expect中解決問題。

```
 # 假定 $remote_server, $my_user_id, $my_password, 和$my_command 已经读入。

# 向远程服务器请求打开一个telnet会话，并等待服务器询问用户名
spawn telnet $remote_server

expect "username:"
# 输入用户名，并等待服务器询问密码
send "$my_user_id\r"

expect "password:"
# 输入密码，并等待键入需要运行的命令
send "$my_password\r"

expect "%"
# 输入预先定好的密码，等待运行结果
send "$my_command\r"

expect "%"
# 将运行结果存入到变量中，显示出来或者写到磁盘中
set results $expect_out(buffer)

# 退出telnet会话，等待服务器的退出提示EOF
send "exit\r"

expect eof
```