# Modelo Lógico de la Base de Datos para la Pizzería

## Entidades y Atributos

### Cliente
- id_cliente (PK): INT, AUTO_INCREMENT
- nombre: VARCHAR(100)
- telefono: VARCHAR(20)
- email: VARCHAR(100), UNIQUE
- fecha_registro: DATE

### Producto
- id_producto (PK): INT, AUTO_INCREMENT
- nombre: VARCHAR(100)
- descripcion: TEXT
- precio: DECIMAL(10,2)
- tipo: ENUM('pizza', 'panzarotti', 'bebida', 'postre', 'otro')
- disponible: BOOLEAN (para menú)

### Ingrediente
- id_ingrediente (PK): INT, AUTO_INCREMENT
- nombre: VARCHAR(100)
- descripcion: TEXT

### Producto_Ingrediente
- id_producto (FK): INT
- id_ingrediente (FK): INT
- cantidad: DECIMAL(10,2) (opcional, para inventario)
- PK: (id_producto, id_ingrediente)

### Adicion
- id_adicion (PK): INT, AUTO_INCREMENT
- nombre: VARCHAR(100)
- descripcion: TEXT
- precio_extra: DECIMAL(10,2)

### Combo
- id_combo (PK): INT, AUTO_INCREMENT
- nombre: VARCHAR(100)
- descripcion: TEXT
- precio: DECIMAL(10,2)
- disponible: BOOLEAN

### Combo_Producto
- id_combo (FK): INT
- id_producto (FK): INT
- cantidad: INT
- PK: (id_combo, id_producto)

### Pedido
- id_pedido (PK): INT, AUTO_INCREMENT
- id_cliente (FK): INT
- fecha_hora: DATETIME
- tipo: ENUM('consumir_en_lugar', 'recoger')
- estado: ENUM('pendiente', 'preparando', 'listo', 'entregado')

### Pedido_Linea
- id_pedido (FK): INT
- id_linea (PK): INT (AUTO_INCREMENT por pedido, pero para simplicidad, PK compuesta)
- id_producto (FK): INT
- cantidad: INT
- precio_unitario: DECIMAL(10,2)
- PK: (id_pedido, id_linea)

### Pedido_Linea_Adicion
- id_pedido (FK): INT
- id_linea (FK): INT
- id_adicion (FK): INT
- PK: (id_pedido, id_linea, id_adicion)

## Relaciones y Cardinalidades

- Cliente 1:N Pedido (un cliente puede tener muchos pedidos)
- Producto 1:N Producto_Ingrediente N:1 Ingrediente (un producto tiene muchos ingredientes, un ingrediente en muchos productos)
- Combo 1:N Combo_Producto N:1 Producto (un combo tiene muchos productos, un producto en muchos combos)
- Pedido 1:N Pedido_Linea N:1 Producto (un pedido tiene muchas líneas, cada línea a un producto)
- Pedido_Linea 1:N Pedido_Linea_Adicion N:1 Adicion (una línea puede tener muchas adiciones, una adición en muchas líneas)


## Grafica diagrama logico

![alt text](images/image-1.png)