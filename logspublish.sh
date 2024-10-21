#!/bin/bash

CONTAINER_ID="65dc3c14c242"
LOG_DIR="/home/ubuntu/logs"
S3_BUCKET="bucket-docker-ec2-rds-s3"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="$LOG_DIR/my-container-log-$TIMESTAMP.log"

mkdir -p "$LOG_DIR"

docker logs $CONTAINER_ID > "$LOG_FILE"

aws s3 cp "$LOG_FILE" "s3://$S3_BUCKET/container-logs/"

# commands to run the cronjob
# crontab -e
# 0 0 * * * bash /home/ubuntu/scripts/logspublish.sh