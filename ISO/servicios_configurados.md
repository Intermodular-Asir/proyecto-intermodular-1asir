# Descripción de servicios configurados

## 1. Servicio SSH

### Función

Permite administrar el servidor de forma remota mediante terminal segura.

### Instalación

```bash
sudo apt install -y openssh-server
```

### Verificación

```bash
sudo systemctl status ssh
```

### Utilidad en el proyecto

Facilita la administración remota del servidor sin necesidad de acceso físico.

---

## 2. Servicio Apache2 con HTTPS

### Función

Permite publicar páginas o información web desde el servidor, añadiendo cifrado HTTPS para proteger las comunicaciones.

### Instalación

```bash
sudo apt install -y apache2
sudo a2enmod ssl
```

### Verificación

```bash
sudo systemctl status apache2
curl -k https://localhost
```

### Utilidad en el proyecto

Se usa como servidor web básico para mostrar una página inicial del proyecto Intermodular y demostrar una configuración web segura.

---

## 3. Servicio Samba

### Función

Permite compartir carpetas y archivos en red, especialmente con equipos Windows.

### Instalación

```bash
sudo apt install -y samba
```

### Ejemplo de recurso compartido

Se puede definir un recurso para la carpeta `/srv/proyecto` en el archivo `/etc/samba/smb.conf`.

### Verificación

```bash
sudo systemctl status smbd
```

### Utilidad en el proyecto

Permite que los miembros del equipo compartan documentación, prácticas y archivos comunes.

---

## 4. Servicio DNS local

### Función

Permite resolver nombres internos dentro de la red local, por ejemplo `srv-iso.local`, facilitando el acceso a servicios sin depender únicamente de direcciones IP.

### Instalación

```bash
sudo apt install -y bind9 bind9-utils
```

### Verificación

```bash
sudo systemctl status bind9
nslookup srv-iso.local 127.0.0.1
```

### Utilidad en el proyecto

Hace más cómoda la administración del servidor y simula un entorno de red más profesional.

---

## 5. Servicio fail2ban

### Función

Protege el sistema detectando intentos repetidos de autenticación fallida y bloqueando temporalmente el origen atacante.

### Instalación

```bash
sudo apt install -y fail2ban
```

### Verificación

```bash
sudo systemctl status fail2ban
sudo fail2ban-client status
```

### Utilidad en el proyecto

Refuerza la seguridad del acceso SSH y ayuda a reducir ataques por fuerza bruta.

---

## 6. Servicio cron

### Función

Permite programar tareas automáticas del sistema en horarios definidos.

### Uso aplicado en el proyecto

Se utiliza para ejecutar diariamente el script de backup del directorio compartido.

### Ejemplo

```cron
0 2 * * * /usr/local/bin/backup_proyecto.sh
```

### Utilidad en el proyecto

Automatiza tareas de mantenimiento y evita depender de copias manuales.

---

## 7. Script de backup

### Función

Genera copias comprimidas del contenido de `/srv/proyecto` y elimina las más antiguas para controlar el espacio ocupado.

### Ubicación propuesta

```bash
/usr/local/bin/backup_proyecto.sh
```

### Ejecución manual de prueba

```bash
sudo /usr/local/bin/backup_proyecto.sh
```

### Utilidad en el proyecto

Permite mantener una política básica de respaldo ante errores, borrados accidentales o incidencias del sistema.

---

## 8. Firewall UFW

### Función

Controla qué conexiones entran al sistema.

### Configuración básica

```bash
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow Samba
sudo ufw allow 53
sudo ufw enable
```

### Verificación

```bash
sudo ufw status
```

### Utilidad en el proyecto

Aumenta la seguridad del sistema limitando el acceso solo a servicios autorizados.

---

## 9. Conclusión

Los servicios configurados cubren necesidades reales de administración, publicación web segura, resolución DNS local, compartición de archivos, automatización de copias y seguridad, por lo que el sistema implantado resulta más completo, funcional y coherente con el objetivo del proyecto.
