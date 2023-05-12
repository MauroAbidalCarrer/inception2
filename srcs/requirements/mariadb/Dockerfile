# On part d'Alpine 3.16.
FROM		alpine:3.16

# On installe les dépendances de notre conteneur.
RUN			apk update --no-cache		\
			&& apk upgrade --no-cache	\
			&& apk add --no-cache		\
				mariadb					\
				mariadb-client

# On reconfigure MariaDB.
# On installe le script de démarrage du conteneur.
COPY		conf/my.cnf			/etc/my.cnf
COPY		conf/entrypoint.sh	/entrypoint.sh

# On définit un port d'écoute pour les connexions inter-conteneur.
EXPOSE		3306

# Le conteneur se lancera avec notre entrypoint, puis mysqld deviendra PID 1.
ENTRYPOINT	["/entrypoint.sh"]
CMD			["mysqld", "--user=mysql"]
