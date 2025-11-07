
-- DATOS DE PRUEBA PARA PIZZERÍA


USE pizzeria;

-- 1. CLIENTES
INSERT INTO Cliente (nombre, telefono, email) VALUES
('Juan Pérez', '555-1234', 'juan@example.com'),
('María García', '555-5678', 'maria@example.com'),
('Carlos López', '555-9012', 'carlos@example.com');

-- 2. INGREDIENTES
INSERT INTO Ingrediente (nombre, descripcion) VALUES
('Queso Mozzarella', 'Queso fresco italiano'),
('Tomate', 'Tomate fresco'),
('Harina', 'Harina de trigo'),
('Pepperoni', 'Salami picante'),
('Champiñones', 'Hongos frescos'),
('Aceitunas', 'Aceitunas verdes'),
('Salsa de Tomate', 'Salsa base para pizzas');

-- 3. ADICIONES
INSERT INTO Adicion (nombre, descripcion, precio_extra) VALUES
('Extra Queso', 'Porción adicional de queso', 2.50),
('Pepperoni Extra', 'Porción adicional de pepperoni', 3.00),
('Champiñones Extra', 'Porción adicional de champiñones', 2.00),
('Aceitunas Extra', 'Porción adicional de aceitunas', 1.50);

-- 4. PRODUCTOS (usar 1 en vez de TRUE)
INSERT INTO Producto (nombre, descripcion, precio, tipo, disponible) VALUES
('Pizza Margarita', 'Pizza clásica con queso y tomate', 12.00, 'pizza', 1),
('Pizza Pepperoni', 'Pizza con pepperoni y queso', 15.00, 'pizza', 1),
('Panzarotti de Queso', 'Panzarotti relleno de queso', 8.00, 'panzarotti', 1),
('Coca-Cola', 'Refresco de cola 500ml', 3.00, 'bebida', 1),
('Tiramisú', 'Postre italiano', 5.00, 'postre', 1);

-- 5. PRODUCTO_INGREDIENTE
INSERT INTO Producto_Ingrediente (id_producto, id_ingrediente, cantidad) VALUES
(1, 1, 200), -- Pizza Margarita: Queso
(1, 2, 150), -- Tomate
(1, 3, 300), -- Harina
(1, 7, 100), -- Salsa
(2, 1, 200), -- Pizza Pepperoni: Queso
(2, 2, 150), -- Tomate
(2, 3, 300), -- Harina
(2, 4, 100), -- Pepperoni
(2, 7, 100), -- Salsa
(3, 1, 150), -- Panzarotti: Queso
(3, 3, 200); -- Harina

-- 6. COMBOS
INSERT INTO Combo (nombre, descripcion, precio, disponible) VALUES
('Combo Familiar', 'Pizza Margarita + Coca-Cola', 14.00, 1),
('Combo Panzarotti', 'Panzarotti + Tiramisú', 12.00, 1);

-- 7. COMBO_PRODUCTO
INSERT INTO Combo_Producto (id_combo, id_producto, cantidad) VALUES
(1, 1, 1), -- Combo Familiar: Pizza Margarita
(1, 4, 1), -- Coca-Cola
(2, 3, 1), -- Combo Panzarotti: Panzarotti
(2, 5, 1); -- Tiramisú

-- 8. PEDIDOS
INSERT INTO Pedido (id_cliente, tipo, estado) VALUES
(1, 'consumir_en_lugar', 'listo'),
(2, 'recoger', 'pendiente'),
(3, 'consumir_en_lugar', 'preparando');

-- 9. PEDIDO_LINEA 
INSERT INTO Pedido_Linea (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 12.00), -- Pedido 1: Pizza Margarita
(1, 4, 2, 3.00),  -- 2 Coca-Cola
(2, 2, 1, 15.00), -- Pedido 2: Pizza Pepperoni
(3, 3, 1, 8.00),  -- Pedido 3: Panzarotti
(3, 5, 1, 5.00);  -- Tiramisú


INSERT INTO Pedido_Linea_Adicion (id_pedido, id_linea, id_adicion) VALUES
(1, 1, 1), -- Pedido 1, línea 1 (Pizza Margarita): Extra Queso
(2, 3, 2), -- Pedido 2, línea 3 (Pizza Pepperoni): Pepperoni Extra
(3, 4, 3); -- Pedido 3, línea 4 (Panzarotti): Champiñones Extra
