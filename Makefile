#=============================VARS=============================#
DOCMP = docker compose

DIR = ./src/
YML = docker-compose.yml
HOMER = /home/$(USER)
DATA = $(HOMER)/data
WP_DB = $(DATA)/wp_database
WP_FILES = $(DATA)/wp_files

#============================RULES=============================#

echo:
	@echo HOla $(DATA) $(WP_DB) $(WP_FILES)

all: build up

build:
	mkdir -p $(HOMER)
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
