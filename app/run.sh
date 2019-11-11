#!/bin/sh

cp /share/ssh/* ~/.ssh/
eval `ssh-agent -s` > /dev/null 2>&1
ssh-add ~/.ssh/id_rsa > /dev/null 2>&1

echo "  - Checking dil compliance..."
./inspect.sh dil
echo "  - Checking Docker compliance..."
./inspect.sh docker
echo "  - Checking Kubernetes compliance..."
./inspect.sh kubernetes
