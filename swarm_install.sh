#!/bin/bash
# This installs latest swarm software from github on Ubuntu 14.04

msg () {  tput setaf 1; echo  $1 ; tput sgr0 ; }
bail () {   msg "Something went wrong !! . Check the above output." ;   exit 1;    }

#Prepare
msg "Updating apt and installing pre-requisites.."
sudo apt-get -qq update ; sudo apt-get install python-software-properties -y ;

#first, install git and golang
msg "Installing git and golang latest versions.."
sudo add-apt-repository ppa:evarlast/golang1.4  -y 
sudo apt-get -qq update
sudo apt-get install git golang -y || bail

#prepare /opt to hold new tools
export ME=`whoami` ;  export GOPATH="/opt/tools" ;  sudo mkdir -p $GOPATH ; sudo chown $ME $GOPATH ;

#Install godep , this should install godep in $GOPATH/bin/
msg "Installing godep into $GOPATH/bin"
cd $GOPATH ; go get github.com/tools/godep || bail

#get latest release of swarm
msg "Downloading latest stable release of swarm.."
mkdir -p $GOPATH/src/github.com/docker ; cd $GOPATH/src/github.com/docker ;  rm -rf swarm ;
git clone -b release https://github.com/docker/swarm.git || bail ; 

msg "Installing Swarm.."
cd swarm ; $GOPATH/bin/godep go install . || bail

#test version
msg "Testing Swarm version.."
$GOPATH/bin/swarm --version || bail

msg "Now you can start using native swarm from $GOPATH/bin/swarm. Enjoy !"
