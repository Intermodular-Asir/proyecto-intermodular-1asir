# Plan de implantación

## 1. Objetivo

Planificar la puesta en marcha del sistema operativo y los servicios necesarios para el proyecto Intermodular.

## 2. Fases de implantación

### Fase 1. Preparación

- Selección del sistema operativo
- Descarga de la imagen ISO de Ubuntu Server
- Preparación de la máquina virtual o equipo físico
- Definición del nombre del equipo y direccionamiento de red
- Planificación de IP fija, nombre DNS local y estructura de backups

### Fase 2. Instalación del sistema

- Inicio del instalador
- Selección de idioma y teclado
- Configuración de red
- Particionado del disco
- Instalación del sistema base
- Creación del usuario administrador

### Fase 3. Configuración inicial

- Actualización del sistema
- Instalación de paquetes básicos
- Configuración del nombre del host
- Ajuste de zona horaria
- Configuración de **IP fija con Netplan**
- Verificación de conectividad

### Fase 4. Gestión de usuarios y permisos

- Creación de usuarios del sistema
- Creación de grupos de trabajo
- Asignación de permisos
- Preparación de carpetas compartidas
- Creación del directorio de copias de seguridad

### Fase 5. Instalación de servicios

- Instalación y configuración de SSH
- Instalación y configuración de Apache2
- Activación de **HTTPS en Apache**
- Instalación y configuración de Samba
- Instalación y configuración de **DNS local**
- Instalación y configuración de **fail2ban**
- Activación del firewall UFW

### Fase 6. Automatización y mantenimiento

- Creación del **script de backup**
- Programación de copias automáticas con **cron**
- Verificación de permisos del script y del directorio de respaldo
- Comprobación de generación correcta de copias

### Fase 7. Comprobación y documentación

- Pruebas de acceso remoto
- Pruebas de acceso web por HTTP y HTTPS
- Pruebas de resolución DNS local
- Pruebas de acceso a carpetas compartidas
- Verificación de fail2ban y cron
- Captura de evidencias
- Redacción final de la documentación

## 3. Riesgos previstos

- error en la configuración de red
- fallo en la sintaxis del archivo de Netplan
- permisos mal asignados
- puertos cerrados en el firewall
- servicios mal arrancados o no habilitados al inicio
- errores en la programación automática de backups
- bloqueo indebido o configuración incorrecta de fail2ban
- certificados HTTPS mal configurados

## 4. Medidas preventivas

- verificar conectividad tras cada fase
- validar Netplan antes de aplicar cambios permanentes
- probar usuarios con permisos distintos
- documentar cada cambio realizado
- reiniciar servicios y comprobar su estado
- ejecutar manualmente el script de backup antes de programarlo
- revisar logs de fail2ban y Apache
- comprobar acceso HTTPS desde navegador o con `curl`

## 5. Resultado esperado

Al finalizar la implantación, el sistema deberá quedar operativo con acceso remoto, servicio web seguro mediante HTTPS, resolución DNS local, compartición de archivos y una estructura básica de usuarios y permisos correctamente configurada, incluyendo copias de seguridad automáticas y medidas de protección adicionales.
