#!/bin/bash

[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

apt update
apt install --yes apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt update
apt install --yes docker-ce

usermod -aG docker "$USER"