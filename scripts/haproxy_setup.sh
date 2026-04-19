#!/bin/bash
set -e

sudo apt update -y
sudo apt install -y haproxy

sudo bash -c 'cat > /etc/haproxy/haproxy.cfg <<EOF
global
    daemon
    maxconn 256

defaults
    mode http
    timeout connect 5000ms
    timeout client 50000ms
    timeout server 50000ms

frontend http_front
    bind *:80
    default_backend http_back

backend http_back
    balance roundrobin
    server frontend1 192.168.56.11:8080 check
EOF'

sudo systemctl restart haproxy