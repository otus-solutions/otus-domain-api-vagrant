#!/usr/bin/env bash

echo "-------- PROVISIONING UNZIP ------------"
echo "---------------------------------------"
if [ ! -f /usr/bin/unzip ]; 
then
     sudo apt-get install --yes unzip
else
     echo "CHECK - Unzip already installed"
fi


