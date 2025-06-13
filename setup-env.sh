#!/bin/bash
set -e
cd "$(dirname "${BASH_SOURCE[0]}")"

# 🎨 Definición de colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

# Detectar si el script fue sourceado
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo -e "${RED}⚠️  Este script fue ejecutado directamente (./setup-env.sh)."
    echo -e "   El entorno virtual NO quedará activo en tu terminal al finalizar.${NC}"
    echo -e "${YELLOW}   Para que el entorno quede activo, ejecuta:${NC}"
    echo -e "${CYAN}   source setup-env.sh${NC}"
    exit 0
fi

# Si el entorno virtual ya está activo, avisar y salir
if [[ -n "$VIRTUAL_ENV" ]]; then
    echo -e "${GREEN}El entorno virtual ya está activo: $VIRTUAL_ENV${NC}"
    return 0
fi

echo -e "${CYAN}🔎 Verificando si existe el entorno virtual .venv...${NC}"
if [ ! -d ".venv" ]; then
    echo -e "${YELLOW}No existe .venv. Creando entorno virtual Python...${NC}"
    python3 -m venv .venv
    chmod -R u+rx .venv/bin
else
    echo -e "${GREEN}El entorno virtual .venv ya existe.${NC}"
fi

echo -e "${CYAN}⏳ Activando el entorno virtual...${NC}"
# shellcheck disable=SC1091
source .venv/bin/activate

echo -e "${CYAN}📦 Instalando/actualizando dependencias desde requirements.txt...${NC}"
pip install --upgrade pip
pip install -r requirements.txt

echo -e "${GREEN}✅ Entorno virtual listo y dependencias instaladas.${NC}"
