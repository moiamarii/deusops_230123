#!/bin/bash

sudo -u postgres createuser -s -P keycloak
sudo -u postgres createdb keycloak
sudo adduser keycloak
