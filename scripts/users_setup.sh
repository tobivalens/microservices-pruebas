#!/bin/bash
set -e

sudo apt update -y
sudo apt install -y docker.io git

sudo systemctl enable docker
sudo systemctl start docker

cd /vagrant/users-api

sudo docker rm -f users-api || true
sudo docker build -t users-api .

sudo docker run -d \
  -p 8083:8083 \
  -e JWT_SECRET=PRFT \
  -e SERVER_PORT=8083 \
  --name users-api \
  users-api