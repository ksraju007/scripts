#!/bin/bash
# Install some common packages in ubuntu 14 that is usually used ( by me )

#prepare
sudo apt-get update 
sudo apt-get install ca-certificates python-software-properties ;

#a better gimp
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp

#pull all packages
sudo apt-get install -y vim screen openssh-server wget curl git \
     geany gimp remmina rdesktop firefox chromium-browser gftp \
     netcat tcpdump sysstat telnet nmap vlc zip unzip unrar acl \
     build-essential remmina-plugin-* gparted rsync aptitude tree \
     geany-plugin-* ethtool gimp-data-extras gimp-plugin-registry \
     flashplugin-installer ubuntu-restricted-extras ps2pdf xpdf \
     imagemagick ufraw gimp-ufraw wine zenity xdg-utils puppet puppet-lint ;
     

# crash report popups, disable apport
sudo sed -i 's/1/0/g' /etc/default/apport
sudo service apport stop

#remove noisy scopes, of course it will work only if we run this in a X enabled env
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"
