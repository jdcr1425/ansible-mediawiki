echo "Configurando apache en wiki_web_server"

ansible-playbook -i hosts webserver.yml

echo "Configurando mysql en wiki_mysql_server"

ansible-playbook -i hosts sqlserver.yml

echo "Configurando MediaWiki en wiki_web_server"

ansible-playbook -i hosts mediawiki.yml

echo "Done!"
