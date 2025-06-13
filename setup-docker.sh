#!/bin/bash
# filepath: /home/fernando/Documents/PracticandoBBDD/setup-docker.sh
set -e
cd "$(dirname "${BASH_SOURCE[0]}")"

# 🎨 Definición de colores para los mensajes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # Sin color

echo -e "${CYAN}🚀 Iniciando entorno MySQL Sakila con Docker...${NC}"

# Construir la imagen de Docker solo si no existe
if ! docker image inspect sakila-mysql &>/dev/null; then
    echo -e "${YELLOW}Construyendo la imagen de Docker a partir del Dockerfile...${NC}"
    docker build -t sakila-mysql -f docker/Dockerfile .
else
    echo -e "${GREEN}La imagen sakila-mysql ya existe.${NC}"
fi

# Verificar si el contenedor ya está corriendo
if docker ps --format '{{.Names}}' | grep -q '^sakila-mysql-container$'; then
    echo -e "${GREEN}El contenedor sakila-mysql-container ya está corriendo.${NC}"
else
    # Si existe pero está detenido, lo inicia. Si no existe, lo crea.
    if docker ps -a --format '{{.Names}}' | grep -q '^sakila-mysql-container$'; then
        echo -e "${YELLOW}El contenedor existe pero está detenido. Iniciando...${NC}"
        docker start sakila-mysql-container
    else
        echo -e "${YELLOW}Creando y arrancando el contenedor sakila-mysql-container...${NC}"
        docker run -d --name sakila-mysql-container -p 3306:3306 sakila-mysql
    fi
fi

# Esperar a que MySQL esté listo
echo -e "${YELLOW}Esperando a que MySQL dentro del contenedor esté listo para aceptar conexiones...${NC}"
until docker exec sakila-mysql-container mysqladmin ping -uroot -proot --silent &> /dev/null ; do
    sleep 2
done

echo -e "${GREEN}✅ ¡MySQL está corriendo dentro del contenedor!${NC}"
echo -e "${CYAN}🔑 Datos de conexión para el cliente MySQL:${NC}"
echo -e "${CYAN}  Host:     127.0.0.1${NC}"
echo -e "${CYAN}  Puerto:   3306${NC}"
echo -e "${CYAN}  Usuario:  root${NC}"
echo -e "${CYAN}  Password: root${NC}"
echo -e "${CYAN}  Base:     sakila${NC}"

echo ""
echo -e "${YELLOW}¿Cómo seguir?${NC}"
echo -e "${YELLOW}- Puedes conectarte con: mysql -h127.0.0.1 -P3306 -uroot -proot sakila${NC}"
echo -e "${YELLOW}- Este script ('setup-docker.sh') puedes ejecutarlo cada vez que entres al workspace para asegurarte de que el contenedor esté listo.${NC}"
echo -e "${YELLOW}- El script 'install-docker.sh' solo es necesario la primera vez para instalar Docker.${NC}"
