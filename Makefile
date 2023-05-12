# Variables
SRCS		= srcs
COMPOSER	= docker-compose.yml

# PHONY
.PHONY		: all stop clean fclean re rmv

# Règles
all			:
			docker-compose -f $(SRCS)/$(COMPOSER) build
			docker-compose -f $(SRCS)/$(COMPOSER) up

stop		:
			docker-compose -f $(SRCS)/$(COMPOSER) down

clean		:
			docker system prune

fclean		:
			docker system prune -fa

re			: fclean all

rmv			:
			rm -rf /home/anguinau/data/WordPress/*
			rm -rf /home/anguinau/data/DB/*
