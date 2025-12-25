#=============================VARS=============================#
DOCMP = docker compose

DIR = ./src/
YML = docker-compose.yml
HOMER = /home/$(USER)
DATA = $(HOMER)/data
WP_DB = $(DATA)/wp_database
WP_FILES = $(DATA)/wp_files

#============================RULES=============================#

all: build up

build:
	mkdir -p $(HOMER)
	mkdir -p $(DATA)
	mkdir -p $(WP_DB) $(WP_FILES)
	$(DOCMP) -f $(DIR)$(YML) build

up:
	$(DOCMP) -f $(DIR)$(YML) up

down:
	$(DOCMP) -f $(DIR)$(YML) down

clean:
	$(DOCMP) -f $(DIR)$(YML) down --remove-orphans 

fclean: clean
	$(DOCMP) -f $(DIR)$(YML) down -v --rmi all --remove-orphans
	sudo rm -rf $(DATA)

re: fclean all

.PHONY: all build up down clean fclean re
