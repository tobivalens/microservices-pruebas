#!/bin/bash

sudo apt update -y
sudo apt install -y docker.io

sudo systemctl enable docker
sudo systemctl start docker

sudo docker rm -f redis || true

sudo docker run -d \
  -p 6379:6379 \
  --name redis \
  redis:7