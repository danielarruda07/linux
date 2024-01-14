#!/bin/bash

# Passo 1: Atualizar os pacotes do sistema
sudo apt update

# Passo 2: Instalar dependências necessárias para o Docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common

# Passo 3: Adicionar a chave GPG do repositório do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Passo 4: Adicionar o repositório do Docker ao sistema
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Passo 5: Atualizar os pacotes após adicionar o repositório
sudo apt update

# Passo 6: Instalar o Docker Community Edition (CE)
sudo apt install docker-ce

# Passo 7: Adicionar o usuário "daniel" ao grupo "docker" para executar comandos Docker
sudo usermod -aG docker daniel
newgrp docker

# Passo 8: Instalar o Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Passo 9: Dar permissão de execução ao usuário para o Docker Compose
sudo usermod -aG docker $USER
newgrp docker
docker-compose --version  # Verificar a versão instalada do Docker Compose



aaaa