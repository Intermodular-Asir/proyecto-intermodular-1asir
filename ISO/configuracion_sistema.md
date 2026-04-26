# Configuración del sistema

## 1. Actualización del sistema

Una vez instalado el sistema operativo, se actualizó para garantizar que todos los paquetes estuvieran en su versión más reciente.

```bash
sudo apt update
sudo apt upgrade -y
```

## 2. Configuración del nombre del host

Se definió un nombre identificativo para el servidor:

```bash
sudo hostnamectl set-hostname srv-iso
```

## 3. Configuración horaria

Se estableció la zona horaria correcta para asegurar la coherencia en registros y servicios.

```bash
sudo timedatectl set-timezone Europe/Madrid
```

## 4. Instalación de herramientas y paquetes necesarios

Se instalaron las herramientas necesarias para administración, servicios y seguridad:

```bash
sudo apt install -y openssh-server apache2 samba ufw net-tools fail2ban bind9 bind9-utils
```

## 5. Configuración de IP fija con Netplan

Para evitar cambios en la dirección IP del servidor, se configuró una IP fija mediante Netplan.

Ejemplo de archivo `/etc/netplan/00-installer-config.yaml`:

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: false
      addresses:
        - 192.168.1.50/24
      routes:
        - to: default
          via: 192.168.1.1
      nameservers:
        addresses:
          - 127.0.0.1
          - 8.8.8.8
```

Aplicación de cambios:

```bash
sudo netplan apply
```

Comprobación:

```bash
ip a
ip route
```

## 6. Configuración de DNS local

Se configuró un servicio DNS local para resolver nombres internos como `srv-iso.local`.

Instalación ya realizada con Bind9. A continuación, se configuró una zona local básica:

```bash
sudo nano /etc/bind/named.conf.local
```

Ejemplo de zona:

```bash
zone "srv-iso.local" {
    type master;
    file "/etc/bind/db.srv-iso.local";
};
```

Ejemplo del archivo de zona `/etc/bind/db.srv-iso.local`:

```bash
$TTL 604800
@   IN  SOA srv-iso.local. root.srv-iso.local. (
        2
        604800
        86400
        2419200
        604800 )
@       IN  NS      srv-iso.local.
@       IN  A       192.168.1.50
srv-iso IN  A       192.168.1.50
```

Reinicio y verificación:

```bash
sudo systemctl restart bind9
sudo systemctl status bind9
nslookup srv-iso.local 127.0.0.1
```

## 7. Configuración del firewall

Se habilitó el firewall UFW permitiendo únicamente los servicios necesarios.

```bash
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow Samba
sudo ufw allow 53
sudo ufw enable
```

## 8. Configuración de HTTPS en Apache

Para cifrar el acceso web, se activó SSL en Apache y se creó un certificado autofirmado para prácticas.

```bash
sudo a2enmod ssl
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/apache-selfsigned.key \
  -out /etc/ssl/certs/apache-selfsigned.crt
```

Se configuró un VirtualHost SSL en `/etc/apache2/sites-available/default-ssl.conf` y se habilitó con:

```bash
sudo a2ensite default-ssl.conf
sudo systemctl reload apache2
```

Verificación:

```bash
sudo systemctl status apache2
curl -k https://localhost
```

## 9. Configuración de fail2ban

Se instaló y activó fail2ban para proteger principalmente el acceso SSH frente a intentos repetidos de autenticación fallida.

Archivo básico `/etc/fail2ban/jail.local`:

```ini
[sshd]
enabled = true
port = ssh
logpath = %(sshd_log)s
maxretry = 5
findtime = 10m
bantime = 1h
```

Aplicación y comprobación:

```bash
sudo systemctl enable fail2ban
sudo systemctl restart fail2ban
sudo fail2ban-client status
```

## 10. Script de backup y automatización con cron

Se creó un script para guardar copias comprimidas del directorio compartido en `/backups`.

Ejemplo de script `/usr/local/bin/backup_proyecto.sh`:

```bash
#!/bin/bash
FECHA=$(date +%F-%H%M)
DESTINO="/backups/proyecto-$FECHA.tar.gz"
mkdir -p /backups
tar -czf "$DESTINO" /srv/proyecto
find /backups -type f -name "proyecto-*.tar.gz" -mtime +7 -delete
```

Permisos del script:

```bash
sudo chmod +x /usr/local/bin/backup_proyecto.sh
```

Programación diaria con cron a las 02:00:

```bash
sudo crontab -e
```

Línea añadida:

```cron
0 2 * * * /usr/local/bin/backup_proyecto.sh
```

Prueba manual:

```bash
sudo /usr/local/bin/backup_proyecto.sh
ls -lh /backups
```

## 11. Verificación final de servicios

Se verificó que los servicios quedaran activos y habilitados en el arranque.

```bash
sudo systemctl status ssh
sudo systemctl status apache2
sudo systemctl status smbd
sudo systemctl status bind9
sudo systemctl status fail2ban
```

## 12. Resultado de la configuración

Con esta configuración, el sistema quedó preparado para:

- administración remota mediante SSH
- publicación de contenido web mediante Apache2 con HTTPS
- compartición de archivos mediante Samba
- resolución local de nombres con DNS propio
- copias de seguridad automáticas mediante script y cron
- protección adicional con firewall y fail2ban

## 13. Conclusión

La configuración realizada convierte una instalación base de Ubuntu Server en un sistema funcional para ofrecer servicios básicos en el proyecto Intermodular, añadiendo además mejoras reales de red, seguridad y mantenimiento.
