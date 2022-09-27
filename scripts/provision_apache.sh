#!/bin/bash
echo "Apache2 provisioning - begin"
apt-get install apache2 -y          #install apache
a2enmod rewrite                     #enable mod_rewrite
service apache2 restart             #start apache
echo "Apache2 provisioning - end"