#!/usr/bin/env bash

echo "-------- PROVISIONING Wildfly ---------"
echo "---------------------------------------"
if [ ! -f /etc/init.d/wildfly ]; 
then
     cd /opt
     wget http://download.jboss.org/wildfly/9.0.1.Final/wildfly-9.0.1.Final.zip
     unzip wildfly-9.0.1.Final.zip 

     sudo useradd --system --shell /bin/false wildfly
     sudo ln -s wildfly-9.0.1.Final wildfly
     sudo cp /opt/wildfly/bin/init.d/wildfly-init-debian.sh /etc/init.d/wildfly

     sudo chown root:root /etc/init.d/wildfly
     sudo chmod +X /etc/init.d/wildfly

     sudo update-rc.d wildfly defaults
     sudo update-rc.d wildfly enable

     sudo chown -R wildfly:wildfly wildfly-9.0.1.Final/
     sudo chown -R wildfly:wildfly wildfly

     sed -i 's/-c $JBOSS_CONFIG $JBOSS_OPTS/-c $JBOSS_CONFIG -b 0.0.0.0 -bmanagement 0.0.0.0 $JBOSS_OPTS/g' /etc/init.d/wildfly

     sudo service wildfly start
else
     echo "CHECK - Wildfly already installed"
fi


