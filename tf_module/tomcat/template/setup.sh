#!/bin/bash
set -e -x

# update
yum update -y

# jdk
yum remove -y java-1.7.0-openjdk
yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel

# tomcat
yum install -y tomcat tomcat-admin-webapps  tomcat-webapps tomcat-docs-webapp


# tomcat start
sudo systemctl start tomcat.service

# nginx enable
sudo systemctl enable tomcat.service

# web root chmod
#sudo chmod 775 /var/lib/tomcat/webapps