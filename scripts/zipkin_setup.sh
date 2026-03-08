#!/bin/bash

sudo apt update -y
sudo apt install -y docker.io

sudo systemctl start docker
sudo systemctl enable docker

sudo docker rm -f zipkin || true

sudo docker run -d \
  -p 9411:9411 \
  -e STORAGE_TYPE=mem \
  -e QUERY_BASE_PATH=/ \
  --name zipkin \
  openzipkin/zipkin