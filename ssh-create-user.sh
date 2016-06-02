#! /bin/sh

SUPERUSER=root
SERVER=$1
USER=$2
PUB=$2

[ -z "$PUB" && PUB=~/.ssh/id_rsa.pub ]
[ -z "$SERVER" && echo "SERVER?" && exit 1 ]
[ -z "$USER" && echo "USER?" && exit 1 ]

echo "SUPERUSER=$SUPERUSER SERVER=$SERVER USER=$USER PUB=$PUB"

cat $PUB | \
  ssh $SUPERUSER@$SERVER \
  useradd $USER &&
  "sudo mkdir ~$USER/.ssh; sudo tee -a ~$USER/.ssh/authorized_keys"
  
