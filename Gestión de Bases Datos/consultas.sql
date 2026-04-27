USE tienda_online;

-- 1. Listar todos los productos con su categoría
SELECT p.id_producto, p.nombre AS producto, c.nombre AS categoria, p.precio, p.stock
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria;

-- 2. Mostrar pedidos con nombre del usuario
SELECT pe.id_pedido, u.nombre AS usuario, pe.fecha_pedido, pe.estado, pe.total
FROM pedidos pe
JOIN usuarios u ON pe.id_usuario = u.id_usuario;

-- 3. Buscar productos con stock inferior a 20
SELECT id_producto, nombre, stock
FROM productos
WHERE stock < 20;

-- 4. Mostrar detalle de un pedido concreto
SELECT dp.id_pedido, pr.nombre AS producto, dp.cantidad, dp.precio_unitario
FROM detalle_pedidos dp
JOIN productos pr ON dp.id_producto = pr.id_producto
WHERE dp.id_pedido = 1;

-- 5. Mostrar pedidos y estado del pago
SELECT pe.id_pedido, pe.estado, pa.metodo_pago, pa.estado_pago
FROM pedidos pe
JOIN pagos pa ON pe.id_pedido = pa.id_pedido;

-- CONSULTAS AVANZADAS

-- 6. Total gastado por cada usuario
SELECT u.nombre, u.email, SUM(p.total) AS total_gastado
FROM usuarios u
JOIN pedidos p ON u.id_usuario = p.id_usuario
WHERE p.estado <> 'cancelado'
GROUP BY u.id_usuario, u.nombre, u.email
ORDER BY total_gastado DESC;

-- 7. Productos más vendidos
SELECT pr.nombre AS producto, SUM(dp.cantidad) AS total_vendido
FROM detalle_pedidos dp
JOIN productos pr ON dp.id_producto = pr.id_producto
GROUP BY pr.id_producto, pr.nombre
ORDER BY total_vendido DESC;

-- 8. Pedidos con información del cliente y número de productos
SELECT p.id_pedido,
       u.nombre AS cliente,
       p.fecha_pedido,
       p.estado,
       COUNT(dp.id_detalle) AS lineas_pedido,
       SUM(dp.cantidad) AS total_productos
FROM pedidos p
JOIN usuarios u ON p.id_usuario = u.id_usuario
JOIN detalle_pedidos dp ON p.id_pedido = dp.id_pedido
GROUP BY p.id_pedido, u.nombre, p.fecha_pedido, p.estado
ORDER BY p.fecha_pedido DESC;

-- 9. Comprobar si el total del pedido coincide con la suma del detalle
SELECT p.id_pedido,
       p.total AS total_pedido,
       SUM(dp.cantidad * dp.precio_unitario) AS total_calculado
FROM pedidos p
JOIN detalle_pedidos dp ON p.id_pedido = dp.id_pedido
GROUP BY p.id_pedido, p.total;

-- 10. Usuarios que no han realizado ningún pedido
SELECT u.nombre, u.email
FROM usuarios u
LEFT JOIN pedidos p ON u.id_usuario = p.id_usuario
WHERE p.id_pedido IS NULL;
