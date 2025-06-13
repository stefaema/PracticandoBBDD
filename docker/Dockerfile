FROM mysql:8

# Debido a que es algo pedagógic, la contraseña del root es "root". Ojo con esto en producción.
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=sakila

# Fun Fact: Tuve que enumerar los archivos de SQL porque se cargan en orden alfabético.
# Me pasaba que se cargaba primero el de datos y luego el de esquema, lo que provocaba un error.
COPY ../db/01-sakila-schema.sql /docker-entrypoint-initdb.d/
COPY ../db/02-sakila-data.sql /docker-entrypoint-initdb.d/
