#! /bin/sh

SUPERUSER=root
SERVER=$1
NEWUSER=$2
KEYPUB=$3

[ -z "$KEYPUB" ] && KEYPUB=~/.ssh/id_rsa.pub 
[ -z "$SERVER" ] && echo "SERVER?" && exit 1 
[ -z "$NEWUSER" ] && echo "NEWUSER?" && exit 1 

echo "SUPERUSER=$SUPERUSER SERVER=$SERVER NEWUSER=$NEWUSER KEYPUB=$KEYPUB"

if [ "$SUPERUSER" != "root" ]; then
    echo "This script doesn't yet support sudoing"
    exit 1;
fi


cat $KEYPUB | \
  ssh $SUPERUSER@$SERVER \
  " useradd -m -s /bin/bash -U $NEWUSER ;
    mkdir ~$NEWUSER/.ssh 
    tee -a ~$NEWUSER/.ssh/authorized_keys || exit 1"

if [ $? -ne 0 ]; then
   echo "Failed"
   exit $?
fi
   
   
  
