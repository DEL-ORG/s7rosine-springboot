#!/bin/bash

# install_docker() {

    # Remove any older versions of Docker
    sudo apt-get remove -y docker docker-engine docker.io containerd runc
    
    # Add Docker's official GPG key:
    sudo apt-get update -y
    sudo apt-get install -y ca-certificates curl 
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update -y
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  sudo usermod -aG docker $USER
  newgrp docker
  sudo chmod 666 /var/run/docker.sock
  docker network create sonarqube-network

# Run PostgreSQL container with the necessary configuration:
   
 docker run -d \
  --name sonarqube_db2 \
  --network sonarqube-network \
  -e POSTGRES_USER=sonar \
  -e POSTGRES_PASSWORD=sonar \
  -e POSTGRES_DB=sonarqube \
  -v sonarqube_db_data:/var/lib/postgresql/data \
  postgres:13


# Start SonarQube Container
docker run -d \
  --name sonarqube2 \
  --network sonarqube-network \
  -e SONAR_JDBC_URL=jdbc:postgresql://sonarqube_db2:5432/sonarqube \
  -e SONAR_JDBC_USERNAME=sonar \
  -e SONAR_JDBC_PASSWORD=sonar \
  -p 9000:9000 \
  -v sonarqube_data:/opt/sonarqube/data \
  -v sonarqube_logs:/opt/sonarqube/logs \
  -v sonarqube_extensions:/opt/sonarqube/extensions \
  sonarqube:community

