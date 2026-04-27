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

## 🧭 ¿Qué es este proyecto?

El **Proyecto Intermodular de 1º** es una iniciativa de **Prometeo by The Power** que integra todos los módulos del ciclo en un único proyecto real de infraestructura TI empresarial. No se trata de asignaturas sueltas, sino de un sistema coherente: el hardware, la red, el sistema operativo, la base de datos y la documentación estructurada funcionando juntos como lo harían en un entorno profesional.

Este repositorio es además la base del **portfolio profesional** del equipo, pensado para seguir desarrollándose en 2º curso.

---

## 👥 Equipo

<div align="center">

| 👤 | Nombre | GitHub |
|----|--------|--------|
| 💻 | **Pilar Bordas** | [@usuario](https://github.com/Goxua9) |
| 💻 | **Diego Moreno** | [@usuario](https://github.com/baralfx) |
| 💻 | **Nauzet Doreste** | [@usuario](https://github.com/ndoreste) |

*Centro: Prometeo by The Power · Curso: 2025/2026*

</div>

---

## 📁 Estructura del repositorio

```
📦 proyecto-intermodular-1asir/
│
├── 📁 docs/
│   ├── 📁 hardware/          → Módulo 0371 · Fundamentos de Hardware
│   ├── 📁 redes/             → Módulo 0370 · Planificación y Administración de Redes
│   ├── 📁 sistemas/          → Módulo 0369 · Implantación de Sistemas Operativos
│   ├── 📁 xml/               → Módulo 0373 · Lenguajes de Marcas
│   │   ├── datos.xml
│   │   ├── esquema.xsd
│   │   └── evidencia_validacion/
│   ├── 📁 cloud/             → MPO · Fundamentos de Computación en la Nube
│   └── 📁 empleabilidad/     → Módulo 1709 · Itinerario Personal para la Empleabilidad
│
├── 📁 base_de_datos/         → Módulo 0372 · Gestión de Bases de Datos
│   ├── 📄 schema.sql
│   ├── 📄 datos_prueba.sql
│   ├── 📄 consultas.sql
│   └── 📄 diagrama_er.png
│
└── 📄 README.md
```

---

## 🗂️ Módulos del proyecto

El proyecto integra **todos los módulos de 1º ASIR**, cada uno aportando una capa distinta de la infraestructura:

| Código | Módulo | Aportación al proyecto |
|--------|--------|------------------------|
| `0371` | **Fundamentos de Hardware** | Análisis y diseño de la infraestructura física |
| `0372` | **Gestión de Bases de Datos** | Diseño e implementación de la base de datos |
| `0369` | **Implantación de Sistemas Operativos** | Despliegue y configuración de los sistemas |
| `0373` | **Lenguajes de Marcas** | Documentación estructurada en XML/XSD |
| `0370` | **Planificación y Adm. de Redes** | Topología, direccionamiento IP y servicios de red |
| `CMO`  | **Fundamentos de Computación en la Nube** | Arquitectura cloud y estimación de costes |
| `1709` | **Itinerario para la Empleabilidad I** | Perfil profesional y portfolio |

---

## 🏗️ Infraestructura del sistema

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

## 🔩 Módulo 0371 · Fundamentos de Hardware

> Análisis y diseño de la infraestructura física del sistema.

**Contenido del módulo:**

- Análisis de necesidades de hardware de la empresa/sistema
- Descripción de componentes (CPU, RAM, almacenamiento, fuentes, tarjetas)
- Configuración de hardware propuesta y justificada
- Sistema de almacenamiento (SSD/HDD, capacidad, uso previsto)
- Reflexión sobre mejoras y evolución del sistema

📂 Documentación: [`/docs/hardware/`](./docs/hardware/)

---

## 🌐 Módulo 0370 · Planificación y Administración de Redes

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

📂 Documentación: [`/docs/redes/`](./docs/redes/)

---

## 🐧 Módulo 0369 · Implantación de Sistemas Operativos

> Diseño, instalación y configuración de los sistemas operativos de la infraestructura.

**Contenido del módulo:**

- Análisis y justificación de los sistemas operativos elegidos
- Plan de implantación (instalación manual / VMs)
- Documentación del proceso de instalación con capturas
- Configuración del sistema (hostname, red, actualizaciones, paquetes)
- Gestión de usuarios, grupos y permisos
- Configuración de servicios básicos (acceso remoto, compartición, etc.)

📂 Documentación: [`/docs/sistemas/`](./docs/sistemas/)

---

## 🗄️ Módulo 0372 · Gestión de Bases de Datos

> Diseño, implementación y administración de la base de datos del sistema.

**Contenido del módulo:**

- Análisis de los datos que necesita almacenar el sistema
- Diseño del modelo relacional / diagrama E-R
- Script SQL de creación de tablas, claves y restricciones
- Datos de prueba (INSERTs coherentes)
- Consultas útiles: SELECT con filtros, JOINs, listados
- Administración básica: backups, exportación, gestión de usuarios

**Cómo ejecutar la base de datos:**

```bash
# Crear la base de datos
mysql -u root -p < base_de_datos/schema.sql

# Insertar datos de prueba
mysql -u root -p nombre_bbdd < base_de_datos/datos_prueba.sql

# Ejecutar consultas
mysql -u root -p nombre_bbdd < base_de_datos/consultas.sql
```

📂 Scripts: [`/base_de_datos/`](./base_de_datos/)

---

## 📄 Módulo 0373 · Lenguajes de Marcas

> Gestión y validación de información estructurada mediante XML y XSD.

**Contenido del módulo:**

- Documento XML con datos reales del sistema (coherente con la BD)
- Esquema XSD para validar el XML (estructura, tipos, restricciones, cardinalidades)
- Evidencia de validación correcta
- Integración con el proyecto (exportación/importación de datos)

**Validar el XML:**

```bash
# Validación con xmllint
xmllint --schema docs/xml/esquema.xsd docs/xml/datos.xml --noout
```

📂 Archivos: [`/docs/xml/`](./docs/xml/)

---

## ☁️ MPO · Fundamentos de Computación en la Nube

> Análisis y diseño de una arquitectura cloud básica para el proyecto.

**Contenido del módulo:**

- Elección y justificación del proveedor cloud
- Arquitectura cloud propuesta (dónde se ejecuta la app, BD, acceso de usuarios)
- Servicios cloud utilizados (instancias, BD gestionada, almacenamiento)
- Estimación de costes mensuales con calculadora del proveedor

📂 Documentación: [`/docs/cloud/`](./docs/cloud/)

---

## 💼 Módulo 1709 · Itinerario Personal para la Empleabilidad I

> Construcción de la identidad profesional de cada miembro del equipo.

**Contenido del módulo:**

- Perfil profesional personal (qué estudia, qué tecnologías, hacia dónde va)
- Investigación del sector (empresas, perfiles LinkedIn/GitHub a seguir)
- Presentación del proyecto orientada a entrevistas / empleabilidad
- Portfolio básico con capturas, explicaciones y aprendizajes
- Reflexión personal del proceso

📂 Documentación: [`/docs/empleabilidad/`](./docs/empleabilidad/)

---

## 📅 Fases del proyecto

```
FASE 1 · Idea y planteamiento        ████████████████████  ✅
FASE 2 · Diseño de infraestructura   ████████████████░░░░  En curso
FASE 3 · Sistemas y servicios        ████████████░░░░░░░░  En curso
FASE 4 · Gestión de datos            ████████░░░░░░░░░░░░  En curso
FASE 5 · Lenguajes de marcas         ████░░░░░░░░░░░░░░░░  Pendiente
FASE 6 · Revisión del sistema        ░░░░░░░░░░░░░░░░░░░░  Pendiente
FASE 7 · Limpieza y entrega final    ░░░░░░░░░░░░░░░░░░░░  Pendiente
```

> **⏰ Fecha límite de entrega: Domingo 3 de mayo de 2025 a las 23:59**

---

## 🛠️ Tecnologías utilizadas

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

## 👨‍🏫 Tutores de referencia

| Módulos | Tutor | Contacto |
|---------|-------|----------|
| Redes · Cloud · SO · Hardware | **Miguel Ángel Alayón** | miguel.alayon@thepower.education |
| Bases de Datos · Lenguajes de Marcas | **Francisco Molpeceres Blázquez** | francisco.molpeceres@thepower.education |

---

<div align="center">

**Pilar Bordas · Diego Moreno · Nauzet Doreste**

*1º ASIR Virtual · Prometeo by The Power · 2024/2025*

<br/>

*Este proyecto no es una asignatura oficial, pero sí el primer paso de nuestro portfolio profesional.*
*Lo que construimos aquí, lo llevamos a 2º — y después, al mundo laboral.*

</div>
