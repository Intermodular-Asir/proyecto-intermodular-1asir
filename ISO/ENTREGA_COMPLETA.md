# Entrega completa - Proyecto Intermodular ISO

## Proyecto

Infraestructura básica del proyecto Intermodular sobre Ubuntu Server 24.04 LTS.

## 1. Análisis del sistema

Se estudian las necesidades del entorno y se justifica la elección de Ubuntu Server como sistema operativo para el servidor principal, incluyendo requisitos de red, automatización y seguridad.

## 2. Plan de implantación

Se organiza el despliegue en fases:

- preparación
- instalación
- configuración inicial
- usuarios y permisos
- servicios
- automatización y copias de seguridad
- comprobaciones finales

## 3. Instalación del sistema

Se documenta el proceso completo de instalación del sistema operativo, desde el arranque con la ISO hasta el primer inicio del servidor.

## 4. Configuración del sistema

Se incluyen tareas como:

- actualización del sistema
- configuración del hostname `srv-iso`
- ajuste de zona horaria
- instalación de paquetes esenciales
- configuración de **IP fija con Netplan**
- configuración de **DNS local**
- activación del firewall
- configuración de **HTTPS en Apache**
- activación de **fail2ban**
- creación de **script de backup** y automatización con **cron**

## 5. Gestión de usuarios y permisos

Se definen usuarios, grupos y permisos para simular una organización real con acceso controlado a carpetas compartidas y al entorno de trabajo del proyecto.

## 6. Servicios configurados

Se implantan y describen estos servicios:

- SSH
- Apache2 con HTTPS
- Samba
- DNS local
- fail2ban
- cron
- UFW

## 7. Organización y documentación

Toda la información está organizada en archivos independientes para facilitar la revisión, la subida a GitHub y la defensa del proyecto.

## Conclusión

La implantación propuesta ofrece un sistema funcional, administrable y documentado, adecuado para cumplir con los requisitos del módulo de Implantación de Sistemas Operativos. Además, incorpora mejoras realistas de red, seguridad y mantenimiento que refuerzan la calidad técnica de la entrega.
