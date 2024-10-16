#!/bin/bash

SERVICE_NAME="Nginx"

#URL do serviço que você deseja verificar
SERVICE_URL="http://localhost"

#Diretório onde o resultado de encontra
OUTPUT_DIR="/home/alessandra/projetos/compass/servidor-nginx"

LOG_FILE="$OUTPUT_DIR/valida-online.log"

#Verifica se o diretório de saída existe, se não, crie
	if [ ! -d "$OUTPUT_DIR" ]; then
		mkdir -p "$OUTPUT_DIR"
	fi
# O resultado será salvo aqui 
OUTPUT_FILE="$OUTPUT_DIR/status-nginx-online.txt"

#Verifica se o serviço está online
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$SERVICE_URL")

#Grava o resultado da verificação no arquivo .txt
	if [ "$STATUS" -eq 200 ]; then
		MESSAGE="$(date '+%Y-%m-%d %H:%M:%S') - Serviço $SERVICE_NAME está online."
	      echo "$MESSAGE" >> "$OUTPUT_FILE"
	      echo "$MESSAGE" 
	fi

