#!/bin/bash
#
sudo apt update && sudo apt upgrade -y
cd ~/
mkdir coopr-dbhq
apt install php-7.2+* perl mariadb nginx-full letsencrypt openssh-server
