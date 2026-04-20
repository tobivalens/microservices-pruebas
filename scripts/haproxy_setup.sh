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

    acl is_zipkin path_beg /zipkin
    use_backend zipkin_back if is_zipkin

    default_backend frontend_back

backend frontend_back
    balance roundrobin
    server frontend1 192.168.56.11:3000 check

backend zipkin_back
    server zipkin1 192.168.56.25:9411 check
EOF'

sudo systemctl restart haproxy