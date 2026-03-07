#!/bin/bash

sudo apt update -y
sudo apt install -y docker.io git

sudo systemctl start docker
sudo systemctl enable docker

rm -rf microservice-app-example-v

git clone https://github.com/tobivalens/microservice-app-example-v.git

cd microservice-app-example-v/todos-api

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