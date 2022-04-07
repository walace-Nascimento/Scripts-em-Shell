#!/bin/bash
#------------------------------------------------------------#
# Script Name: backuo-dados-mysql.sh
# Description: realiza o backup de arquivo mysql
# Linkedin:https://www.linkedin.com/in/walace-nascimento/
# Writen by: Walace Nascimento
#------------------------------------------------------------#

CAMINHO_HOME=/home/walace
cd $CAMINHO_HOME

if [ ! -d backup ]
then
	mkdir backup
fi
mysqldump -u root $1 > $CAMINHO_HOME/backup/$1.sql

if [ $? -eq  0 ]
then
	echo "Backup realizado com sucesso"
else
	echo "Houve um problema no backup"
fi

