#!/bin/bash
yc compute instance create \
  --name gitlab \
  --hostname gitlab \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1804-lts,size=50GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key ~/.ssh/id_rsa.pub
