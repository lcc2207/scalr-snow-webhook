#!/bin/bash

curl -fsSL https://get.docker.com/ | sh
service docker start || systemctl start docker

mkdir -p /opt/snow-webhook/
# git clone 
# cp webhook.py /opt/webhook
