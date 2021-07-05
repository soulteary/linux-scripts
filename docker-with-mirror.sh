#!/bin/bash

# author @soulteary
# date 2021/01/31

apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common

curl -fsSL https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
echo "deb https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update && apt install -y docker-ce

docker -v
