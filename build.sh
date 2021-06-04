#!/bin/sh
set -e

docker build -t vrizzt/ruby_base_builder -f ./builder/Dockerfile .
docker build -t vrizzt/ruby_base_final -f ./final/Dockerfile .

echo $DOCKER_HUB_TOKEN | docker login -u $DOCKER_HUB_USER --password-stdin
docker push vrizzt/ruby_base_builder:latest
docker push vrizzt/ruby_base_final:latest