# Diseño de la base de datos

## Modelo relacional

### Tabla: usuarios
- **id_usuario** INT PK AUTO_INCREMENT
- nombre VARCHAR(100) NOT NULL
- email VARCHAR(100) NOT NULL UNIQUE
- password_hash VARCHAR(255) NOT NULL
- direccion VARCHAR(200)
- fecha_registro DATETIME NOT NULL

### Tabla: categorias
- **id_categoria** INT PK AUTO_INCREMENT
- nombre VARCHAR(100) NOT NULL UNIQUE
- descripcion VARCHAR(255)

### Tabla: productos
- **id_producto** INT PK AUTO_INCREMENT
- nombre VARCHAR(120) NOT NULL
- descripcion TEXT
- precio DECIMAL(10,2) NOT NULL
- stock INT NOT NULL
- id_categoria INT NOT NULL FK

### Tabla: pedidos
- **id_pedido** INT PK AUTO_INCREMENT
- id_usuario INT NOT NULL FK
- fecha_pedido DATETIME NOT NULL
- estado VARCHAR(30) NOT NULL
- total DECIMAL(10,2) NOT NULL

### Tabla: detalle_pedidos
- **id_detalle** INT PK AUTO_INCREMENT
- id_pedido INT NOT NULL FK
- id_producto INT NOT NULL FK
- cantidad INT NOT NULL
- precio_unitario DECIMAL(10,2) NOT NULL CHECK (> 0)

### Tabla: pagos
- **id_pago** INT PK AUTO_INCREMENT
- id_pedido INT NOT NULL UNIQUE FK
- fecha_pago DATETIME NOT NULL
- metodo_pago VARCHAR(50) NOT NULL
- estado_pago VARCHAR(30) NOT NULL

## Relaciones
- **usuarios 1:N pedidos**
- **categorias 1:N productos**
- **pedidos 1:N detalle_pedidos**
- **productos 1:N detalle_pedidos**
- **pedidos 1:1 pagos**

## Esquema E/R en texto
- Un **usuario** realiza **muchos pedidos**.
- Un **pedido** contiene **muchos detalles de pedido**.
- Cada **detalle de pedido** hace referencia a un **producto**.
- Cada **producto** pertenece a una **categoría**.
- Cada **pedido** tiene un **pago**.

## Justificación del diseño
Este diseño está normalizado y evita duplicidad de datos:
- Los datos del usuario se guardan una sola vez.
- Los productos se separan por categorías.
- Los pedidos y sus líneas están divididos para permitir varios productos por compra.
- Los pagos se almacenan aparte para facilitar la gestión administrativa.

## Decisión sobre el campo total en pedidos
El campo `total` se mantiene almacenado en la tabla `pedidos`, aunque su valor se obtiene a partir de la suma de los importes de `detalle_pedidos`.

Se ha optado por guardar este dato por dos motivos:
- **rendimiento**, ya que permite consultar rápidamente el importe total del pedido sin recalcularlo en cada consulta;
- **trazabilidad**, porque conserva el importe final confirmado en el momento de la compra, incluso si en el futuro cambia el precio de un producto.

En una aplicación real, este total debería calcularse automáticamente al generar el pedido y quedar validado con los datos del detalle para asegurar la coherencia.

## Automatización adicional
Para reforzar la lógica de negocio, el esquema incluye dos triggers sobre `detalle_pedidos`:
- un trigger `BEFORE INSERT` que comprueba el stock disponible antes de permitir la venta;
- un trigger `AFTER INSERT` que descuenta el stock solo si el pedido no está cancelado.

Con ello se evita vender más unidades de las disponibles y se mantiene el inventario actualizado de forma coherente con el estado del pedido.

## Consulta de verificación del total
También se incorpora una consulta de control para comprobar si el valor almacenado en `pedidos.total` coincide con la suma real del detalle del pedido. Esto ayuda a validar la consistencia de los datos y aporta solidez académica a la entrega.
