#!/bin/bash

sudo apt-get update
sudo apt-get -y install postgresql
sudo systemctl start postgresql.service
sudo systemctl enable postgresql.service
sudo apt-get -y install expect
sudo expect /vagrant/db_files/db_script.exp
sudo cp /vagrant/db_files/postgresql.conf /etc/postgresql/12/main/postgresql.conf
sudo cp /vagrant/db_files/pg_hba.conf /etc/postgresql/12/main/pg_hba.conf
sudo systemctl restart postgresql.service
