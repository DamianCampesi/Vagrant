#!/bin/bash
echo "PHP provisioning - begin"

#install php & php-mysql
apt install php -y
apt-get install php-mysql -y
#enable mysqli
phpenmod mysqli
#restart apache
systemctl restart apache2

echo "PHP provisioning - end"