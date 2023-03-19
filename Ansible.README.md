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
ansible all -i ansible/hosts.ini -m ping

ansible production -i ansible/hosts.ini -m ping
ansible production -i ansible/hosts.yml -m ping
```
