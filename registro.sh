#!/bin/bash

archivo="log.md"
fecha=$(date '+%Y-%m-%d')
echo "Ingresa tu avance de hoy:"
read -r entrada

# Formatear entrada
nueva_entrada="## $fecha\n\n$entrada\n\n---\n"

# Insertar al inicio del archivo (crearlo si no existe)
if [ ! -f "$archivo" ]; then
  echo -e "$nueva_entrada" > "$archivo"
else
  tmp=$(mktemp)
  echo -e "$nueva_entrada$(cat "$archivo")" > "$tmp"
  mv "$tmp" "$archivo"
fi

# Hacer commit automático
git add .
git commit -m "$fecha : $entrada"
git push
