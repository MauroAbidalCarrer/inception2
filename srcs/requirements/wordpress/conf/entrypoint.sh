#!/bin/sh

# On s'assure que le serveur MariaDB est bien lancé.
while ! mysql -h mariadb -u$DB_USER -p$DB_USER_PASSWD --silent > /dev/null 2>&1; do
	sleep 1
done

# On vérifie que le site n'existe pas déjà.
if [ ! -f /var/www/wordpress/wp-config.php ]; then
	# On installe WordPress dans le bon répertoire.
	curl -O https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz
	tar xf wordpress-6.0-fr_FR.tar.gz
	mv wordpress/* /var/www/wordpress/
	rm wordpress-6.0-fr_FR.tar.gz
	rm -r wordpress/

	cd /var/www/wordpress

	# On crée le fichier de configuration WordPress 'wp-config.php'.
	wp config create					\
	--dbname=$DB_NAME					\
	--dbuser=$DB_USER					\
	--dbpass=$DB_USER_PASSWD			\
	--dbhost=mariadb
	
	# On installe la base de données et on configure le site.
	wp core install						\
	--url=https://anguinau.42.fr		\
	--title="[ WordPress by anguinau]"	\
	--admin_user=$WP_ADMIN_USR			\
	--admin_password=$WP_ADMIN_PASSWD	\
	--admin_email=$WP_ADMIN_MAIL		\
	--skip-email

	# On crée un utilisateur non-admin.
	wp user create						\
	$WP_USER_NAME						\
	$WP_USR_MAIL						\
	--user_pass=$WP_USR_PASSWD
fi

# On lance la commande spécifiée en 'CMD' de notre Dockerfile.
exec "$@"
