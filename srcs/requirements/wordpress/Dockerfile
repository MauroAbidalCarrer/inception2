# On part d'Alpine 3.16.
FROM		alpine:3.16

# On installe les dépendances de notre conteneur.
	# PHP-			: Permet d'exécuter le code PHP.
		# FPM		: Permet d'utiliser FastCGI.
		# MYSQLI	: Permet à PHP de se connecter à la DB.
		# OPCACHE	: Permet d'accélérer l'exécution du code PHP (mise en mémoire de code précompilé).
		# JSON		: Permet de travailler avec des données JSON.
		# GD		: Permet de travailler avec des images.
		# CURL		: Permet d'effectuer des requêtes HTTP et HTTPS depuis un fichier PHP.
		# ZLIB		: permet de compresser et de décompresser des fichiers.
		# XML		: Permet de travailler avec des données XML.
		# PHAR		: Permet de travailler avec des archives Phar.
		# INTL		: Permet de travailler avec des chaînes de caractères multilingues.
		# DOM		: Permet de travailler avec des données HTML et XML.
		# XMLREADER	: Permet lire les fichiers XML.
		# CTYPE		: Permet un travail plus poussé sur les chaînes de caractères.
		# SESSION	: Permet de gérer les sessions utilisateur de notre site.
		# MBSTRING	: Permet de travailler avec des caractères multibyte.
		# FILEINFO	: Permet d'obtenir des informations sur les fichiers.
		# TOKENIZER : Permet décomposer le code source PHP en jetons, peut être utilisé par WordPress pour analyser le code PHP.
		# SIMPLEXML	: Permet certaines manipulations sur les fichier XML.
		# PECL-APCU	: Permet à WordPress de stocker les données en cache pour accélérer les performances du site.
	# WP-CLI		: Permet d'utiliser la CLI WordPress.
RUN			apk update --no-cache			\
			&& apk upgrade --no-cache		\
			&& apk add --no-cache			\
				php8						\
				php8-fpm					\
				php8-mysqli					\
				php8-opcache				\
				php8-json					\
				php8-gd						\
				php8-curl					\
				php8-zlib					\
				php8-xml					\
				php8-phar					\
				php8-intl					\
				php8-dom					\
				php8-xmlreader				\
				php8-ctype					\
				php8-session				\
				php8-mbstring				\
				php8-fileinfo				\
				php8-tokenizer				\
				php8-simplexml				\
				php8-pecl-apcu				\
				curl						\
				mariadb-client				\
			&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
		
# On crée l'utilisateur qui exécutera PHP-FPM.
# On crée un répertoire pour les fichiers du site WordPress.
# On dois pouvoir exécuter la CLI de WordPress.
# On déplace la CLI de WordPress dans le dossier des binaires.
RUN			adduser -D php					\
			&& mkdir -p /var/www/wordpress	\
			&& chmod +x wp-cli.phar			\
			&& mv wp-cli.phar /usr/local/bin/wp

# On reconfigure PHP-FPM.
# On installe le script de démarrage du conteneur.
COPY		conf/www.conf		/etc/php8/php-fpm.d/www.conf
COPY		conf/entrypoint.sh	/entrypoint.sh

# On définit un port d'écoute pour les connexions inter-conteneur.
EXPOSE		9000

# Le conteneur se lancera avec notre entrypoint, puis 'php-fpm8 -F' deviendra PID 1.
ENTRYPOINT	["/entrypoint.sh"]
CMD			["php-fpm8", "-F"]
