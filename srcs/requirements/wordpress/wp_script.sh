#!/bin/bash
while ! mariadb -h$DB_HOST -u$DB_ADMIN -p$DB_ADMIN_PASSWORD; do
	echo "Waiting to connect to MariaDB"
	sleep 2
done

if [ ! -f wp-config.php ]; then
	wp core download --allow-root
	wp config create --dbname="$DB_NAME" --dbuser="$DB_ADMIN" \
		--dbpass="$DB_ADMIN_PASSWORD" --dbhost="$DB_HOST" --allow-root

	wp core install --url="$DOMAIN_NAME" --title="qxia inception" \
		--admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD"\
		--admin_email="$WP_ADMIN_MAIL" --skip-email --allow-root

	wp user create $WP_USER $WP_MAIL --user_pass=$WP_USER_PASSWORD --role=author --allow-root
	echo "Wordpress installed and configured with a user"
else
	echo "Wordpress is already configured"
fi

echo "\nVisit https://qxia.42.fr"

# Launch wp in foreground
php-fpm7.3 -F

# show user db wp : conect to mariadb container, mysql with db_admin (mysql -u mariadb -p)
# show databases, use wordpress, show tables, show columns from wp_users
# select user_login from wp_users
# Connect to wp container, try "mysql -h DB_HOST -u DB_ADMIN -p", it must works
# From host machine "mysql -h 127.0.0.1 -u root -p", it must not works
# From host machine "mysql -h 127.0.0.1 -u DB_ADMIN -p", it must not works
