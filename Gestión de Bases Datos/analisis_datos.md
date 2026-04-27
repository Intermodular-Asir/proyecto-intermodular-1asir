# Análisis de datos del sistema

## Descripción general
El sistema es una tienda online de productos tecnológicos. La aplicación necesita almacenar información sobre usuarios, productos disponibles, pedidos realizados y pagos asociados.

## Información que se guarda

### 1. Usuarios
Se almacenan los datos de los clientes registrados:
- id del usuario
- nombre
- email
- password_hash
- dirección
- fecha de registro

**Tipos de datos principales:**
- `id_usuario` → INT, identificador numérico único
- `nombre` → VARCHAR(100), texto corto
- `email` → VARCHAR(100), texto corto con formato de correo
- `password_hash` → VARCHAR(255), cadena larga para el hash
- `direccion` → VARCHAR(200), texto medio
- `fecha_registro` → DATETIME, fecha y hora exacta

**Por qué es necesaria:**
Permite identificar a cada cliente, gestionar su acceso al sistema y asociar sus pedidos.

### 2. Categorías
Se almacenan categorías para clasificar productos:
- id de la categoría
- nombre
- descripción

**Tipos de datos principales:**
- `id_categoria` → INT, identificador numérico único
- `nombre` → VARCHAR(100), texto corto
- `descripcion` → VARCHAR(255), texto descriptivo breve

**Por qué es necesaria:**
Facilita la organización del catálogo y la búsqueda de productos.

### 3. Productos
Se almacenan los artículos disponibles en la tienda:
- id del producto
- nombre
- descripción
- precio
- stock
- categoría a la que pertenece

**Tipos de datos principales:**
- `id_producto` → INT, identificador numérico único
- `nombre` → VARCHAR(120), texto corto
- `descripcion` → TEXT, texto largo descriptivo
- `precio` → DECIMAL(10,2), importe exacto con dos decimales
- `stock` → INT, cantidad disponible
- `id_categoria` → INT, clave foránea numérica

**Por qué es necesaria:**
Es el núcleo del sistema de venta. Permite mostrar catálogo, controlar inventario y procesar pedidos.

### 4. Pedidos
Se registran las compras realizadas:
- id del pedido
- usuario que realiza el pedido
- fecha
- estado
- importe total

**Tipos de datos principales:**
- `id_pedido` → INT, identificador numérico único
- `id_usuario` → INT, clave foránea numérica
- `fecha_pedido` → DATETIME, fecha y hora exacta
- `estado` → VARCHAR(30), texto corto para el estado del pedido
- `total` → DECIMAL(10,2), importe total exacto

**Por qué es necesaria:**
Permite gestionar el historial de compras y el seguimiento del proceso de venta.

**Observación sobre el total del pedido:**
El importe total se almacena directamente en la tabla `pedidos`, aunque procede del cálculo de los productos incluidos en `detalle_pedidos`. Se ha decidido mantenerlo guardado para facilitar consultas rápidas y conservar el importe final confirmado en la compra.

### 5. Detalle de pedidos
Se almacena el contenido concreto de cada pedido:
- id del detalle
- pedido
- producto
- cantidad
- precio unitario

**Tipos de datos principales:**
- `id_detalle` → INT, identificador numérico único
- `id_pedido` → INT, clave foránea numérica
- `id_producto` → INT, clave foránea numérica
- `cantidad` → INT, número de unidades
- `precio_unitario` → DECIMAL(10,2), importe exacto por unidad

**Por qué es necesaria:**
Un pedido puede contener varios productos. Esta tabla resuelve la relación muchos a muchos entre pedidos y productos y permite calcular el contenido económico de cada pedido.

### 6. Pagos
Se almacenan los datos básicos del pago:
- id del pago
- pedido asociado
- fecha de pago
- método de pago
- estado del pago

**Tipos de datos principales:**
- `id_pago` → INT, identificador numérico único
- `id_pedido` → INT, clave foránea numérica
- `fecha_pago` → DATETIME, fecha y hora exacta
- `metodo_pago` → VARCHAR(50), texto corto
- `estado_pago` → VARCHAR(30), texto corto para el estado del pago

**Por qué es necesaria:**
Permite saber si el pedido ha sido pagado y cómo se ha realizado el pago.

## Relación con el funcionamiento del sistema
- Un usuario puede realizar varios pedidos.
- Un pedido pertenece a un único usuario.
- Cada producto pertenece a una categoría.
- Un pedido puede contener varios productos y un producto puede aparecer en varios pedidos.
- Cada pedido puede tener un pago asociado.

## Conclusión
La información seleccionada cubre las necesidades básicas de una tienda online y permite gestionar catálogo, usuarios, ventas y pagos de forma coherente.
