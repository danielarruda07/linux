#!/bin/bash

# Conteúdo para o arquivo prometheus.yml
PROMETHEUS_CONFIG="global:
  scrape_interval: 15s
scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['192.168.18.200:9090']  # Este é o job já existente
  - job_name: 'node-exporter'
    static_configs:
      - targets: ['192.168.18.200:9100']  # Novo job para o Node Exporter remoto"

# Criação do arquivo prometheus.yml
echo "$PROMETHEUS_CONFIG" > prometheus.yml

# Inicia o contêiner do Prometheus com o arquivo de configuração
docker run -d --name prometheus -p 9090:9090 -v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus

# Inicia o contêiner do Node Exporter
docker run -d --name=node-exporter -p 9100:9100 prom/node-exporter

echo "Contêiner do Prometheus iniciado. Acesse em: http://localhost:9090"



#Esse script Bash agora, além de iniciar o contêiner do Prometheus, também inicia o contêiner do Node Exporter usando o comando docker run. Isso faz com que o Node Exporter esteja disponível na porta #9100 do host local.

#Lembre-se de ter as imagens do Prometheus e Node Exporter disponíveis localmente ou acessíveis por meio do Docker Hub para que os contêineres sejam iniciados corretamente. Certifique-se de ter #permissões de execução no script antes de executá-lo.