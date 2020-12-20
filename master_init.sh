#! /usr/bin/env bash

# install useful packages
yum install epel-release -y
yum install ansible -y
yum install sshpass -y

# edit ansible hosts
cat << EOF > /etc/ansible/hosts
[local]
master

[nodes]
node01
node02
EOF
