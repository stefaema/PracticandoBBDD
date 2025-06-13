FROM mysql:8

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=sakila


COPY ../db/sakila-schema.sql /docker-entrypoint-initdb.d/
COPY ../db/sakila-data.sql /docker-entrypoint-initdb.d/
