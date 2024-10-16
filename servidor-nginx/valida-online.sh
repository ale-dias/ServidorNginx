#!/bin/bash

SERVICE_NAME="Nginx"

# URL do serviço que você deseja verificar
SERVICE_URL="http://localhost"

# Diretório onde o resultado será encontrado
OUTPUT_DIR="/home/alessandra/projetos/compass/servidor-nginx"

# Arquivo de log
LOG_FILE="$OUTPUT_DIR/valida-online.log"

# Verifica se o diretório de saída existe, se não, cria
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
fi

# O resultado será salvo aqui
OUTPUT_FILE="$OUTPUT_DIR/status-nginx-online.txt"

# Registra o início da execução no log
echo "$(date '+%Y-%m-%d %H:%M:%S') - Iniciando verificação do serviço $SERVICE_NAME" >> "$LOG_FILE"

# Verifica se o serviço está online
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$SERVICE_URL")

# Grava o resultado da verificação no arquivo .txt
if [ "$STATUS" -eq 200 ]; then
    MESSAGE="$(date '+%Y-%m-%d %H:%M:%S') - Serviço $SERVICE_NAME está online."
    echo "$MESSAGE" >> "$OUTPUT_FILE"
    echo "$MESSAGE" >> "$LOG_FILE"  # Adiciona mensagem ao log
else
    MESSAGE="$(date '+%Y-%m-%d %H:%M:%S') - Serviço $SERVICE_NAME não está online. Status: $STATUS"
    echo "$MESSAGE" >> "$OUTPUT_FILE"
    echo "$MESSAGE" >> "$LOG_FILE"  # Adiciona mensagem ao log
fi


