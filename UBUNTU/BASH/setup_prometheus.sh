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

echo "Contêiner do Prometheus iniciado. Acesse em: http://localhost:9090"
