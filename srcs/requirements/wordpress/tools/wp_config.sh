#!/bin/bash

until mariadb -h "$DB_HOST" -u "$DB_USR" -p"$DB_PW" "$DB_NAME"; do
	echo Waiting...
	sleep 5;
done

if [ ! -f "./wp-config.php" ]
then
	wp core download --allow-root

	wp config create			\
		--dbname=$DB_NAME		\
		--dbuser=$DB_USR		\
		--dbpass=$DB_PW			\
		--dbhost=mariadb:3306		\
		--allow-root

	wp core install				\
		--url=$DOMAIN_NAME		\
		--title=$WP_TITLE		\
		--admin_user=$WP_ADMIN_USR	\
		--admin_password=$WP_ADMIN_PW	\
		--admin_email=$WP_ADMIN_EMAIL	\
		--skip-email			\
		--allow-root

	wp user create				\
		$WP_USR				\
		$WP_EMAIL			\
		--role=author			\
		--user_pass=$WP_PW		\
		--allow-root

	mkdir -p /run/php
fi
/usr/sbin/php-fpm7.4 -F
