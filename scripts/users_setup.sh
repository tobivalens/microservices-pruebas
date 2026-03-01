#!/bin/bash

sudo apt-get update
sudo apt-get install -y docker.io git

sudo systemctl start docker
sudo systemctl enable docker

git clone https://github.com/tobivalens/microservice-app-example-v.git

cd microservice-app-example-v/users-api

sudo docker build -t users-api .
sudo docker run -d -p 8083:8083 \
  -e JWT_SECRET=PRFT \
  -e SERVER_PORT=8083 \
  --name users-api \
  users-api