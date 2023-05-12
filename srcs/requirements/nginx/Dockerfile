# On part d'Alpine 3.16.
FROM	alpine:3.16

# On installe les dépendances de notre conteneur.
# On crée un répertoire pour les clefs SSL.
# On crée un répertoire pour les fichiers du site WordPress.
# L'utilisateur qui exécute Nginx doit pouvoir écrire sur les logs.
RUN		apk update --no-cache			\
		&& apk upgrade --no-cache		\
		&& apk add --no-cache			\
			nginx						\
			openssl						\
		&& mkdir /ssl					\
		&& mkdir /var/www/wordpress		\
		&& chown -R nginx:nginx /var/log/nginx

# On génère le certificat SSL type X.509 auto-signé :
	# Il sera valide 365 jours.
	# La clé ne sera pas cryptée.
	# La clé RSA générée fera 2048 bits.
	# On indique ou stocker le certificat et la clé.
	# On donne des informations complémentaires à notre certificat.
RUN		openssl req -x509				\
		-days 365						\
		-nodes							\
		-newkey rsa:2048				\
		-out /ssl/anguinau.42.fr.crt	\
		-keyout /ssl/anguinau.42.fr.key	\
		-subj "/C=FR/ST=France"

# On reconfigure Nginx.
COPY	conf/nginx.conf		/etc/nginx/nginx.conf
COPY	conf/default.conf	/etc/nginx/http.d/default.conf

# Le conteneur se lancera avec la commande suivante pour PID 1.
CMD		["nginx", "-g", "daemon off;"]
