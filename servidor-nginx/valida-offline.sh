#!/bin/bash

SERVICE_NAME="Nginx"

SERVICE_URL="http://localhost"

OUTPUT_DIR="/home/alessandra/projetos/compass/servidor-nginx"
LOG_FILE="$OUTPUT_DIR/valida-offline.log"


	if [ ! -d "$OUTPUT_DIR" ]; then
		mkdir -p "$OUTPUT_DIR"
	fi

OUTPUT_FILE="$OUTPUT_DIR/status-offline.txt"

STATUS=$(curl -s -o /dev/null -w  "%{http_code}" "$SERVICE_URL")

	if [ "$STATUS" -ne 200 ]; then
		MESSAGE="$(date '+%Y-%m-%d %H:%M:%S' )- Serviço: $SERVICE_NAME está offline." 
		echo "$MESSAGE" >> "$OUTPUT_FILE"
		echo "$MESSAGE"
	fi 
