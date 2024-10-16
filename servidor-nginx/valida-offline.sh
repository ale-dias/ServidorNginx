#!/bin/bash

SERVICE_NAME="Nginx"

SERVICE_URL="http://localhost"

# Diretório onde o resultado será encontrado
OUTPUT_DIR="/home/alessandra/projetos/compass/servidor-nginx"

# Arquivo de log (que também armazenará os resultados)
LOG_FILE="$OUTPUT_DIR/valida-offline.log"

# Verifica se o diretório de saída existe, se não, cria
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
fi

# Registra o início da execução no log
echo "$(date '+%Y-%m-%d %H:%M:%S') - Iniciando verificação do serviço $SERVICE_NAME" >> "$LOG_FILE"

# Verifica se o serviço está online usando o caminho completo do curl
STATUS=$(/usr/bin/curl -s -o /dev/null -w "%{http_code}" "$SERVICE_URL")

# Grava o resultado da verificação no log
if [ "$STATUS" -ne 200 ]; then
    MESSAGE="$(date '+%Y-%m-%d %H:%M:%S') - Serviço $SERVICE_NAME está offline."
fi

# Escreve a mensagem no arquivo de log
echo "$MESSAGE" >> "$LOG_FILE"
