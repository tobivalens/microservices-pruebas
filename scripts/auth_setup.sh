#!/bin/bash

sudo apt update -y
sudo apt install -y docker.io git

sudo systemctl start docker
sudo systemctl enable docker

rm -rf microservice-app-example-v

git clone https://github.com/tobivalens/microservice-app-example-v.git

cd microservice-app-example-v/auth-api

sudo docker rm -f auth-api || true

sudo docker build -t auth-api .

sudo docker run -d \
  -p 8000:8000 \
  -e AUTH_API_PORT=8000 \
  -e USERS_API_ADDRESS=http://192.168.56.21:8083 \
  -e JWT_SECRET=PRFT \
  --name auth-api \
  auth-api