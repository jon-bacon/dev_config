#!/bin/bash
set -e

# Stop Open-webui
docker stop open-webui

# Stop Docker
sudo systemctl stop docker

# Stop Ollama
sudo systemctl stop ollama
