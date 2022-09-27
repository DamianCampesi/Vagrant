#!/bin/bash

echo "MySql provisioning - begin"
#installare mysql-server
apt-get install mysql-server -y
#abilitare le connessioni da altri server
echo "Updating bind address"
sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
#riavviare mysql in modo da applicare le modifiche
echo "Restarting mysql service"
service mysql restart

apt install ufw -y
ufw --force enable
ufw allow 3306

echo "MySql provisioning - end"
