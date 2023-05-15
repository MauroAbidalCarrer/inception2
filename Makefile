all :
	docker-compose -f srcs/docker-compose.yml up -d

clean-images	:
	docker stop

fclean		:
			docker system prune -fa

re			: fclean all


.PHONY		: all stop clean fclean re rmv
