#!/bin/bash
set -e

sudo apt update -y
sudo apt install -y docker.io git

sudo systemctl enable docker
sudo systemctl start docker

cd /vagrant/frontend

sudo docker rm -f frontend-app || true

sudo docker build \
  --build-arg AUTH_API_ADDRESS=http://192.168.56.20:8000 \
  --build-arg TODOS_API_ADDRESS=http://192.168.56.22:8082 \
  -t frontend-app .

sudo docker run -d \
  -p 8080:8080 \
  -e PORT=8080 \
  --name frontend-app \
  frontend-app