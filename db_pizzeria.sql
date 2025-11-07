CREATE DATABASE IF NOT EXISTS pizzeria;
USE pizzeria;

-- Tabla Cliente
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    fecha_registro DATE DEFAULT (CURRENT_DATE) 
);

-- Tabla Ingrediente
CREATE TABLE Ingrediente (
    id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla Producto
CREATE TABLE Producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    tipo ENUM('pizza', 'panzarotti', 'bebida', 'postre', 'otro') NOT NULL,
    disponible TINYINT(1) DEFAULT 1  
);

-- Tabla Producto_Ingrediente 
CREATE TABLE Producto_Ingrediente (
    id_producto INT NOT NULL,
    id_ingrediente INT NOT NULL,
    cantidad DECIMAL(10,2),
    PRIMARY KEY (id_producto, id_ingrediente),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto) ON DELETE CASCADE,
    FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente(id_ingrediente) ON DELETE CASCADE
);

-- Tabla Adicion
CREATE TABLE Adicion (
    id_adicion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio_extra DECIMAL(10,2) NOT NULL
);

-- Tabla Combo
CREATE TABLE Combo (
    id_combo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    disponible TINYINT(1) DEFAULT 1
);

-- Tabla Combo_Producto 
CREATE TABLE Combo_Producto (
    id_combo INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    PRIMARY KEY (id_combo, id_producto),
    FOREIGN KEY (id_combo) REFERENCES Combo(id_combo) ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto) ON DELETE CASCADE
);

-- Tabla Pedido
CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    tipo ENUM('consumir_en_lugar', 'recoger') NOT NULL,
    estado ENUM('pendiente', 'preparando', 'listo', 'entregado') DEFAULT 'pendiente',
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente) ON DELETE RESTRICT  
);

-- Tabla Pedido_Linea 
CREATE TABLE Pedido_Linea (
    id_pedido INT NOT NULL,
    id_linea INT NOT NULL AUTO_INCREMENT,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    precio_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_pedido, id_linea),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto) ON DELETE RESTRICT,
    INDEX idx_linea (id_linea)  
);

-- Tabla Pedido_Linea_Adicion 
CREATE TABLE Pedido_Linea_Adicion (
    id_pedido INT NOT NULL,
    id_linea INT NOT NULL,
    id_adicion INT NOT NULL,
    PRIMARY KEY (id_pedido, id_linea, id_adicion),
    FOREIGN KEY (id_pedido, id_linea) REFERENCES Pedido_Linea(id_pedido, id_linea) ON DELETE CASCADE,
    FOREIGN KEY (id_adicion) REFERENCES Adicion(id_adicion) ON DELETE CASCADE
);