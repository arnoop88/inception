#!/bin/bash

mysqld --initialize

service mysql start

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
    echo "MySQL is already installed"
else
    echo "Setting up MySQL database..."

    mysql -e "UPDATE mysql.user SET Password = PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User = 'root';"
    mysql -e "DELETE FROM mysql.user WHERE User='';"
    mysql -e "DROP DATABASE IF EXISTS test;"
    mysql -e "DELETE FROM mysql.db WHERE Db = 'test' OR Db = 'test\\_%';"
    mysql -e "FLUSH PRIVILEGES;"

    mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
    mysql -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mysql -e "FLUSH PRIVILEGES;"

    echo "MySQL setup complete."
fi

service mysql stop

exec "$@"