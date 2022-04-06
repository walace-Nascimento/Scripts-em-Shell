#!/bin/bash -vx

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
aws s3 sync $CAMINHO_BACKUP s3://walacejesusnascimento-shell


