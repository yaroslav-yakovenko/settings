#!/bin/bash
echo " enter domain:";
read domain
sshfs -o ssh_command="ssh -i /root/.ssh/yuri-inf2.pem" root@$domain:/ /media/server/
cd /media/server/
mc
