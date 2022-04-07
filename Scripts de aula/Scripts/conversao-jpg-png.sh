#! /bin/bash
#------------------------------------------------------------#
# Script Name: conversao-jpg-png.sh
# Description: convertion imagens
# Linkedin:https://www.linkedin.com/in/walace-nascimento/
# Writen by: Walace Nascimento
#------------------------------------------------------------#

# Faz a busca dos arquivos e cria-se um diretório para armazená-los

converte_imagem(){
cd ~/Downloads/imagens_livros
if [ ! -d png ]
then
	mkdir png
fi

for imagem in *.jpg
do
	local imagem_sem_extensao=$(ls imagem | awk -F. '{print $1}' )
	convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
done
}

#Utilizando o status de saída e a descrição de arquivos

converte_imagem 2>erros.txt
if [ $? -eq 0 ]
then
	echo "Conversão realizada com sucesso"
else
	echo "Houve uma falha no processo"
fi

