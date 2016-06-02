#! /bin/sh

SERVER=$1
USER=$2
PUB=$2

[ -z "$PUB" && PUB=~/.ssh/id_rsa.pub ]

cat $PUB | \
  ssh root@$SERVER \
  useradd $USER &&
  "sudo mkdir ~$USER/.ssh; sudo tee -a ~$USER/.ssh/authorized_keys"
  
