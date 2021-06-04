#!/bin/sh
set -e

docker build -t vrizzt/ruby_base_builder:2.7.2 -f ./builder/Dockerfile .
docker build -t vrizzt/ruby_base_final:2.7.2 -f ./final/Dockerfile .

echo $DOCKER_HUB_KEY | docker login -u $DOCKER_HUB_USER --password-stdin
docker push vrizzt/ruby_base_builder:2.7.2
docker push vrizzt/ruby_base_final:2.7.2