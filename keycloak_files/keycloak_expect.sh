#!/bin/bash

sudo /opt/keycloak/bin/add-user-keycloak.sh -u admin
sudo systemctl restart keycloak
sudo /opt/keycloak/bin/kcadm.sh config credentials --server http://localhost:8080/auth --realm master --user admin
sudo /opt/keycloak/bin/kcadm.sh update realms/master -s sslRequired=NONE
