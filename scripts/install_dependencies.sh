#!/bin/bash

# Update package list
sudo apt update

# Install Ruby and other packages
sudo apt install -y ruby-full wget

# Change directory to /home/ubuntu
cd /home/ubuntu

# Download and install AWS CodeDeploy agent
wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto

# Check the status of CodeDeploy agent
systemctl status codedeploy-agent

# Install Java Runtime Environment
sudo apt install -y default-jre

# Verify Java installation
java -v || java --version

# Install OpenJDK 17
sudo apt-cache search openjdk
sudo apt install -y openjdk-17-jdk

# Verify OpenJDK 17 installation
java --version

# Download and install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Test AWS CLI installation
aws --version

# List S3 buckets and download file
aws s3 ls
aws s3 cp s3://anirudhcodebuild/app.zip .

# Install unzip utility
sudo apt install -y unzip

# Unzip the downloaded app
unzip app.zip

# Change directory and run the JAR file
cd target/
java -jar spring-petclinic-3.3.0-SNAPSHOT.jar

# Check application status
curl localhost:8080
ps -ef | grep java

# Return to the target directory and run the JAR file again if necessary
cd target/
java -jar spring-petclinic-3.3.0-SNAPSHOT.jar

# Clean up and run the JAR file from the target directory
cd ..
java -jar target/*.jar
