#=============================VARS=============================#
DOCMP = docker compose

DIR = ./src/
YML = docker-compose.yml
DATA = /home/$(USER)/data
WP_DB = $(DATA)/wp_database
WP_FILES = $(DATA)/wp_files

#============================RULES=============================#

all: build up

build:
	mkdir -p $(DATA)
	mkdir -p $(WP_DB) $(WP_FILES)
	$(DOCMP) $(DIR)$(YML) build

up:
	$(DOCMP) $(DIR)$(YML) up

down:
	$(DOCMP) $(DIR)$(YML) down

clean:

fclean: clean
	rm -rf $(DATA)

re: fclean all
