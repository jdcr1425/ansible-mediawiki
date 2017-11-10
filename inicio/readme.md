<h1>Configuraciones básicas y creación de dockers<h1>


<h3>Para hacer la configuracion y creacion de nuestros dockers podemos usar el script que esta en esta carpeta, llamado  construir_docker.sh el cual, automatizaria este proceso. Sino, podemos seguir los pasos que estan a continuacion</h3>

<h2>Primer paso</h2>

Debes construir un docker personalizado que incluye el servidor openssh

-Con nuestro Dockerfile construiremos la imagen de nuestros dockers. 

Usamos el siguiente comando en nuestra consola: 
docker build -t server:16.04 .


<h2>Segundo paso, despliege</h2>

Ahora debes crear un conjunto de maquinas para el despliegue, se crearán automáticamente un servidor Apache y uno de bases de datos en mysql.

Usamos los siguientes comandos en nuestra consola: 

docker run -d -P --name wiki_web_server -p 2221:22 -p 80:80 server:16.04 

docker run -d -P --name wiki_mysql_server -p 2222:22 -p 3306:3306 server:16.04 


Estas serian nuestras 2 maquinas creadas:

0.0.0.0:3306->3306/tcp, 0.0.0.0:2222->22/tcp   wiki_mysql_server</br>
0.0.0.0:2221->22/tcp, 0.0.0.0:8000->80/tcp     wiki_web_server

<h2>Tercer paso, configuración de alias</h2>

Opción 1: edita el archivo /etc/hosts y adiciona 2 alias a localhost

127.0.0.1       wiki_web_server wiki_mysql_server</br>

Opción 2: adición automática en el archivo de hosts del sistema

Usamos el siguiente comando en nuestra consola: 

echo "127.0.0.1 wiki_web_server wiki_mysql_server" | sudo tee -a /etc/hosts

<h2>Conexion por SSH</h2>

<h3>Adicionar las llaves ssh</h3>

Usamos los siguientes comandos en nuestra consola: 

ssh -o StrictHostKeyChecking=no root@wiki_web_server -p 2221 -i ../key.private hostname

ssh -o StrictHostKeyChecking=no root@wiki_mysql_server -p 2222 -i ../key.private hostname



