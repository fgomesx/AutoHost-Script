#!/bin/bash

# Define que o script pare a execução se algum comando retornar um erro
set -e

# Função para lidar com erros e sair do script
handle_error() {
    echo "Erro: $1"
    exit 1
}

echo "Atualizando lista de pacotes disponíveis..."
apt-get update || handle_error "Falha ao atualizar lista de pacotes disponíveis!"
clear

echo "Preparando o servidor web..."
apt-get install apache2 -y || handle_error "Falha ao instalar o Apache!"
echo "Servidor web pronto para uso."

sleep 2
clear

echo "Verificando o Git..."
apt-get install git -y || handle_error "Falha ao instalar o Git!"
echo "Git ok!"

sleep 2
clear

# Solicita a entrada da URL do repositório git
read -p "Digite a URL do repositório Git: " git_repo_url

echo "Clonando repositório..."
cd /tmp
git clone $git_repo_url || handle_error "Falha ao clonar o repositório!"

# Obtém o nome do diretório clonado
repo_name=$(basename $git_repo_url .git)

echo "Repositório clonado!"

sleep 2
clear

echo "Preparando o ambiente..."
cd /tmp
cp -R $repo_name /var/www/html/ || handle_error "Erro ao copiar os arquivos"

apt-get install qrencode -y

echo "Hospedagem local finalizada!"

sleep 2
clear

echo "Hospedagem local finalizada!"
echo 
qrencode -t ANSI256UTF8 -s 3 -m 1 "http://$(hostname -I | cut -d' ' -f1)/$repo_name"
echo
echo "> Escaneie o QR code"
echo "> Ou acesse http://localhost/$repo_name || http://$(hostname -I | cut -d' ' -f1)/$repo_name"