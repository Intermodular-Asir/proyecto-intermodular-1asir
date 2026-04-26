# Documentación de la instalación del sistema

## 1. Preparación previa
Para la instalación se utilizó una imagen de **Ubuntu Server 24.04 LTS**. El sistema se montó en una máquina virtual con recursos suficientes para pruebas de administración y servicios.

### Recursos asignados
- 2 procesadores virtuales
- 4 GB de memoria RAM
- 40 GB de disco duro
- Adaptador de red con conectividad

## 2. Proceso de instalación

### Paso 1. Arranque desde la ISO
Se inicia la máquina desde la imagen ISO del sistema operativo y se accede al asistente de instalación.

### Paso 2. Selección inicial
Se configura:
- idioma del sistema
- distribución del teclado
- opciones regionales

### Paso 3. Configuración de red
Se detecta la interfaz de red y se configura la conectividad. En un entorno real, esta configuración puede realizarse por DHCP o mediante IP fija.

### Paso 4. Nombre del sistema
Se asigna un nombre identificativo al servidor:
- `srv-iso`

### Paso 5. Creación del usuario administrador
Se crea un usuario inicial con permisos administrativos para poder gestionar el sistema tras la instalación.

### Paso 6. Almacenamiento
Se configura el particionado del disco usando una estructura simple, suficiente para una práctica académica.

### Paso 7. Instalación del sistema base
Se copian e instalan los paquetes esenciales del sistema operativo.

### Paso 8. Reinicio final
Tras completarse la instalación, se reinicia la máquina y se inicia sesión en el sistema ya implantado.

## 3. Comprobaciones tras la instalación
Después de instalar el sistema, se verifican:
- inicio correcto del sistema
- acceso con el usuario creado
- conectividad de red
- capacidad de actualizar paquetes

## 4. Evidencias recomendadas
Para la entrega se pueden incluir capturas de:
- ventana inicial del instalador
- creación del usuario administrador
- configuración del disco
- primer inicio de sesión
- actualización del sistema desde terminal

## 5. Conclusión
La instalación del sistema operativo se completó correctamente, dejando preparado un servidor base sobre el que continuar la configuración de usuarios, permisos y servicios.
