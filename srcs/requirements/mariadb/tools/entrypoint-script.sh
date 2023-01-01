#!/bin/bash

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
	cd /tmp;

	mysql_install_db;

	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > ./install.sql;

	echo -n "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* " >> ./install.sql;
	echo "TO $MYSQL_USER@localhost IDENTIFIED BY '$MYSQL_PASSWORD';" >> ./install.sql;

	/usr/bin/mysqld_safe &

	sleep 3;

	mariadb < install.sql;
	mysqladmin -u root password $MYSQL_ROOT_PASSWORD;

	service mysql stop;
fi

exec "$@";
