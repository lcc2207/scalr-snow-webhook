#!/bin/bash
set -e

dockername='snow-webhook'

docker stop $dockername || true
docker rm $dockername || true

docker build -t $dockername \
    --build-arg http_proxy=$http_proxy \
    --build-arg https_proxy=$https_proxy \
    .

docker-compose up -d
