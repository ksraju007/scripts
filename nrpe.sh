#!/bin/bash

if [ $# -lt 1  ] ; then 
  echo "Server IP should be provided as argument"
  exit 1
fi

cd /tmp 
curl -O https://assets.nagios.com/downloads/nagiosxi/agents/linux-nrpe-agent.tar.gz
tar xzf linux-nrpe-agent.tar.gz
cd linux-nrpe-agent
./fullinstall -n -i $1

