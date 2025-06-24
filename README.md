# 🧠 HTB Obsidian Note Creator

Este script automatiza la creación de una estructura de notas en **Obsidian** para organizar la resolución de máquinas en **Hack The Box**, además de iniciar la conexión VPN.

---

## 🚀 ¿Qué hace?

1. Valida la IP y nombre de la máquina que le pases.
2. Comprueba si tienes **Obsidian** instalado (y ofrece instalarlo si no).
3. Crea un conjunto de archivos `.md` con secciones útiles para pentesting:
   - Enumeración
   - Evaluación de vulnerabilidades
   - Explotación
   - Post-Explotación
4. Intenta conectar a la VPN de Hack The Box usando el archivo `htb.ovpn`.

---

## 📦 Requisitos

- Sistema operativo basado en Debian (para instalación de Obsidian vía `apt`).
- Tener configurado el archivo `htb.ovpn` en la misma carpeta del script.
- Obsidian instalado o permisos sudo para instalarlo.
- Carpeta de notas existente en `~/Documents/Obsidian Vault/`.

---

## 🛠️ Uso

```bash
chmod +x obsidian_note_generator.sh
./obsidian_note.sh <IP> <nombre_maquina>
```

Ejemplo:

```bash
./obsidian_note.sh 10.10.10.10 Blue
```

---

## 📝 Estructura de archivos generados

```
~/Documents/Obsidian Vault/Blue/
├── Enumeracion_Blue.md
├── Evaluacion_de_Vulnerabilidades_Blue.md
├── Explotacion_Blue.md
└── Post-Explotación_Blue.md
```

---

## ⚠️ Notas

- El script no edita los archivos `.md`, solo los genera vacíos para que tú los rellenes.
- La conexión VPN requiere que `htb.ovpn` esté bien configurado y en la misma carpeta que este script.

---

## 📇 Autor

**Pablo García Maturana**  
[LinkedIn](https://www.linkedin.com/in/pablo-garcia-maturana/) | [Hack The Box](https://app.hackthebox.com/profile/1007679)

---
