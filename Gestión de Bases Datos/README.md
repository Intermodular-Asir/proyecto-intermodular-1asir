# Proyecto Intermodular - Gestión de Bases de Datos

## Proyecto elegido
Tienda online de productos tecnológicos.

## Descripción general
Este proyecto desarrolla una base de datos relacional para una tienda online de productos tecnológicos. La solución permite gestionar usuarios, categorías, productos, pedidos, detalle de pedidos y pagos, cubriendo operaciones habituales de un sistema real de comercio electrónico.

## Contenido del repositorio
- `analisis_datos.md`: análisis de la información que necesita almacenar el sistema.
- `diseno_bd.md`: diseño relacional y explicación de tablas y relaciones.
- `schema.sql`: script de creación de la base de datos.
- `inserts.sql`: datos de ejemplo para probar el sistema.
- `consultas.sql`: consultas útiles y consultas avanzadas.
- `administracion_basica.md`: copias de seguridad, exportación de datos y gestión básica de usuarios.
- `modelo_er_tienda_online.drawio`: diagrama E/R editable.
- `modelo_er_tienda_online_estilo.drawio`: versión visual mejorada del diagrama.
- `modelo_entidad_relacion_tienda_online.drawio`: modelo entidad-relación editable para entregar.
- `modelo_relacional_tienda_online.drawio`: modelo relacional editable para entregar.

## Justificación del diseño
La base de datos está pensada para gestionar:
- usuarios registrados
- categorías de productos
- productos del catálogo
- pedidos realizados por los clientes
- detalle de los productos incluidos en cada pedido
- pagos asociados a los pedidos

Con este diseño se cubren operaciones habituales de una tienda online real, como la consulta del catálogo, la realización de compras, el historial de pedidos y el control básico de pagos.

Además, el esquema incorpora mejoras orientadas a una entrega de máximo nivel académico:
- restricciones `CHECK` para validar stock y precios, incluyendo `precio_unitario > 0`
- valores por defecto como `pendiente` en el estado de pedidos y pagos
- índices adicionales sobre `email` y `nombre` de producto
- claves foráneas con acciones `ON DELETE CASCADE` donde tiene sentido
- un trigger `BEFORE INSERT` que impide vender más stock del disponible
- un trigger de descuento de stock que no actúa si el pedido está cancelado
- una consulta de verificación para comprobar si el total del pedido coincide con el detalle

## Modelo relacional resumido
- usuarios (1) --- (N) pedidos
- categorias (1) --- (N) productos
- pedidos (1) --- (N) detalle_pedidos
- productos (1) --- (N) detalle_pedidos
- pedidos (1) --- (1) pagos

## Instalación y ejecución
Para poner en marcha este proyecto en un entorno local, se recomienda disponer de:
- MySQL o MariaDB instalado
- un cliente de base de datos como MySQL Workbench, phpMyAdmin o DBeaver
- un sistema operativo Windows o Linux

### Pasos para ejecutar el proyecto
1. Crear la base de datos ejecutando el archivo `schema.sql`.
2. Insertar los datos iniciales con el archivo `inserts.sql`.
3. Ejecutar las consultas del archivo `consultas.sql` para comprobar el funcionamiento.
4. Revisar la documentación incluida en los archivos `.md` para entender el diseño y la administración de la base de datos.

### Orden recomendado de ejecución
```sql
SOURCE schema.sql;
SOURCE inserts.sql;
SOURCE consultas.sql;
```

### Resultado esperado
Una vez ejecutados los scripts:
- la base de datos `tienda_online` quedará creada
- se insertarán datos de ejemplo coherentes con el proyecto
- será posible consultar productos, usuarios, pedidos y pagos
- se podrán probar consultas simples y avanzadas sobre la tienda online

## Defensa rápida en clase
Si hay que justificar el diseño oralmente, estas ideas resumen bien el proyecto:
- `detalle_pedidos` existe para resolver la relación muchos a muchos entre pedidos y productos.
- `DECIMAL` se usa en precios para evitar errores de redondeo y guardar importes exactos.
- La **PK** identifica de forma única cada registro y la **FK** conecta tablas manteniendo la integridad referencial.
- El trigger del stock descuenta automáticamente unidades disponibles al registrar una venta.
- Las categorías se normalizan para evitar redundancia y facilitar el mantenimiento.

## Nota final
Este material está organizado para cumplir con los entregables solicitados en el módulo 0372 de Gestión de Bases de Datos, con un enfoque claro, coherente y documentado.
