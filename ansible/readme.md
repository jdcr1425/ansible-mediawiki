# Cofiguración de Ansible

## Despliegue de MediaWiki

Se instalaran  y configuraran estos  2 servicios : 
<ul>
  <li>Apache</li>
  <li>MySQL</li>
  
</ul>


<h3>Podemos hacer un despliegue automatico usando este script setupplaybooks.sh o podemos seguir la siguiente secuencia de pasos : </h3>
Despues de instalado nos dirigimos a esta url en nuestro navegador http://localhost/media/mw-config/index.php.


<h3>Primer paso, instalación de los servidores web y de archivos.</h3>


### -instalamos el servidor web en el wiki_web_server

utilizamos el sguiente comando en nuestra consola : 

ansible-playbook -i ../hosts webserver.yml

<h3>Segundo paso, instalación del servidor Mysql.</h3>

### -Intalamos el servidor mysql en el wiki_mysql_server

utilizamos el sguiente comando en nuestra consola : 

ansible-playbook -i ../hosts sqlserver.yml

Para verificar si la instalacion fue correcta entramos al servidor : 

utilizamos el sguiente comando en nuestra consola : 

ssh root@server02 -p 2222 -i ../key.private

y ejecutamos : 

utilizamos el sguiente comando en nuestra consola : 

mysql -h localhost -u root -p

y deberia salir esto :

      mysql> <aqui iria los comandos>


<h2>Ya con esto podriamos hacer la instalacion de MediaWiki</h2>


<h2>Instalacion de MediaWiki</h2>

### -Intalamos MediaWiki en el wiki_web_server

utilizamos el sguiente comando en nuestra consola : 

ansible-playbook -i ../hosts mediawiki.yml

Despues de instalado nos dirigimos a esta url en nuestro navegador http://localhost/media/mw-config/index.php

<h3>Clave de actualizacion : cca018cf3ac53a62</h3>



