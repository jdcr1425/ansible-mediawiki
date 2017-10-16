# Cofiguración de Ansible

## Despliegue de MediaWiki

Se instalaran  y configuraran estos  2 servicios : 
<ul>
  <li>Apache</li>
  <li>MySQL</li>
  
</ul>

<h3>Primer paso, instalación de los servidores web y de archivos.</h3>


### -instalamos el servidor web en el wiki_web_server

ansible-playbook -i ../hosts webserver.yml

<h3>Segundo paso, instalación del servidor Mysql.</h3>

### -Intalamos el servidor mysql en el wiki_mysql_server

ansible-playbook -i ../hosts sqlserver.yml

Para verificar si la instalacion fue correcta entramos al servidor : 

ssh root@server02 -p 2222 -i ../key.private

y ejecutamos : 

mysql -h localhost -u root -p

y deberia salir esto :

      mysql> <aqui iria los comandos>


<h2>Ya con esto podriamos hacer la instalacion de MediaWiki</h2>


<h2>Instalacion de MediaWiki</h2>

### -Intalamos MediaWiki en el wiki_web_server

ansible-playbook -i ../hosts mediawiki.yml

<h3>Clave de actualizacion : cca018cf3ac53a62</h3>

<h1>setupplaybooks.sh nos ayuda con este proceso</h1>


Despues de instalado nos dirigimos a esta url en nuestro navegador http://localhost/media/mw-config/index.php.
