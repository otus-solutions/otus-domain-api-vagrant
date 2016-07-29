Otus Domain API

1º Iniciar Vagrant API Otus Domain
   $ vagrant up

2º Realizar Deploy API
   $ mvn -f otus-domain-root/pom.xml clean install  && mvn -f otus-domain-ear/pom wildfly:deploy

3º Atribuir Url
   $ vim /etc/hosts
      {IP_VAGRANT} {URL}

   IP_VAGRANT : Ip atribuido a VM
   URL        : Url que sera utilizada para acesso a VM


