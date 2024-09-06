#!bin/bash

wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php
chown www-data:www-data /var/www/html/adminer.php
chmod 755 /var/www/html/adminer.php

cd /var/www/html || exit
rm -f index.html

php -5 "0.0.0.0:2080"