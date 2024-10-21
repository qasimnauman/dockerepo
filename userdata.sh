#!/bin/bash
sudo apt update
sudo apt install -y docker.io
sudo apt install -y docker-compose
sudo docker run -d \
  -e SPRING_DATASOURCE_URL="jdbc:postgresql://$(aws rds describe-db-instances --db-instance-identifier MyDBInstance --query 'DBInstances[0].Endpoint.Address' --output text):5432/mydatabase" \
  -e SPRING_DATASOURCE_USERNAME="myadmin" \
  -e SPRING_DATASOURCE_PASSWORD="MySecurePassword123!" \
  -p 8080:8080 reflectoring/aws-rds-hello-world