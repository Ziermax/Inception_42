FROM debian:bullseye-slim

RUN apt-get update -y && apt-get install -y mariadb-server && rm -rf /var/lib/apt/lists/*

COPY conf/my.conf /etc/mysql/my.conf
COPY tools/init.sh /usr/local/bin/init.sh

RUN chmod +x /usr/local/bin/init.sh

EXPOSE 3306

#ENTRYPOINT ["bash"]
ENTRYPOINT ["/usr/local/bin/init.sh"]
