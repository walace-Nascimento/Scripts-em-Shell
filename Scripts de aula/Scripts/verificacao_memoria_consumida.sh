#!/bash/bin
#------------------------------------------------------------#
# Script Name: verificação_memória_consumida.sh
# Description: Relação entre memória total e consumida
# Linkedin:https://www.linkedin.com/in/walace-nascimento/
# Writen by: Walace Nascimento
#------------------------------------------------------------#

# Identifar a memória toral e a consumida do processo

memoria_total=$(free | grep -i mem | awk '{print $2}')
memoria_consumida=$(free | grep -i mem | awk '{print $3}')
relacao_memoria_atual_total=$(bc <<< "scale=2;$memoria_total/$memoria_consumida *100"| awk -F. '{print $1}')
 if [ $relacao_memoria_atual_total -gt 40 ]
then
mail -s "Consumo de memória está acima do limite" walace.j.nascimento29@gmail.com<<del
O consumo de memória está acima do limite que foi especificado. Atualmente o consumo e de $(free -h | grep -i mem | awk '{ print$3} ')
del

fi


