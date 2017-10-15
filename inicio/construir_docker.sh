#!/bin/bash

echo "Creando imagen del sistema "

docker build -t server:16.04 .

echo "configuración de alias wiki_web_server y wiki_mysql_server "

echo "127.0.0.1 wiki_web_server wiki_mysql_server" | sudo tee -a /etc/hosts

echo "Desplegando contenedores"

docker run -d -P --name wiki_web_server -p 2221:22 -p 80:80 server:16.04

docker run -d -P --name wiki_mysql_server -p 2222:22 -p 3306:3306 server:16.04

echo "permisos a la llave privada "

chmod 0600 ../key.private

echo "Registrando contenedores en known_hosts de ssh"

ssh -o StrictHostKeyChecking=no root@wiki_web_server -p 2221 -i ../key.private hostname

ssh -o StrictHostKeyChecking=no root@wiki_mysql_server -p 2222 -i ../key.private hostname

echo " Contenedores listos, seguir con ansible" 
