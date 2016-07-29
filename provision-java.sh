#!/usr/bin/env bash

echo "-------- PROVISIONING JAVA ------------"
echo "---------------------------------------"
if [ ! -f /usr/lib/jvm/java-8-oracle/bin/java ]; 
then
     sudo add-apt-repository ppa:webupd8team/java
     sudo apt-get update -qq
     echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
     echo debconf shared/accepted-oracle-license-v1-1 seen true | /usr/bin/debconf-set-selections
     sudo apt-get install --yes oracle-java8-installer
     yes "" | apt-get -f install
else
     echo "CHECK - Java already installed"
fi


