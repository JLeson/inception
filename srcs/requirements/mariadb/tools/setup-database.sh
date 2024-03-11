#!/bin/bash

mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld /var/lib/mysql
echo "Starting db!"
if ! [ -d "/var/lib/mysql/$DB_NAME" ]
then
	echo "Init db!"
	mysqld --skip-networking &
	while ! mysqladmin ping -h localhost --silent; do
		sleep 1
		echo "Waiting.."
	done
	echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > db1.sql
	echo "CREATE USER IF NOT EXISTS '$DB_USR'@'%' IDENTIFIED BY '$DB_PW' ;" >> db1.sql
	echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PW');" >> db1.sql
	echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PW' WITH GRANT OPTION;" >> db1.sql
	echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USR'@'%' ;" >> db1.sql
	echo "FLUSH PRIVILEGES;" >> db1.sql
	echo "Creating db and user!"
	mysql -u root -p$DB_ROOT_PW < db1.sql
	echo "Db initialized!"
	mysqladmin shutdown -u root -p"$DB_ROOT_PW"
fi
echo "Starting mariadb..."
exec mysqld
