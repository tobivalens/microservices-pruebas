#!/bin/bash
set -e

sudo apt update -y
sudo apt install -y docker.io git

sudo systemctl enable docker
sudo systemctl start docker

cd /vagrant/todos-api

sudo docker rm -f todos-api || true
sudo docker build -t todos-api .

sudo docker run -d \
  -p 8082:8082 \
  -e JWT_SECRET=PRFT \
  -e TODO_API_PORT=8082 \
  -e REDIS_HOST=192.168.56.23 \
  -e REDIS_PORT=6379 \
  -e REDIS_CHANNEL=log_channel \
  --name todos-api \
  todos-api