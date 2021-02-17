#!/bin/bash
for i in 1 2 ; do
yc compute instance create \
  --name node-${i} \
  --hostname node-${i} \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1804-lts,size=30GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key ~/.ssh/id_rsa.pub
done
