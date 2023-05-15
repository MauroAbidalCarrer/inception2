CONTAINERS := mariadb nginx wordpress

IMAGES := srcs-mariadb srcs-nginx srcs-wordpress

VOLUMES := DB WordPress

VOLUME_DIRS := /home/maabidal/data/wordpress_vol /home/maabidal/data/mariadb_vol

all :
	- sed -i '/maabidal.42.fr/d' /etc/hosts
	- echo "127.0.0.1 maabidal.42.fr" >> /etc/hosts
	- mkdir -p /home/maabidal
	- mkdir -p /home/maabidal/data
	- mkdir -p $(VOLUME_DIRS)
	- docker compose -f ./srcs/docker-compose.yml up -d

clean :
	- docker stop $(CONTAINERS)
	- docker rm $(CONTAINERS)
	- docker image rm $(IMAGES)
	- docker colume rm $(VOLUMES)
	- docker system prune -fa
	- rm -rf $(VOLUME_DIRS)
	
re : clean all

stop :
	- docker stop $(CONTAINERS)

.PHONY		: all clean re
