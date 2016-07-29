# Otus Domain Api Vagrant

## Pré Requisitos
* [Vagrant](https://www.vagrantup.com/)

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

1. Atribuir Url
      > $ vim /etc/hosts

      **{IP_VAGRANT} {URL}**

      * IP_VAGRANT : Ip atribuido a VM
      * URL : Url que sera utilizada para acesso a VM


2. Iniciar Vagrant API Otus Domain
      > $ vagrant up

3. Realizar Deploy API
      > $ mvn -f otus-domain-root/pom.xml clean install && mvn -f otus-domain-ear/pom wildfly:deploy -Dwildfly-hostname={URL}





