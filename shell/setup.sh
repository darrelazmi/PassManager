#!/bin/sh

################# INSTALL DOCKER ###########################

# Hapus package yang konflik
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install the latest version of docker package
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

################# INSTALL CONTAINER VAULTWARDEN ###########################

# Install Vaultwarden dari public docker repo
docker run --name vaultwarden --hostname vaultwarden \
  --network proxy-net --volume ./vaultwarden:/data --detach \
  vaultwarden/server

################# INSTALL CONTAINER CADDY ###########################

# Install Caddy
docker run --name caddy --network proxy-net \
  --publish 80:80 --publish 443:443 --detach \
  caddy caddy reverse-proxy --from <your-domain> --to vaultwarden:80

################### FINISH ##########################################
