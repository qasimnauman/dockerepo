#!/bin/bash

CONTAINER_NAME="my-container-name"
LOG_DIR="/home/ubuntu/logs"
S3_BUCKET="bucket-docker-ec2-rds-s3"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="$LOG_DIR/$CONTAINER_NAME-$TIMESTAMP.log"

mkdir -p "$LOG_DIR"

# Get the exact container ID using the name
CONTAINER_ID=$(sudo docker ps -qf "name=$CONTAINER_NAME")

# Fetch the logs only if the container is running
if [ -n "$CONTAINER_ID" ]; then
    sudo docker logs "$CONTAINER_ID" > "$LOG_FILE"
    aws s3 cp "$LOG_FILE" "s3://$S3_BUCKET/container-logs/"
else
    echo "Container $CONTAINER_NAME is not running."
fi