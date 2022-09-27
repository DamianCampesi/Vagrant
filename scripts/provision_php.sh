#!/bin/bash
echo "PHP provisioning - begin"

apt install php -y

apt-get install php-mysql -y

phpenmod mysqli

systemctl restart apache2



echo "PHP provisioning - end"