#!/bin/bash

# Baixar o binário do Docker Compose mais recente para o diretório /usr/local/bin
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Dar permissão de execução ao arquivo baixado
sudo chmod +x /usr/local/bin/docker-compose

# Verificar a versão do Docker Compose instalado
docker-compose --version


