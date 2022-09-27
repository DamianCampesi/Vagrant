#!/bin/bash
echo "db provisioning - begin"
DBNAME=vagrant
DBUSER=vagrant
USRPASSW=vagrantpass
echo "Creating new db $DBNAME"
mysql -e "CREATE DATABASE IF NOT EXISTS $DBNAME;"
mysql -e "CREATE USER '$DBUSER'@'%' IDENTIFIED BY '$USRPASSW';"
mysql -e "GRANT all privileges on $DBNAME.* to '$DBUSER'@'%';"

mysql $DBNAME -e "CREATE TABLE user (id INT PRIMARY KEY AUTO_INCREMENT,nome VARCHAR(50),cognome VARCHAR(50),telefono VARCHAR(50));"
mysql $DBNAME -e "INSERT INTO user (nome, cognome, telefono) VALUES('Dennis', 'Donofrio', '1203323313');"
mysql $DBNAME -e "INSERT INTO user (nome, cognome, telefono) VALUES('Gioele', 'Zanetti', '4658976574');"
mysql $DBNAME -e "INSERT INTO user (nome, cognome, telefono) VALUES('Samuele', 'Abba', '0987913271');"

echo "db provisioning - end"
