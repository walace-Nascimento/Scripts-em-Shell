#!/bin/bash

#------------------------------------------------------------#
# Script Name: processos-memoria-alocada.sh
# Description: identica o processo e a quantidade de memória alocada 
# Linkedin:https://www.linkedin.com/in/walace-nascimento/
# Writen by: Walace Nascimento
#------------------------------------------------------------#

#Primeiro, é necessário verficar se existi um repostório 

if [ ! -d log ]
then
	mkdir log
fi

#Criar uma função para encontrar o processo, a data e a memória do processo

processos_memoria(){
processos=$( ps -e -o pid --sort -size | head -n 11 | grep [0-9])
for pid in $processos
do
	nome_processo=$(ps -p $pid -o comm=)
	echo -n $(date +%F,%H:%M:%S,) >> log/$nome_processo.log
	tamanho_processo=$(ps -p $pid -o size | grep [0-9])
	echo "$(bc <<< "scale=2;$tamanho_processo/1024") MB" >> log/$nome_processo.log
done
}
processos_memoria

# Utilizando um status de saída

if [ $? -eq 0 ]
then
	echo "Os arquivos foram salvos com sucesso"
else
	echo "Houve um problema na hora de salvar os arquivos"
fi

