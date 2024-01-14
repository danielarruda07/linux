#!/bin/bash

# Conteúdo para o arquivo prometheus.yml
PROMETHEUS_CONFIG="global:
  scrape_interval: 15s
scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['192.168.18.200:9090']  # ALTERAR O IP PARA O QUAL ESTÁ SENDO INSTALADO
  - job_name: 'node-exporter'
    static_configs:
      - targets: ['192.168.18.200:9100']  # ALTERAR O IP PARA O QUAL ESTÁ SENDO INSTALADO

# Criação do arquivo prometheus.yml
echo "$PROMETHEUS_CONFIG" > prometheus.yml

# Inicia o contêiner do Prometheus com o arquivo de configuração
docker run -d --name prometheus -p 9090:9090 -v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus

# Inicia o contêiner do Node Exporter
docker run -d --name=node-exporter -p 9100:9100 prom/node-exporter

# Inicia o contêiner do Grafana
docker run -d --name=grafana -p 3000:3000 grafana/grafana

echo "Contêineres do Prometheus, Node Exporter e Grafana iniciados."
echo "Acesse o Prometheus em: http://IPDOSERVIDOR:9090"
echo "Acesse o Grafana em: http://IPDOSERVIDOR:3000"
