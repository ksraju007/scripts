#!/bin/bash
# This script installs latest version of docker in ubuntu
# TODO : Add CentOS Support

echo Installing/Updating Curl
sudo apt-get update
sudo apt-get install curl

echo Installing Docker
curl -sSL https://get.docker.com/ | sh

echo Testing Docker
sudo docker run hello-world

echo "If you want to enable your current user to use docker, run the below command."
echo "sudo usermod -aG docker <username>"
echo "After you run the command, please logout and login"
