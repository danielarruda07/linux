#!/bin/bash

echo "Status antes da limpeza:"
echo "========================="
echo "Contêineres:"
docker ps -a

echo "Volumes:"
docker volume ls

echo "Redes:"
docker network ls

echo "Imagens:"
docker images -a

echo "Realizando a limpeza..."

# Limpar contêineres não utilizados
docker container prune -f

# Limpar volumes não utilizados
docker volume prune -f

# Limpar redes não utilizadas
docker network prune -f

# Limpar imagens não utilizadas
docker image prune -a -f

echo "Status após a limpeza:"
echo "========================="
echo "Contêineres:"
docker ps -a

echo "Volumes:"
docker volume ls

echo "Redes:"
docker network ls

echo "Imagens:"
docker images -a
