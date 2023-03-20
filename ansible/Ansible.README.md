### Install Ansible

```
$ brew install ansible
```

```
$ ansible --version
ansible [core 2.14.3]
```

### Get in the Container via SSH

```
ssh -i assets/ssh-key/id_rsa root@localhost -p 2222
```

### Ping From Host

```
ansible all -i hosts.ini -m ping

ansible production -i hosts.ini -m ping
ansible production -i hosts.yml -m ping
```

### To See Full Inventory

```
ansible-inventory --list
```

```
$ ansible-inventory --graph

@all:
  |--@ungrouped:
  |--@production:
  |  |--server1
```

### Get Servers' Info

```sh
ansible production -m setup
```


```sh
ansible production -m setup | grep ansible_os_family
```

### Perform a Command

```
ansible production -m shell -a "ls -al"
```
