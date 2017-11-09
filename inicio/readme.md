<h1>Configuraciones básicas y creación de dockers<h1>

<h2>Primer paso</h2>

Debes construir un docker personalizado que incluye el servidor openssh

docker build -t server:16.04 .

En el paso anterior debes verificar el ID de la imágen que se creó y seleccionarla para los pasos a continuación.

<h2>Segundo paso, despliege</h2>

Ahora debes crear un conjunto de maquinas para el despliegue, se crearán automáticamente un servidor Apache y uno de bases de datos en mysql.

0.0.0.0:3306->3306/tcp, 0.0.0.0:2222->22/tcp wiki_mysql_server</br>
0.0.0.0:2221->22/tcp, 0.0.0.0:8000->80/tcp     wiki_web_server

<h2>Tercer paso, configuración de alias</h2>

Opción 1: edita el archivo /etc/hosts y adiciona 2 alias a localhost

127.0.0.1       wiki_web_server wiki_mysql_server</br>
Opción 2: adición automática en el archivo de hosts del sistema

echo "127.0.0.1 wiki_web_server wiki_mysql_server" | sudo tee -a /etc/hosts

<h2>Creacion de contenedores</h2>

docker run -d -P --name wiki_web_server -p 2221:22 -p 80:80 server:16.04 

docker run -d -P --name wiki_mysql_server -p 2222:22 -p 3306:3306 server:16.04 

<h2>Conexion por SSH</h2>

<h3>Adicionar las llaves ssh</h3>

ssh -o StrictHostKeyChecking=no root@wiki_web_server -p 2221 -i ../key.private hostname

ssh -o StrictHostKeyChecking=no root@wiki_mysql_server -p 2222 -i ../key.private hostname

<h1>Con construir_docker.sh podemos hacer automaticamente este proceso</h1>

