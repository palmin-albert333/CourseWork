#!/bin/bash
sudo apt update -y
sudo apt-get install -y git
git init
git clone https://github.com/palmin-albert333/reddit-example.git
cd reddit-example
docker pull mongo:latest
docker build -t albertpalmin1988/post:1.0 ./post-py
docker build -t albertpalmin1988/comment:1.0 ./comment
docker build -t albertpalmin1988/ui:1.0 ./ui
docker network create reddit
docker volume create reddit_db
docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db -v reddit_db:/data/db mongo:latest
docker run -d --network=reddit --network-alias=post albertpalmin1988/post:1.0
docker run -d --network=reddit --network-alias=comment albertpalmin1988/comment:1.0
docker run -d --network=reddit -p 80:9292 albertpalmin1988/ui:1.0
