# Proyecto Intermodular ISO - 1º ASIR

## Módulo

Implantación de Sistemas Operativos

## Descripción general

Este proyecto plantea el diseño e implantación de una pequeña infraestructura de sistemas para el proyecto **Intermodular**, con el objetivo de disponer de un entorno organizado, seguro y funcional para servicios básicos de una empresa tecnológica.

La propuesta se basa en un servidor principal con sistema GNU/Linux, sobre el que se configuran usuarios, permisos y servicios esenciales para administración, compartición de archivos, copias de seguridad, resolución de nombres local y acceso remoto seguro.

## Contenido de la entrega

- `analisis_sistema.md`: estudio de necesidades y elección del sistema operativo.
- `plan_implantacion.md`: planificación del despliegue del sistema.
- `instalacion_sistema.md`: documentación del proceso de instalación.
- `configuracion_sistema.md`: ajustes y configuración del entorno.
- `usuarios_permisos.md`: gestión de usuarios, grupos y permisos.
- `servicios_configurados.md`: descripción de los servicios instalados.
- `backup_proyecto.sh`: ejemplo de script de copia de seguridad.
- `ENTREGA_COMPLETA.md`: resumen global de la práctica.

## Escenario propuesto

Se ha diseñado una infraestructura sencilla pero realista:

- **Sistema operativo principal:** Ubuntu Server 24.04 LTS
- **Hostname del servidor:** `srv-iso`
- **Rol del servidor:** servidor de administración y servicios básicos
- **Servicios principales:** SSH, Samba, Apache2 con HTTPS, DNS local, copias de seguridad automatizadas, cron, fail2ban y firewall UFW

## Mejoras implementadas en esta versión

Además de la base inicial, la documentación incorpora:

- configuración de **IP fija con Netplan**
- implantación de un **DNS local** para resolver nombres internos
- creación de un **script de backup**
- automatización de copias mediante **cron**
- protección frente a intentos de acceso indebido con **fail2ban**
- publicación web segura con **HTTPS en Apache**

## Justificación de la elección

Se ha elegido **Ubuntu Server** por los siguientes motivos:

- estabilidad en entornos de servidor
- gran documentación y soporte
- facilidad de administración
- compatibilidad con servicios habituales en redes empresariales
- buena relación entre seguridad, mantenimiento y rendimiento

## Objetivos de la implantación

- Instalar y configurar correctamente el sistema operativo
- Preparar el servidor para administración remota
- Organizar usuarios, grupos y permisos
- Compartir recursos de forma controlada
- Publicar un servicio web básico con HTTPS
- Configurar red estable con IP fija y resolución DNS local
- Automatizar copias de seguridad mediante script y cron
- Reforzar la seguridad del sistema con UFW y fail2ban
- Documentar todo el proceso de implantación

## Orden recomendado de lectura

1. `analisis_sistema.md`
2. `plan_implantacion.md`
3. `instalacion_sistema.md`
4. `configuracion_sistema.md`
5. `usuarios_permisos.md`
6. `servicios_configurados.md`
7. `ENTREGA_COMPLETA.md`

## Nota final

Esta entrega está organizada para cumplir con los requisitos del módulo de Implantación de Sistemas Operativos, presentando un caso coherente, técnicamente justificable y fácil de defender en clase.
