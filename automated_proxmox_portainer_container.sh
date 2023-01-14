#!/bin/bash

CTID=116
IMAGE=portainer/portainer

# Update and upgrade the Proxmox node
apt-get update && apt-get dist-upgrade -y

# Install the Docker daemon
apt-get install -y docker.io

# Start the Docker daemon
systemctl start docker

# Pull the Portainer image
docker pull $IMAGE

# Create the container
docker create --name portainer-$CTID -p 9000:9000 --restart=always -v /var/run/docker.sock:/var/run/docker.sock $IMAGE

# Start the container
docker start portainer-$CTID
