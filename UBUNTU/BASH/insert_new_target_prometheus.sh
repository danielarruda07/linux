# Adicionando um novo target ao arquivo prometheus.yml
NEW_TARGET="  - job_name: 'novo-target'
    static_configs:
      - targets: ['192.168.18.201:9100']  # TROCAR PELO IP E PORTA NO NOVO IC A SER MONITORADO
"

echo "$NEW_TARGET" >> prometheus.yml

# Recarregando a configuração do Prometheus
docker exec -it prometheus /bin/sh -c "kill -HUP 1"
