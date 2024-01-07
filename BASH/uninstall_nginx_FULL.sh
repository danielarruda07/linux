#!/bin/bash

# Desinstalar o Nginx
sudo apt-get purge nginx

# Remover diretório de configuração do Nginx
sudo rm -rf /etc/nginx

# Listar pacotes relacionados ao Nginx
packages=$(dpkg -l | grep nginx | awk '{print $2}')

# Remover pacotes adicionais relacionados ao Nginx
if [ -n "$packages" ]; then
    echo "Removendo pacotes adicionais relacionados ao Nginx..."
    sudo apt-get purge $packages
fi

echo "Desinstalação completa do Nginx concluída."
