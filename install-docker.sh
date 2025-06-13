#!/bin/bash
set -e

# 🎨 Definición de colores para los mensajes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # Sin color

echo -e "${CYAN}🚀🐳 Iniciando instalación de Docker...${NC}"

echo -e "${YELLOW}Actualizando la lista de paquetes disponibles (sudo apt update)...${NC}"
echo -e "${YELLOW}> sudo apt update${NC}"
sudo apt update

echo -e "${YELLOW}Instalando utilidades necesarias: ca-certificates (certificados SSL), curl (descargas), gnupg (gestión de claves GPG)...${NC}"
echo -e "${YELLOW}> sudo apt install -y ca-certificates curl gnupg${NC}"
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg

echo -e "${YELLOW}Creando el directorio /etc/apt/keyrings para almacenar claves GPG de repositorios (con permisos 0755: propietario puede leer/escribir/ejecutar, otros pueden leer/ejecutar)...${NC}"
echo -e "${YELLOW}> sudo install -m 0755 -d /etc/apt/keyrings${NC}"
sudo install -m 0755 -d /etc/apt/keyrings

echo -e "${YELLOW}Descargando la clave GPG oficial de Docker y guardándola en /etc/apt/keyrings/docker.gpg (esto permite verificar la autenticidad de los paquetes descargados)...${NC}"
echo -e "${YELLOW}> curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg${NC}"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo -e "${YELLOW}Agregando el repositorio oficial de Docker a las fuentes de APT (esto permite instalar la última versión de Docker desde el repositorio oficial)...${NC}"
echo -e "${YELLOW}> echo \"deb [arch=\$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \jammy stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null${NC}"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  jammy stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo -e "${YELLOW}Actualizando la lista de paquetes nuevamente para incluir el repositorio de Docker...${NC}"
echo -e "${YELLOW}> sudo apt update${NC}"
sudo apt update

echo -e "${YELLOW}Instalando Docker Engine y herramientas relacionadas:${NC}"
echo -e "${YELLOW}- docker-ce: Docker Community Edition (el motor principal)${NC}"
echo -e "${YELLOW}- docker-ce-cli: Interfaz de línea de comandos de Docker${NC}"
echo -e "${YELLOW}- containerd.io: Runtime de contenedores${NC}"
echo -e "${YELLOW}- docker-buildx-plugin: Plugin para construir imágenes avanzadas${NC}"
echo -e "${YELLOW}- docker-compose-plugin: Plugin para orquestar múltiples contenedores${NC}"
echo -e "${YELLOW}> sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin${NC}"
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo -e "${YELLOW}Agregando tu usuario al grupo 'docker' para poder ejecutar comandos Docker sin sudo (tendrás que cerrar sesión y volver a entrar para que surta efecto)...${NC}"
echo -e "${YELLOW}> sudo usermod -aG docker \$USER${NC}"
sudo usermod -aG docker $USER

echo -e "${GREEN}✅ Docker instalado correctamente.${NC}"
echo -e "${CYAN}🔄 Por favor, cierra sesión y vuelve a entrar para usar Docker sin sudo.${NC}"
