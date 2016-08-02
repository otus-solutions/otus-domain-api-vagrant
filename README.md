# Otus Api Vagrant

## Pré Requisitos
* [Vagrant](https://www.vagrantup.com/)
* [Virtual Box](https://www.virtualbox.org/)

## Recursos Disponíveis

* Mongo 
> Versão : 2.6.4
> Port : 27017
  
* Wildfly
  > Versão : 9.0.1
  > Port : 8080
  
* Java
  > Versão : 8

## Utilização

1. Iniciar Vagrant API Otus 
      > $ vagrant up

2. Identificar IP 
      > $ vagrant ssh
      > $ ifconfig 

3. Atribuir Url
      > $ vim /etc/hosts

      **{IP_VAGRANT} api-domain.localhost**

      * IP_VAGRANT : Ip atribuido a VM
      * api-domain.localhost : Url que sera utilizada para acesso a VM como padrão. Customizar caso necessário.

4. Realizar Deploy API
      > $ mvn -f otus-root/pom.xml clean install && mvn -f otus-ear/pom wildfly:deploy -Dwildfly-hostname=api-otus.localhost
