#!/bin/bash
set -e

# Start Docker
sudo systemctl start docker

# Start Ollama
sudo systemctl start ollama

# Launch Open-webui
docker run --rm -d --network=host \
       --add-host=host.docker.internal:host-gateway \
       -v open-webui:/app/backend/data \
       --name open-webui ghcr.io/open-webui/open-webui:main

echo "AI started!"