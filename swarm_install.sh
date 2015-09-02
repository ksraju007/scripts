#!/bin/bash
# This installs latest swarm software from github on Ubuntu 14.04

#Prepare
echo Updating apt and installing pre-requisites..
sudo apt-get -qq update ; sudo apt-get install python-software-properties -y ;

#first, install git and golang
echo Installing git and golang latest versions..
sudo add-apt-repository ppa:evarlast/golang1.4  -y
sudo apt-get -qq update
sudo apt-get install git golang -y

#prepare /opt to hold new tools
export ME=`whoami` ;  export GOPATH="/opt/tools" ;  sudo mkdir -p $GOPATH ; sudo chown $ME $GOPATH ;

#Install godep , this should install godep in $GOPATH/bin/
echo Installing godep into $GOPATH/bin
cd $GOPATH ; go get github.com/tools/godep

#get latest release of swarm
echo Downloading latest stable release of swarm..
mkdir -p $GOPATH/src/github.com/docker ; cd $GOPATH/src/github.com/docker ;  rm -rf swarm ;
git clone -b release https://github.com/docker/swarm.git ; cd swarm ;
echo Installing Swarm..
$GOPATH/bin/godep go install . 

#test version
echo Testing Swarm version..
$GOPATH/bin/swarm --version

if [ $? -eq 0  ] ; then
echo "Now you can start using native swarm from $GOPATH/bin/swarm. Enjoy !"
else
echo "Something went wrong !!"
fi

