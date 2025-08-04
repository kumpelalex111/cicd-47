# Домашнее задание к занятию 3 «Резервное копирование» - Хрипун Алексей

---

### Задание 1

![Синхронизация каталога](img/task1.png)

`Если из домашнего каталога удалить файл, например, file.test, в новой резервной копии его также не будет:`

![Синхронизация удаления](img/task1_1.png)
 

### Задание 2

`Скрипт для ежедневного резервного копирования домашнего каталога. Для удобства мониторинга задания лог пишется не только в системный журнал, но и в отдельный лог-файл:`
```
#!/bin/bash
rsync -a --delete --checksum /home/fox/ /tmp/backup
if [[ $? -eq 0 ]]; then
        echo "$(date +"%Y-%m-%dT%H:%M:%S.%6N")       $HOSTNAME   Backup for the fox user has been completed" | tee -a /var/log/syslog  >> /var/log/backup_home_fox.txt
else
        echo "$(date +"%Y-%m-%dT%H:%M:%S.%6N")       $HOSTNAME   Backup FAILED for the fox user" | tee -a /var/log/syslog >> /var/log/backup_home_fox.txt
fi
```
![Запуск скрипта](img/task2_2.png)

`Результат выполнения скрипта пишется в лог-файлы. При одном из запусков быз изменен каталог для копирования. Неудачный запуск также попал в лог файлы:`
![Запись в журналы](img/task2_3.png)

`После отладки скрипта он был поставлен на ежедневное выполнение с помощью cron`
![Запуск по расписанию](img/task2_4.png)

[Запуск по расписанию](https://github.com/kumpelalex111/cicd-47/blob/main/root)


### Задание 3

![Запросы](img/task3_1.png)


### Задание 4
`Конфигурационный файл HAProxy с разными backends:`
```

