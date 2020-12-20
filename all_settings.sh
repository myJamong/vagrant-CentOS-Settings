#! /usr/bin/env bash

# install useful packages
yum install net-tools vim -y

# edit hosts
cat << EOF > /etc/hosts
127.0.0.1 localhost
::1 localhost
222.111.71.100 master
222.111.71.101 node01
222.111.71.102 node02
EOF

# ssh password Authentication no to yes
sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd

ROOT_HOME=/root
VAGRANT_HOME=/home/vagrant

# create .ssh for root
mkdir -p $ROOT_HOME/.ssh
chmod 700 $ROOT_HOME/.ssh
touch $ROOT_HOME/.ssh/authorized_keys
chmod 644 $ROOT_HOME/.ssh/authorized_keys
