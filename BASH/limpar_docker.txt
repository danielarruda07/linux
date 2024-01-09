#!/bin/bash

# Limpar contêineres não utilizados
docker container prune -f

# Limpar volumes não utilizados
docker volume prune -f

# Limpar redes não utilizadas
docker network prune -f

# Limpar imagens não utilizadas
docker image prune -a -f
