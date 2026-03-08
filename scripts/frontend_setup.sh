#!/bin/bash

sudo apt update -y
sudo apt install -y docker.io git

sudo systemctl start docker
sudo systemctl enable docker

rm -rf microservice-app-example-v

git clone https://github.com/tobivalens/microservice-app-example-v.git

cd microservice-app-example-v/frontend

sudo docker rm -f frontend-app || true

sudo docker build \
  --build-arg AUTH_API_ADDRESS=http://192.168.56.20:8000 \
  --build-arg TODOS_API_ADDRESS=http://192.168.56.30:8082 \
  -t frontend-app .

sudo docker run -d \
  -p 3000:3000 \
  --name frontend-app \
  frontend-app