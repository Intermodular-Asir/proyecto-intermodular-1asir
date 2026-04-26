DROP DATABASE IF EXISTS tienda_online;
CREATE DATABASE tienda_online
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE tienda_online;

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    direccion VARCHAR(200),
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_usuarios_nombre CHECK (CHAR_LENGTH(TRIM(nombre)) >= 2),
    CONSTRAINT chk_usuarios_email CHECK (email LIKE '%@%.%')
) ENGINE=InnoDB;

CREATE INDEX idx_usuarios_email ON usuarios(email);

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(255),
    CONSTRAINT chk_categorias_nombre CHECK (CHAR_LENGTH(TRIM(nombre)) >= 2)
) ENGINE=InnoDB;

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL CHECK (precio > 0),
    stock INT NOT NULL CHECK (stock >= 0),
    id_categoria INT NOT NULL,
    CONSTRAINT fk_productos_categorias
        FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE INDEX idx_productos_categoria ON productos(id_categoria);
CREATE INDEX idx_nombre_producto ON productos(nombre);

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    fecha_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(30) NOT NULL DEFAULT 'pendiente' CHECK (estado IN ('pendiente', 'enviado', 'entregado', 'cancelado')),
    total DECIMAL(10,2) NOT NULL CHECK (total >= 0),
    CONSTRAINT fk_pedidos_usuarios
        FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE INDEX idx_pedidos_usuario ON pedidos(id_usuario);

CREATE TABLE detalle_pedidos (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10,2) NOT NULL CHECK (precio_unitario > 0),
    CONSTRAINT uq_detalle_pedido_producto UNIQUE (id_pedido, id_producto),
    CONSTRAINT fk_detalle_pedidos
        FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_detalle_productos
        FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE INDEX idx_detalle_producto ON detalle_pedidos(id_producto);

CREATE TABLE pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL UNIQUE,
    fecha_pago DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    metodo_pago VARCHAR(50) NOT NULL CHECK (metodo_pago IN ('tarjeta', 'paypal', 'transferencia')),
    estado_pago VARCHAR(30) NOT NULL DEFAULT 'pendiente' CHECK (estado_pago IN ('pendiente', 'pagado', 'rechazado')),
    CONSTRAINT fk_pagos_pedidos
        FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

DELIMITER $$

CREATE TRIGGER trg_comprobar_stock
BEFORE INSERT ON detalle_pedidos
FOR EACH ROW
BEGIN
    DECLARE stock_actual INT;
    DECLARE estado_pedido VARCHAR(30);

    SELECT stock
    INTO stock_actual
    FROM productos
    WHERE id_producto = NEW.id_producto;

    SELECT estado
    INTO estado_pedido
    FROM pedidos
    WHERE id_pedido = NEW.id_pedido;

    IF estado_pedido = 'cancelado' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se pueden añadir productos a un pedido cancelado';
    END IF;

    IF stock_actual < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock insuficiente para realizar la venta';
    END IF;
END$$

CREATE TRIGGER trg_descontar_stock
AFTER INSERT ON detalle_pedidos
FOR EACH ROW
BEGIN
    DECLARE estado_pedido VARCHAR(30);

    SELECT estado
    INTO estado_pedido
    FROM pedidos
    WHERE id_pedido = NEW.id_pedido;

    IF estado_pedido <> 'cancelado' THEN
        UPDATE productos
        SET stock = stock - NEW.cantidad
        WHERE id_producto = NEW.id_producto;
    END IF;
END$$

DELIMITER ;
