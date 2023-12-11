CREATE TABLE Stock (
    id INT PRIMARY KEY,
    sucursal_id INT,
    producto_id INT,
    cantidad INT,
    UNIQUE (sucursal_id, producto_id),
    FOREIGN KEY (sucursal_id) REFERENCES Sucursal(id),
    FOREIGN KEY (producto_id) REFERENCES Producto(id)
);
INSERT INTO Stock (id, sucursal_id, producto_id, cantidad) Values 
(1, 1, 1, 50), (2, 3, 6, 100), (3, 5, 2,200);

CREATE TABLE Producto (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    marca VARCHAR(100),
    categoria_id INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id)
);
INSERT INTO Producto (id, Nombre, Marca, Categoria_id, Precio_unitario) VALUES 
(1, "Maria", "Marca A", 1, 1212.00), (2, "camisa", "Marca B", 2, 150.99),
(3, "Arroz", "Marca c", 3, 20.99);

CREATE TABLE Sucursal (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255)
);
INSERT INTO Sucursal( id, nombre, direccion) VALUES 
(1, "Sucursal A", "avenida 1, ciudad"), (2, "sucursal B", "avenida 2, ciudad");

CREATE TABLE Categoria (
    id INT PRIMARY KEY,
    nombre VARCHAR(100)
);
INSERT INTO Categoria (id, nombre)VALUES (1,"Electronica"), (2, "Ropa"), (3 "Alimentos");

CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20)
);
INSERT INTO Cliente (id, nombre, telefono) VALUES 
(1, "maria teresa Oliva", "98578488"), (2, "lesly Antunes", "93939393");

CREATE TABLE Orden (
    id INT PRIMARY KEY,
    cliente_id INT,
    sucursal_id INT,
    fecha DATE,
    total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (sucursal_id) REFERENCES Sucursal(id)
);
INSERT INTO Orden (id, cliente_id, sucursal_id, fecha, total)VALUES 
(1, 1, 1, '2023-01-15', 199.99), (2, 2, 2, '2023-02-20', 59.98);
    
   CREATE TABLE Item (
    id INT PRIMARY KEY,
    orden_id INT,
    producto_id INT,
    cantidad INT,
    monto_venta DECIMAL(10, 2),
    FOREIGN KEY (orden_id) REFERENCES Orden(id),
    FOREIGN KEY (producto_id) REFERENCES Producto(id)
);
INSERT INTO Item (id, orden_id, producto_id, cantidad, monto_venta) VALUES 
    (1, 1, 1, 1, 499.99),
    (2, 1, 3, 2, 11.98),
    (3, 2, 2, 1, 29.99);