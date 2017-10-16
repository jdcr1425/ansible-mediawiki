#!/bin/bash


echo " Eliminando contenedores wiki_web_server  wiki_mysql_server"

docker container rm wiki_web_server wiki_mysql_server -f

echo "Recreando contenedores wiki_web_server wiki_mysql_server "

docker run -d -P --name wiki_web_server -p 2221:22 -p 80:80 server:16.04
docker run -d -P --name wiki_mysql_server -p 2222:22 -p 3306:3306 server:16.04

echo "Contenedores recreados"
