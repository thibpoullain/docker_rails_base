#!/bin/sh
set -e

docker build -t vrizzt/ruby_base_builder:3.0.1 -f ./builder/Dockerfile .
docker build -t vrizzt/ruby_base_final:3.0.1 -f ./final/Dockerfile .

echo $DOCKER_HUB_KEY | docker login -u $DOCKER_HUB_USER --password-stdin
docker push vrizzt/ruby_base_builder:3.0.1
docker push vrizzt/ruby_base_final:3.0.1