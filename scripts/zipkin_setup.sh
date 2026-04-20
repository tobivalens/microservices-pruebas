#!/bin/bash

sudo apt update -y
sudo apt install -y docker.io

sudo systemctl start docker
sudo systemctl enable docker

sudo docker rm -f zipkin || true

docker run -d \
  -p 9411:9411 \
  -e STORAGE_TYPE=mem \
  -e JAVA_OPTS="-Xms256m -Xmx512m" \
  --name zipkin \
  openzipkin/zipkin:2