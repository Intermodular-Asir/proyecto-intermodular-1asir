# Entrega completa - Gestión de Bases de Datos (0372)

## Proyecto: Tienda online de productos tecnológicos

## 1. Análisis de datos
El sistema necesita almacenar información sobre usuarios, categorías, productos, pedidos, detalle de pedidos y pagos.

### Datos principales
- **Usuarios:** identifican a los clientes del sistema.
- **Categorías:** agrupan los productos.
- **Productos:** contienen la información del catálogo.
- **Pedidos:** registran las compras realizadas.
- **Detalle de pedidos:** especifica qué productos contiene cada pedido.
- **Pagos:** guarda el método y estado del pago.

## 2. Diseño de la base de datos

### Tablas
- usuarios
- categorias
- productos
- pedidos
- detalle_pedidos
- pagos

### Relaciones
- Un usuario puede realizar muchos pedidos.
- Un pedido pertenece a un usuario.
- Una categoría puede tener muchos productos.
- Un pedido puede tener varios productos.
- Un producto puede aparecer en varios pedidos.
- Cada pedido tiene un pago asociado.

## 3. Script de creación
El script `schema.sql` crea:
- la base de datos `tienda_online`
- todas las tablas
- claves primarias
- claves foráneas
- restricciones de integridad con `CHECK`
- valores por defecto como `pendiente`
- índices adicionales para mejorar búsquedas
- un trigger para actualizar el stock automáticamente

## 4. Inserción de datos
El script `inserts.sql` añade datos de prueba coherentes para probar el sistema.

## 5. Consultas útiles
El script `consultas.sql` incluye:
- listados de productos con su categoría
- pedidos con nombre del usuario
- búsqueda de productos con poco stock
- detalle de un pedido
- total gastado por usuario
- consulta de pedidos y pagos

## 6. Administración básica
Se explican:
- copias de seguridad con `mysqldump`
- restauración de copias
- exportación de datos
- creación de usuarios y permisos

## 7. Organización y documentación
Todo el material está organizado por archivos para facilitar su subida a GitHub y su inclusión en el README del proyecto.

## 8. Defensa oral del diseño
Para explicar correctamente el proyecto en clase, conviene destacar estas decisiones:

- **Por qué existe `detalle_pedidos`:** porque un pedido puede incluir varios productos y un producto puede aparecer en muchos pedidos. Esta tabla resuelve la relación muchos a muchos entre `pedidos` y `productos`.
- **Por qué se usa `DECIMAL` en los precios:** porque los importes económicos no deben almacenarse con tipos aproximados como `FLOAT`, ya que podrían generar errores de redondeo. `DECIMAL` permite guardar cantidades exactas.
- **Diferencia entre PK y FK:** una **clave primaria (PK)** identifica de forma única cada registro de una tabla, mientras que una **clave foránea (FK)** conecta una tabla con otra y garantiza la integridad referencial.
- **Qué hace el trigger del stock:** al insertar una línea en `detalle_pedidos`, el trigger descuenta automáticamente del stock del producto la cantidad vendida. Así se mantiene actualizado el inventario sin hacerlo manualmente.
- **Por qué se normalizaron las categorías:** para evitar repetir el nombre de la categoría en cada producto, reducir redundancia y facilitar cambios futuros, como renombrar una categoría una sola vez.

## Conclusión
La base de datos diseñada responde a las necesidades de una tienda online real y cumple con los requisitos del módulo de Gestión de Bases de Datos. Además, incluye detalles técnicos más sólidos, como validaciones, automatización de stock e índices, que refuerzan la calidad de la entrega y la acercan a una solución más profesional.
