#!/bin/bash
FECHA=$(date +%F-%H%M)
DESTINO="/backups/proyecto-$FECHA.tar.gz"
ORIGEN="/srv/proyecto"

mkdir -p /backups

tar -czf "$DESTINO" "$ORIGEN"
find /backups -type f -name "proyecto-*.tar.gz" -mtime +7 -delete

echo "Backup completado: $DESTINO"
