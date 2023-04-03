#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install default-jdk -y
wget https://github.com/keycloak/keycloak/releases/download/16.1.1/keycloak-16.1.1.tar.gz
tar -xvzf keycloak-16.1.1.tar.gz
sudo mv keycloak-16.1.1 /opt/keycloak
sudo groupadd keycloak
sudo useradd -r -g keycloak -d /opt/keycloak -s /sbin/nologin keycloak
sudo chown -R keycloak: /opt/keycloak
sudo chmod o+x /opt/keycloak/bin/
sudo mkdir /etc/keycloak
sudo cp /opt/keycloak/docs/contrib/scripts/systemd/wildfly.conf /etc/keycloak/keycloak.conf
sudo cp /opt/keycloak/docs/contrib/scripts/systemd/launch.sh /opt/keycloak/bin/
sudo chown keycloak: /opt/keycloak/bin/launch.sh
sudo cp /vagrant/keycloak_files/launch.sh /opt/keycloak/bin/launch.sh
sudo cp /opt/keycloak/docs/contrib/scripts/systemd/wildfly.service /etc/systemd/system/keycloak.service
sudo cp /vagrant/keycloak_files/keycloak.service /etc/systemd/system/keycloak.service
sudo systemctl daemon-reload
sudo systemctl start keycloak
sudo systemctl enable keycloak
cd /opt/keycloak/modules/system/layers/keycloak/org/
sudo mkdir -p postgresql/main
cd
sudo cp /vagrant/keycloak_files/postgresql-42.6.0.jar /opt/keycloak/modules/system/layers/keycloak/org/postgresql/main/
sudo cp /vagrant/keycloak_files/module.xml /opt/keycloak/modules/system/layers/keycloak/org/postgresql/main/
sudo cp /vagrant/keycloak_files/standalone.xml /opt/keycloak/standalone/configuration/standalone.xml
sudo systemctl restart keycloak
sudo apt-get install -y expect
sudo expect /vagrant/keycloak_files/keycloak_expect.exp
