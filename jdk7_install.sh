#!/bin/bash
# This install oracle jdk 7 for ubuntu

#prepare
sudo apt-get update 
sudo apt-get install ca-certificates python-software-properties ;

#install
sudo add-apt-repository ppa:webupd8team/java -y 
sudo apt-get update
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install oracle-java7-installer -y

#check
java -version

