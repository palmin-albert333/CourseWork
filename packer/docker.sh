#!/bin/bash
sudo apt update -y
sudo apt install -y curl
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo apt install -y docker-compose
sudo usermod -aG docker ubuntu
