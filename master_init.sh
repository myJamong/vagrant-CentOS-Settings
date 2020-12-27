#! /usr/bin/env bash

# install useful packages
yum install epel-release -y
yum install ansible -y
yum install sshpass -y

# edit ansible hosts
cat << EOF > /etc/ansible/hosts
[master]
master.puppet.test

[nodes]
node01.puppet.test
node02.puppet.test
EOF
