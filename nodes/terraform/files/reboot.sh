#!/bin/bash
docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db -v reddit_db:/data/db mongo:latest
docker run -d --network=reddit --network-alias=post albertpalmin1988/post:1.0
docker run -d --network=reddit --network-alias=comment albertpalmin1988/comment:1.0
docker run -d --network=reddit -p 80:9292 albertpalmin1988/ui:1.0
