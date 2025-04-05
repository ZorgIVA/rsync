#!/bin/bash

SOURCE_DIR="/home/zorg"

TARGET_DIR="/tmp/backup"

rsync -a --checksum --exclude=".*" "$SOURCE_DIR" "$TARGET_DIR" > /dev/null 2>> /var/log/backup.log

if [ $? -eq 0 ]; then
    echo "[$(date)] Job is done" >> /var/log/backup.log
else
    echo "[$(date)] Job is not done, ERROR" >> /var/log/backup.log
fi