#!/usr/bin/env bash

#Mongo
echo "-------- PROVISIONING Mongo ---------"
echo "---------------------------------------"
if [ ! -f /usr/bin/mongo ]; then

locale-gen UTF-8
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list && \
apt-get update && \
apt-get install mongodb-org=2.6.4 mongodb-org-server=2.6.4 mongodb-org-shell=2.6.4 mongodb-org-mongos=2.6.4 mongodb-org-tools=2.6.4 && \
echo "mongodb-org hold" | dpkg --set-selections && \
echo "mongodb-org-server hold" | dpkg --set-selections && \
echo "mongodb-org-shell hold" | dpkg --set-selections && \
echo "mongodb-org-mongos hold" | dpkg --set-selections && \
echo "mongodb-org-tools hold" | dpkg --set-selections && \
sed -i '/bind_ip = 127.0.0.1/,/bind_ip\ =\ 127\.0\.0\.1/s/^/#/' /etc/mongod.conf && \
sed -i 's/##auth = true/auth = true/g' /etc/mongod.conf && \
echo "db.createUser({user:'otus', pwd:'otus', roles:['dbOwner']})" | mongo otus-domain && \
echo "db.createUser({user:'admin', pwd:'admin', roles:['root']})" | mongo admin  && \
service mongod restart

else
     echo "CHECK - Mongo already installed"
fi

