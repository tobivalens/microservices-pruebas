#!/bin/bash

sudo apt update -y
sudo apt install -y docker.io git

sudo systemctl enable docker
sudo systemctl start docker

rm -rf microservice-app-example-v

git clone https://github.com/tobivalens/microservice-app-example-v.git

cd microservice-app-example-v/log-message-processor

sudo docker rm -f log-processor || true

sudo docker build -t log-processor .

sudo docker run -d \
  -e REDIS_HOST=192.168.56.23 \
  -e REDIS_PORT=6379 \
  -e REDIS_CHANNEL=log_channel \
  --name log-processor \
  log-processor