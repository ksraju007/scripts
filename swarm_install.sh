#!/bin/bash
# This installs latest swarm software from github on Ubuntu 14.04

#first, install git and golang
sudo add-apt-repository ppa:evarlast/golang1.4  -y
sudo apt-get update
sudo apt-get install git golang -y

#prepare /opt to hold new tools
ME=`whoami` ;  GOPATH="/opt/tools" ;  sudo mkdir -p $GOPATH ; sudo chown $ME $GOPATH

#Install godep , this should install godep in $GOPATH/bin/
cd $GOPATH ; go get github.com/tools/godep

#get latest release of swarm
mkdir -p $GOPATH/src/github.com/docker ; cd $GOPATH/src/github.com/docker ; 
git clone -b release https://github.com/docker/swarm.git && cd swarm ;
$GOPATH/bin/godep go install . 

#test version
$GOPATH/bin/swarm --version

echo "Now you can start using native swarm from $GOPATH/bin/swarm. Enjoy !"
