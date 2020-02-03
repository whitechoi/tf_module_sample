#!/bin/bash
set -e -x


# update
yum update -y

# jdk
yum remove -y java-1.7.0-openjdk
yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel

# jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

yum install -y jenkins

# start
sudo service jenkins start
sudo chkconfig jenkins on

while [ ! -f /var/lib/jenkins/secrets/initialAdminPassword ]; do
    sleep 1
done

PASS=$(sudo bash -c "cat /var/lib/jenkins/secrets/initialAdminPassword")
