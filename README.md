### Usage

```
ansible-playbook test-from-script.yml -i inventory.cfg -vvv
```

### Using a SSH password instead of a key is not possible because Host Key checking is enabled and sshpass does not support this.  Please add this host's fingerprint to your known_hosts file to manage this host 問題解法

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
