<div align="center">

```
██████╗ ██████╗  ██████╗ ███╗   ███╗███████╗████████╗███████╗ ██████╗
██╔══██╗██╔══██╗██╔═══██╗████╗ ████║██╔════╝╚══██╔══╝██╔════╝██╔═══██╗
██████╔╝██████╔╝██║   ██║██╔████╔██║█████╗     ██║   █████╗  ██║   ██║
██╔═══╝ ██╔══██╗██║   ██║██║╚██╔╝██║██╔══╝     ██║   ██╔══╝  ██║   ██║
██║     ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗   ██║   ███████╗╚██████╔╝
╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝   ╚═╝   ╚══════╝ ╚═════╝
```

<br/>

# Proyecto Intermodular · 1º ASIR
### Técnico Superior en Administración de Sistemas Informáticos en Red
#### **Prometeo by The Power FP Oficial** — Modalidad Virtual

<br/>

![Ciclo](https://img.shields.io/badge/Ciclo-1º%20ASIR-0a0a0a?style=for-the-badge&labelColor=b5f542)
![Centro](https://img.shields.io/badge/Centro-Prometeo-0a0a0a?style=for-the-badge&labelColor=b5f542)
![Modalidad](https://img.shields.io/badge/Modalidad-Virtual-0a0a0a?style=for-the-badge&labelColor=b5f542)
![Entrega](https://img.shields.io/badge/Entrega-3%20de%20Mayo-0a0a0a?style=for-the-badge&labelColor=ff4757)

<br/>

> *Diseño, despliegue y documentación de una infraestructura tecnológica completa para una empresa real.*

<br/>

</div>

---

## ¿Qué es este proyecto?

El **Proyecto Intermodular de 1º** es una iniciativa de **Prometeo by The Power** que integra todos los módulos del ciclo en un único proyecto real de infraestructura TI empresarial. No se trata de asignaturas sueltas, sino de un sistema coherente: el hardware, la red, el sistema operativo, la base de datos y la documentación estructurada funcionando juntos como lo harían en un entorno profesional.

Este repositorio es además la base del **portfolio profesional** del equipo, pensado para seguir desarrollándose en 2º curso.

---

## El equipo

<div align="center">

| 👤 | Nombre | GitHub |
|----|--------|--------|
| 💻 | **Pilar Bordas** | [@usuario](https://github.com/Goxua9) |
| 💻 | **Diego Moreno** | [@usuario](https://github.com/baralfx) |
| 💻 | **Nauzet Doreste** | [@usuario](https://github.com/ndoreste) |

*Centro: Prometeo by The Power · Curso: 2025/2026*

</div>

---

## Módulos del proyecto

El proyecto integra **todos los módulos de 1º ASIR**, cada uno aportando una capa distinta de la infraestructura:

| Módulo                              | Aportación al proyecto                                         |
|-------------------------------------|-----------------------------------------------------------------|
| **Fundamentos de Hardware**         | Análisis y diseño de la infraestructura física                   |
| **Gestión de Bases de Datos**       | Diseño e implementación de la base de datos                     |
| **Implantación de Sistemas Operativos** | Despliegue y configuración de los sistemas                 |
| **Lenguajes de Marcas**             | Documentación estructurada en XML/XSD                           |
| **Planificación y Adm. de Redes**   | Topología, direccionamiento IP y servicios de red               |
| **Fundamentos de Computación en la Nube** | Arquitectura cloud y estimación de costes              |
| **Itinerario para la Empleabilidad I** | Perfil profesional y portfolio                             |

---

## Infraestructura del sistema

```
                        ┌─────────────────────────────────────────┐
                        │           INFRAESTRUCTURA TI             │
                        └─────────────────────────────────────────┘

  INTERNET
     │
     ▼
┌─────────┐       ┌─────────────┐       ┌──────────────────┐
│ FIREWALL│──────▶│  ROUTER /   │──────▶│  SWITCH CORE     │
└─────────┘       │  GATEWAY    │       └────────┬─────────┘
                  └─────────────┘                │
                                    ┌────────────┼────────────┐
                                    ▼            ▼            ▼
                             ┌────────────┐ ┌─────────┐ ┌─────────┐
                             │ SERVIDOR   │ │SERVIDOR │ │EQUIPOS  │
                             │    WEB     │ │   BD    │ │CLIENTE  │
                             └────────────┘ └─────────┘ └─────────┘
                                    │            │
                                    └──────┬─────┘
                                           ▼
                                    ┌────────────┐
                                    │  BACKUP /  │
                                    │ ALMACEN.   │
                                    └────────────┘
```

---

## Fundamentos de Hardware

> Análisis y diseño de la infraestructura física del sistema.

**Contenido del módulo:**

- Análisis de necesidades de hardware de la empresa/sistema
- Descripción de componentes (CPU, RAM, almacenamiento, fuentes, tarjetas)
- Configuración de hardware propuesta y justificada
- Sistema de almacenamiento (SSD/HDD, capacidad, uso previsto)
- Reflexión sobre mejoras y evolución del sistema

---

## Planificación y Administración de Redes

> Diseño y documentación de la infraestructura de red.

**Contenido del módulo:**

- Análisis de necesidades de red (equipos, servicios, acceso)
- Diagrama de topología de red
- Plan de direccionamiento IP
- Identificación y descripción de dispositivos de red
- Servicios de red: DHCP, DNS, acceso remoto, compartición de archivos

**Esquema de direccionamiento:**

```
Red:            192.168.10.0/24
Gateway:        192.168.10.1
Servidor web:   192.168.10.10
Servidor BD:    192.168.10.11
Clientes:       192.168.10.100 – 192.168.10.200
```

---

## Implantación de Sistemas Operativos

> Diseño, instalación y configuración de los sistemas operativos de la infraestructura.

**Contenido del módulo:**

- Análisis y justificación de los sistemas operativos elegidos
- Plan de implantación (instalación manual / VMs)
- Documentación del proceso de instalación con capturas
- Configuración del sistema (hostname, red, actualizaciones, paquetes)
- Gestión de usuarios, grupos y permisos
- Configuración de servicios básicos (acceso remoto, compartición, etc.)

---

## Gestión de Bases de Datos

> Diseño, implementación y administración de la base de datos del sistema.

**Contenido del módulo:**

- Análisis de los datos que necesita almacenar el sistema
- Diseño del modelo relacional / diagrama E-R
- Script SQL de creación de tablas, claves y restricciones
- Datos de prueba (INSERTs coherentes)
- Consultas útiles: SELECT con filtros, JOINs, listados
- Administración básica: backups, exportación, gestión de usuarios

---

## Lenguajes de Marcas

> Gestión y validación de información estructurada mediante XML y XSD.

**Contenido del módulo:**

- Documento XML con datos reales del sistema (coherente con la BD)
- Esquema XSD para validar el XML (estructura, tipos, restricciones, cardinalidades)
- Evidencia de validación correcta
- Integración con el proyecto (exportación/importación de datos)

---

## Fundamentos de Computación en la Nube

> Análisis y diseño de una arquitectura cloud básica para el proyecto.

**Contenido del módulo:**

- Elección y justificación del proveedor cloud
- Arquitectura cloud propuesta (dónde se ejecuta la app, BD, acceso de usuarios)
- Servicios cloud utilizados (instancias, BD gestionada, almacenamiento)
- Estimación de costes mensuales con calculadora del proveedor

---

## Itinerario Personal para la Empleabilidad I

> Construcción de la identidad profesional de cada miembro del equipo.

**Contenido del módulo:**

- Perfil profesional personal (qué estudia, qué tecnologías, hacia dónde va)
- Investigación del sector (empresas, perfiles LinkedIn/GitHub a seguir)
- Presentación del proyecto orientada a entrevistas / empleabilidad
- Portfolio básico con capturas, explicaciones y aprendizajes
- Reflexión personal del proceso

---

## Tecnologías utilizadas

<div align="center">

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Windows Server](https://img.shields.io/badge/Windows_Server-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![VirtualBox](https://img.shields.io/badge/VirtualBox-183A61?style=for-the-badge&logo=virtualbox&logoColor=white)
![XML](https://img.shields.io/badge/XML%20%2F%20XSD-FF6600?style=for-the-badge&logo=w3c&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

</div>

---

<div align="center">

**Pilar Bordas · Diego Moreno · Nauzet Doreste**

*1º ASIR · Prometeo by The Power · 2025/2026*

<br/>

*Este proyecto no es una asignatura oficial, pero sí el primer paso de nuestro portfolio profesional.*
*Lo que construimos aquí, lo llevamos a 2º — y después, al mundo laboral.*

</div>
