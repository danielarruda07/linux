#!/bin/bash

# Desinstalar o Apache2 e suas ferramentas
sudo apt-get purge apache2 apache2-utils

# Remover diretório de configuração do Apache2
sudo rm -rf /etc/apache2

# Remover logs do Apache2
sudo rm -rf /var/log/apache2

# Listar pacotes relacionados ao Apache2
packages=$(dpkg -l | grep apache | awk '{print $2}')

# Remover pacotes adicionais relacionados ao Apache2
if [ -n "$packages" ]; then
    echo "Removendo pacotes adicionais relacionados ao Apache2..."
    sudo apt-get purge $packages
fi

echo "Desinstalação completa do Apache2 concluída."
