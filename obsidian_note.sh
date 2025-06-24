#!/bin/bash

# --- Comprobar que se han pasado dos argumentos ---

if [ $# -lt 2 ]; then

    echo "Uso: $0 <IP> <nombre_maquina>"

    exit 1

fi

IP=$1

MAQUINA=$2

# --- Validar que el primer argumento es una IP válida ---

IP_REGEX="^((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])\.){3}(25[0-5]|2[0-4][0-9]|[1-9]?[0-9])$"

if [[ $IP =~ $IP_REGEX ]]; then

    echo "Dirección IP válida: $IP"

else

    echo "Error: '$IP' no es una dirección IP válida."

    exit 1

fi

# --- Comprobar si Obsidian está instalado ---

if ! command -v obsidian >/dev/null 2>&1; then

    echo "Obsidian no está instalado."

    read -p "¿Quieres instalar Obsidian? (y/n): " respuesta

    if [[ "$respuesta"  "y" || "$respuesta"  "Y" ]]; then

        echo "Instalando Obsidian..."

        sudo apt update

        sudo apt install -y obsidian

        echo "Obsidian ha sido instalado correctamente."

    else

        echo "Obsidian no será instalado."

        exit 0

    fi

fi

# --- Crear las carpetas y archivos en Obsidian ---

file_path="/home/$USER/Documents/Obsidian Vault/$MAQUINA"

mkdir -p "$file_path"

touch "$file_path/Enumeracion_$MAQUINA.md" \

      "$file_path/Evaluacion_de_Vulnerabilidades_$MAQUINA.md" \

      "$file_path/Explotacion_$MAQUINA.md" \

      "$file_path/Post-Explotación_$MAQUINA.md"

echo "Archivos creados en $file_path."

# --- Conectar a Hack the Box con OpenVPN ---

OVPN_FILE="htb.ovpn"

if [ ! -f "$OVPN_FILE" ]; then

    echo "Error: No se encuentra el archivo de configuración '$OVPN_FILE'."

    exit 1

fi

echo "Conectando a Hack the Box..."

sudo openvpn --config "$OVPN_FILE" --remote "$IP"
