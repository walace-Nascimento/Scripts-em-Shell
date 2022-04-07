#!/bin/bash

#------------------------------------------------------------#
# Script Name: monitaracao-servidor.sh
# Description: monitora quando o servidor tem algum problema
# Linkedin:https://www.linkedin.com/in/walace-nascimento/
# Writen by: Walace Nascimento
#------------------------------------------------------------#

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)
if [ $resposta_http -ne 200 ]
then
mail -s "Porblema no servidor" [seu email]<<del
Houve um problema no servidor e os usuários pararam de ter acesso ao conteúdo web.
del
	systemctl restart apache2
fi



