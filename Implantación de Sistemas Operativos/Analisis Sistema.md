# Análisis del sistema operativo

## 1. Situación planteada

El proyecto Intermodular necesita una infraestructura básica para comenzar a operar de forma organizada. Se requiere un sistema capaz de ofrecer administración remota, alojamiento de un sitio web informativo, compartición de archivos internos, gestión segura de usuarios y medidas adicionales de seguridad y automatización.

## 2. Necesidades detectadas

Las principales necesidades del sistema son:

- disponer de un servidor estable y seguro
- permitir la administración remota del sistema
- ofrecer un servicio web básico con acceso cifrado
- permitir compartir archivos entre usuarios autorizados
- gestionar usuarios y permisos de forma centralizada
- configurar una **IP fija** para facilitar la administración
- disponer de un **DNS local** para resolver nombres internos
- automatizar **copias de seguridad**
- programar tareas periódicas con **cron**
- reforzar el sistema frente a ataques con **fail2ban**
- documentar correctamente todo el proceso de implantación

## 3. Sistema operativo elegido

Se selecciona **Ubuntu Server 24.04 LTS** como sistema operativo principal.

## 4. Motivos de la elección

Se elige Ubuntu Server por los siguientes motivos:

- es una distribución ampliamente utilizada en servidores
- cuenta con soporte a largo plazo (LTS)
- dispone de gran cantidad de documentación y comunidad
- facilita la instalación de servicios comunes
- ofrece buena estabilidad y seguridad
- es adecuada para un entorno académico y profesional

## 5. Diseño general del sistema

El sistema se plantea como un servidor central con varios roles:

- **servidor de administración**, mediante acceso SSH
- **servidor web**, mediante Apache2 con HTTPS
- **servidor de archivos**, mediante Samba
- **servidor DNS local**, para resolución de nombres interna
- **sistema protegido**, mediante UFW, fail2ban y permisos de usuarios
- **sistema automatizado**, mediante script de backup y tareas cron

## 6. Recursos necesarios

Para una implantación básica se considera suficiente:

- 2 CPU virtuales
- 4 GB de RAM
- 40 GB de almacenamiento
- conexión de red

## 7. Ventajas del diseño

Este diseño permite:

- centralizar servicios en una misma máquina
- simplificar la administración
- trabajar con direccionamiento fijo y resolución local de nombres
- proteger el acceso remoto y el servicio web
- automatizar tareas de mantenimiento
- practicar tareas reales de implantación
- demostrar competencias de instalación, configuración y mantenimiento

## 8. Conclusión

El análisis determina que Ubuntu Server es una opción adecuada para implantar los servicios básicos del proyecto Intermodular, ya que cubre las necesidades técnicas, facilita la administración y permite una documentación clara del proceso, incorporando además medidas de red, seguridad y automatización propias de un entorno real.
