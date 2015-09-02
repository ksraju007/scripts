# Creates a ubuntu 14 docker image with ssh server and java preinstalled
# It contains also a useraccount : testuser/testpass
# This container is very useful to run inside Jenkins + Docker + Swarm strategy

FROM ubuntu:14.04
MAINTAINER Rajesh Sivaraman, rajesh.sivaraman@here.com

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq update ; apt-get install software-properties-common -y ; add-apt-repository ppa:webupd8team/java -y ; apt-get -qq update; \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections ; \ 
    apt-get install openssh-server oracle-java7-installer -y; \
    useradd -m testuser ; echo "testuser:testpass" | chpasswd ; \
    mkdir /var/run/sshd ;
EXPOSE 22
