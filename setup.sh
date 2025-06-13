#!/bin/bash
set -e
cd "$(dirname "${BASH_SOURCE[0]}")"

# 🎨 Definición de colores
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}🔄 Ejecutando setup-docker.sh para levantar la base de datos Sakila en Docker...${NC}"
./setup-docker.sh

echo -e "${CYAN}🔄 Ejecutando setup-env.sh para activar el entorno virtual Python y dependencias...${NC}"
# Recomendado: sourcear manualmente setup-env.sh después, pero aquí lo ejecutamos para instalar dependencias
source setup-env.sh

echo -e "${CYAN}✅ Entorno listo. Ya puedes lanzar Jupyter Notebook y practicar SQL.${NC}"
echo -e "${CYAN}Recuerda: si quieres que el entorno virtual quede activo en tu terminal, ejecuta:${NC}"
echo -e "${CYAN}   source setup-env.sh${NC}"
