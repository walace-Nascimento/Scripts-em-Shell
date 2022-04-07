#!/bin/bash
#------------------------------------------------------------#
# Script Name: filtrando-resultados-apache.sh
# Description: Faz uma procura de processo em determinado arquivo 
# Linkedin:https://www.linkedin.com/in/walace-nascimento/
# Writen by: Walace Nascimento
#------------------------------------------------------------#

#Primeiro, entramos no arquivo apache-log

cd ~/apache-log

# Validação do IP como expressão regular no site Regex

regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
if [[ $1 =~ $regex ]]
then
	cat apache.log | grep $1
	if [ $? -ne 0 ]
	then
		echo "O endereço IP procurado não está presente no arquivo"
	fi
else
	echo "Formato não é válido"
fi
