#!/bin/bash
# This installs latest swarm software from github on Ubuntu 14.04

#Prepare
sudo apt-get update ; sudo apt-get install python-software-properties -y ;

#first, install git and golang
sudo add-apt-repository ppa:evarlast/golang1.4  -y
sudo apt-get update
sudo apt-get install git golang -y

#prepare /opt to hold new tools
export ME=`whoami` ;  export GOPATH="/opt/tools" ;  sudo mkdir -p $GOPATH ; sudo chown $ME $GOPATH ;

#Install godep , this should install godep in $GOPATH/bin/
cd $GOPATH ; go get github.com/tools/godep

#get latest release of swarm
mkdir -p $GOPATH/src/github.com/docker ; cd $GOPATH/src/github.com/docker ;  rm -rf swarm ;
git clone -b release https://github.com/docker/swarm.git ; cd swarm ;
$GOPATH/bin/godep go install . 

#test version
$GOPATH/bin/swarm --version

echo "Now you can start using native swarm from $GOPATH/bin/swarm. Enjoy !"
