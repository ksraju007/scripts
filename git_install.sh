#!/bin/bash
# For insalling latest git version for ubuntu

#Prepare
sudo apt-get update ; sudo apt-get install python-software-properties -y ;

#Add PPA
sudo add-apt-repository ppa:git-core/ppa -y &&  sudo apt-get update ;
sudo apt-get install git -y

echo "Testing git version"
git --version

echo "Finished"
