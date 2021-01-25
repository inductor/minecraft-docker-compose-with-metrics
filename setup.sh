#!/bin/bash

if ! command -v docker &> /dev/null
then
    echo "Docker not found, installing..."
    sudo apt-get update

    sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

    sudo apt-get install docker-ce docker-ce-cli containerd.io

    sudo gpasswd -a $USER docker
    echo "Restart shell to use Docker without sudo"
    exit
fi

sudo docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
