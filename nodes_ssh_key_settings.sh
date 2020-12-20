#! /usr/bin/env bash

ssh-keygen -t rsa -N '' -f /root/.ssh/id_rsa <<< n

# copy to nodes for root user
sshpass -p vagrant scp -o StrictHostKeyChecking=no /root/.ssh/id_rsa.pub root@node01:/root/id_rsa.pub
sshpass -p vagrant ssh -o StrictHostKeyChecking=no root@node01 "grep -q -f /root/id_rsa.pub /root/.ssh/authorized_keys || cat /root/id_rsa.pub >> /root/.ssh/authorized_keys"
sshpass -p vagrant ssh -o StrictHostKeyChecking=no root@node01 "rm -rf /root/id_rsa.pub"
sshpass -p vagrant scp -o StrictHostKeyChecking=no /root/.ssh/id_rsa.pub root@node02:/root/id_rsa.pub
sshpass -p vagrant ssh -o StrictHostKeyChecking=no root@node02 "grep -q -f /root/id_rsa.pub /root/.ssh/authorized_keys || cat /root/id_rsa.pub >> /root/.ssh/authorized_keys"
sshpass -p vagrant ssh -o StrictHostKeyChecking=no root@node02 "rm -rf /root/id_rsa.pub"

# copy to nodes for vagrant user
sshpass -p vagrant scp -o StrictHostKeyChecking=no /root/.ssh/id_rsa.pub vagrant@node01:/home/vagrant/id_rsa.pub
sshpass -p vagrant ssh -o StrictHostKeyChecking=no vagrant@node01 "grep -q -f /home/vagrant/id_rsa.pub /home/vagrant/.ssh/authorized_keys || cat /home/vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
sshpass -p vagrant ssh -o StrictHostKeyChecking=no vagrant@node01 "rm -rf /home/vagrant/id_rsa.pub"
sshpass -p vagrant scp -o StrictHostKeyChecking=no /root/.ssh/id_rsa.pub vagrant@node02:/home/vagrant/id_rsa.pub
sshpass -p vagrant ssh -o StrictHostKeyChecking=no vagrant@node02 "grep -q -f /home/vagrant/id_rsa.pub /home/vagrant/.ssh/authorized_keys || cat /home/vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
sshpass -p vagrant ssh -o StrictHostKeyChecking=no vagrant@node02 "rm -rf /home/vagrant/id_rsa.pub"


touch /root/testx.txt
echo 'asdasd' >> /root/testx.txt
