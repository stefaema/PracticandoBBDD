FROM mysql:8

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=sakila

COPY ../db/01-sakila-schema.sql /docker-entrypoint-initdb.d/
COPY ../db/02-sakila-data.sql /docker-entrypoint-initdb.d/
