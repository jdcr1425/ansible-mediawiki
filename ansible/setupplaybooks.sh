echo "Configurando apache en wiki_web_server"

ansible-playbook -i hosts Apache.yml

echo "Configurando mysql en wiki_mysql_server"

ansible-playbook -i hosts Mysql.yml

echo "Configurando MediaWiki en wiki_web_server"

ansible-playbook -i hosts MediaWiki.yml

echo "Done!"
