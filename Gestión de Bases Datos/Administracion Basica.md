# Administración básica de la base de datos

## 1. Copias de seguridad
Una tarea básica de administración es crear copias de seguridad para evitar la pérdida de datos y poder recuperar la base de datos en caso de fallo.

### Ejemplo en MySQL/MariaDB con `mysqldump`
```bash
mysqldump -u root -p tienda_online > copia_tienda_online.sql
```

Este comando genera un archivo SQL que contiene la estructura y los datos de la base de datos.

## 2. Restauración de una copia de seguridad
Si es necesario recuperar la base de datos, se puede importar el archivo exportado con el siguiente comando:

```bash
mysql -u root -p tienda_online < copia_tienda_online.sql
```

## 3. Exportación real de la base de datos
Además de las copias de seguridad completas, también es posible exportar datos concretos para análisis, migración o informes.

### Exportación completa
```bash
mysqldump -u root -p tienda_online > exportacion_tienda_online.sql
```

### Explicación del comando
- `mysqldump`: herramienta de exportación de MySQL/MariaDB.
- `-u root`: usuario con el que se accede al servidor.
- `-p`: solicita la contraseña del usuario.
- `tienda_online`: base de datos que se desea exportar.
- `> exportacion_tienda_online.sql`: guarda la salida en un archivo SQL.

### Importación posterior
```bash
mysql -u root -p tienda_online < exportacion_tienda_online.sql
```

Esta operación permite restaurar la base de datos en el mismo equipo o trasladarla a otro entorno.

## 4. Gestión básica de usuarios
Un administrador debe crear usuarios con permisos adecuados según su función, evitando trabajar siempre con la cuenta `root`.

### Crear usuario
```sql
CREATE USER 'gestor_tienda'@'localhost' IDENTIFIED BY 'claveSegura123';
```

### Dar permisos sobre la base de datos
```sql
GRANT SELECT, INSERT, UPDATE, DELETE ON tienda_online.* TO 'gestor_tienda'@'localhost';
FLUSH PRIVILEGES;
```

## 5. Mini prueba práctica de administración
Como ejemplo práctico, después de crear la base de datos y cargar los datos de prueba, se puede ejecutar una consulta sencilla para comprobar que la información está disponible y el sistema funciona correctamente.

### Comprobación del número de productos registrados
```sql
SELECT COUNT(*) AS total_productos FROM productos;
```

### Resultado esperado con los datos de ejemplo
```text
+-----------------+
| total_productos |
+-----------------+
| 8               |
+-----------------+
```

### Comprobación del contenido exportado
Tras ejecutar el comando de exportación, debe generarse un archivo como `exportacion_tienda_online.sql`, que servirá como evidencia de que la copia o exportación se ha realizado correctamente.

## 6. Buenas prácticas administrativas
- Realizar copias de seguridad periódicas.
- Comprobar que las copias pueden restaurarse correctamente.
- No trabajar siempre con el usuario root.
- Limitar permisos según la función de cada usuario.
- Revisar el estado del almacenamiento y la integridad de los datos.
- Documentar los cambios y mantener los scripts organizados en GitHub.
