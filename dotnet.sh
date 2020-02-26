#!/bin/bash
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
add-apt-repository universe
apt-get update
apt-get install -y apt-transport-https 
apt-get update
apt-get install -y dotnet-sdk-3.1  dotnet-sdk-2.1
useradd builder
chsh -s /bin/bash builder

echo creating builder user and creating ssh key
useradd -m builder
chsh -s /bin/bash builder
su -c "dotnet tool install --global dotnet-sonarscanner --version 4.7.1" -l builder
su -c "ssh-keygen -t rsa -N '' -f /home/builder/.ssh/id_rsa"  -l builder
su -c "cp /home/builder/.ssh/id_rsa.pub /home/builder/.ssh/authorized_keys" -l builder
cat /home/builder/.ssh/id_rsa
echo "copy the above key to jenkins as a private key credential to configure hosts."
