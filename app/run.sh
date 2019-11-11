#!/bin/sh

cp /share/ssh/* ~/.ssh/
eval `ssh-agent -s` > /dev/null 2>&1
ssh-add ~/.ssh/id_rsa > /dev/null 2>&1

./inspect.sh kubernetes
./inspect.sh docker
./inspect.sh dil
