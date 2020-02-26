#!/bin/bash
# This script installs latest version of docker in ubuntu
apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl screen jq vim wget screen zip unzip netcat npm \
    gnupg-agent \
    software-properties-common
 
 npm install -g npx eslint
 
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
 add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
 apt-get update  
 apt-get install -y docker-ce docker-ce-cli containerd.io openjdk-8-jdk
 curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
 chmod +x /usr/local/bin/docker-compose
 
 curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
 sudo apt-get install -y nodejs
 
 docker -v 
 docker-compose -v
 java -version
 

