#!/bin/bash

SOURCE="/backup/$1/"
DEST="fox@192.168.190.130:/home/fox"
KEY="/home/alex/.ssh/rock_ed25519"

rsync -a -e "ssh -i $KEY" $SOURCE  $DEST
