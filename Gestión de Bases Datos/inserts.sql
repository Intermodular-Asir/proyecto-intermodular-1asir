USE tienda_online;

INSERT INTO usuarios (nombre, email, password_hash, direccion, fecha_registro) VALUES
('Ana Rodríguez', 'ana@example.com', 'hash123', 'Calle Mayor 12, Madrid', '2026-04-01 10:00:00'),
('Luis Martín', 'luis@example.com', 'hash456', 'Avenida del Sol 8, Valencia', '2026-04-02 11:30:00'),
('Carlos Pérez', 'carlos@example.com', 'hash789', 'Calle Luna 21, Sevilla', '2026-04-03 09:15:00'),
('Marta Díaz', 'marta@example.com', 'hash321', 'Plaza España 4, Bilbao', '2026-04-04 16:45:00');

INSERT INTO categorias (nombre, descripcion) VALUES
('Portátiles', 'Ordenadores portátiles de distintas gamas'),
('Smartphones', 'Teléfonos móviles inteligentes'),
('Monitores', 'Pantallas para uso profesional y gaming'),
('Accesorios', 'Periféricos y complementos tecnológicos'),
('Componentes', 'Piezas internas para equipos informáticos');

INSERT INTO productos (nombre, descripcion, precio, stock, id_categoria) VALUES
('Lenovo IdeaPad 3', 'Portátil de 15.6 pulgadas con 8GB RAM y SSD de 512GB', 599.99, 10, 1),
('MacBook Air M2', 'Portátil ligero de alto rendimiento', 1299.99, 5, 1),
('Samsung Galaxy A54', 'Smartphone Android de gama media', 449.99, 20, 2),
('iPhone 14', 'Smartphone Apple de última generación', 999.99, 8, 2),
('LG UltraGear 27', 'Monitor gaming de 27 pulgadas y 144Hz', 279.99, 7, 3),
('Logitech G502', 'Ratón gaming ergonómico con sensor de alta precisión', 59.99, 25, 4),
('Teclado mecánico Redragon', 'Teclado RGB mecánico para gaming y productividad', 74.99, 15, 4),
('SSD Kingston 1TB', 'Unidad SSD rápida para almacenamiento interno', 89.99, 30, 5);

INSERT INTO pedidos (id_usuario, fecha_pedido, estado, total) VALUES
(1, '2026-04-10 10:30:00', 'pendiente', 659.98),
(2, '2026-04-11 12:15:00', 'enviado', 999.99),
(3, '2026-04-12 18:45:00', 'entregado', 149.98),
(1, '2026-04-13 09:20:00', 'cancelado', 279.99);

INSERT INTO detalle_pedidos (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 599.99),
(1, 6, 1, 59.99),
(2, 4, 1, 999.99),
(3, 6, 1, 59.99),
(3, 8, 1, 89.99),
(4, 5, 1, 279.99);

INSERT INTO pagos (id_pedido, fecha_pago, metodo_pago, estado_pago) VALUES
(1, '2026-04-10 10:35:00', 'tarjeta', 'pagado'),
(2, '2026-04-11 12:20:00', 'paypal', 'pagado'),
(3, '2026-04-12 18:50:00', 'transferencia', 'pagado'),
(4, '2026-04-13 09:25:00', 'tarjeta', 'rechazado');
