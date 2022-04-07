#!/bin/bash

#------------------------------------------------------------#
# Script Name: backup-amazon.sh
# Description: Realiza o backup de um ditetório para o bucket da AWS
# Linkedin:https://www.linkedin.com/in/walace-nascimento/
# Writen by: Walace Nascimento
#------------------------------------------------------------#

CAMINHO_BACKUP=/home/walace/backup_amazon
cd CAMINHO_BACKUP
data=$(date +%F)
if [ ! -d $data ]
then
	mkdir $data
fi

tabelas=$(sudo mysql -u root multilidae -e "show tables;" | grep -v Tables)
for tabela in $tabelas
do
	mysqldump -u root multilidae $tabela >$CAMINHO_BACKUP/$data/$tabela.sql
done
aws s3 sync $CAMINHO_BACKUP s3://[seu bucket]


