 #!/bin/bash

sudo apt update
sudo apt install -y fontconfig openjdk-17-jre 

# Verify the installation of Java
#java -version

# Install Maven
sudo apt install -y maven

# Verify the installation of Maven
#mvn -version