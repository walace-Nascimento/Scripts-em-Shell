#!/bin/bash

#------------------------------------------------------------#
# Script Name: filtro-rquisicao.sh
# Description: Filtra a saída de requisições do usuário
# Linkedin:https://www.linkedin.com/in/walace-nascimento/
# Writen by: Walace Nascimento
#------------------------------------------------------------#

cd ~/apache-log
if [ -z $1 ]
then
	while [ -z $requisicao ]
	do
	read -p "Você esqueceu de colocar o parâmetro (GET, PUT, POST, DELETE): " requisicao
	letra_maiuscula=$(echo $requisicao | awk '{ print toupper($1)}' )
	done
else
	letra_maiuscula=$(echo $1 | awk '{ print toupper($1)} ' )
fi

case $letra_maiuscula in
	GET)
	cat apache.log | grep GET
	;;

	PUT)
	cat apache.log | grep PUT
	;;

	POST)
	cat apache.log | grep POST
	;;

	DELETE)
	cat apache.log | grep DELETE
	;;

	*)
	echo "O parâmetro utilizado não é válido"
	;;
esac

