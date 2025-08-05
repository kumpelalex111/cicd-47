#!/bin/bash
SOURCE="fox@192.168.190.130:/home/fox/"
DATE_BACKUP=$(date +"%d-%m-%Y-%H-%M-%S")
DEST="/backup/${DATE_BACKUP}"
KEY="/home/alex/.ssh/rock_ed25519"
LAST_BACKUP=$(cat /distrib/last_backup)

rsync -a -v --delete --checksum --exclude="/.ssh/" --link-dest=/backup/${LAST_BACKUP} -e "ssh -i $KEY" $SOURCE  $DEST
if [[ $? -eq 0 ]]; then
        echo "${DATE_BACKUP}" > /distrib/last_backup # сохраняем дату предыдущего backup
        find /backup -maxdepth 1 -type d -ctime +5 | xargs rm -r # удаляем старые бекапы
else
        echo "Backup failed"
        exit 1
fi
