-- Creación de la tabla 'concesionaria'
CREATE TABLE concesionaria (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  direccion VARCHAR(100),
  telefono VARCHAR(20)
);

-- Creación de la tabla 'marca'
CREATE TABLE marca (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);

-- Creación de la tabla 'modelo'
CREATE TABLE modelo (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  marca_id INT,
  FOREIGN KEY (marca_id) REFERENCES marca(id)
);

-- Creación de la tabla 'vehiculo'
CREATE TABLE vehiculo (
  id INT PRIMARY KEY,
  modelo_id INT,
  anio INT,
  color VARCHAR(50),
  precio DECIMAL(10, 2),
  FOREIGN KEY (modelo_id) REFERENCES modelo(id)
);

-- Creación de la tabla 'cliente'
CREATE TABLE cliente (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  direccion VARCHAR(100),
  telefono VARCHAR(20)
);

-- Creación de la tabla 'venta'
CREATE TABLE venta (
  id INT PRIMARY KEY,
  cliente_id INT,
  vehiculo_id INT,
  fecha_venta DATE,
  FOREIGN KEY (cliente_id) REFERENCES cliente(id),
  FOREIGN KEY (vehiculo_id) REFERENCES vehiculo(id)
);

-- Creación de la tabla 'empleado'
CREATE TABLE empleado (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  puesto VARCHAR(100),
  salario DECIMAL(10, 2)
);

-- Creación de la tabla 'servicio'
CREATE TABLE servicio (
  id INT PRIMARY KEY,
  descripcion VARCHAR(100),
  costo DECIMAL(10, 2)
);

-- Creación de la tabla 'orden_reparacion'
CREATE TABLE orden_reparacion (
  id INT PRIMARY KEY,
  vehiculo_id INT,
  empleado_id INT,
  servicio_id INT,
  fecha_inicio DATE,
  fecha_fin DATE,
  FOREIGN KEY (vehiculo_id) REFERENCES vehiculo(id),
  FOREIGN KEY (empleado_id) REFERENCES empleado(id),
  FOREIGN KEY (servicio_id) REFERENCES servicio(id)
);

-- Creación de la tabla 'proveedor'
CREATE TABLE proveedor (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  direccion VARCHAR(100),
  telefono VARCHAR(20)
);


-- Llenado de tablas

-- Llenado de la tabla 'concesionaria'
INSERT INTO concesionaria (id, nombre, direccion, telefono) VALUES
  (1, 'Concesionaria A', 'Calle Principal 123', '1234567890'),
  (2, 'Concesionaria B', 'Avenida Central 456', '9876543210'),
  (3, 'Concesionaria C', 'Boulevard Norte 789', '4567890123'),
  (4, 'Concesionaria D', 'Calle Sur 321', '0123456789'),
  (5, 'Concesionaria E', 'Avenida Este 654', '5678901234'),
  (6, 'Concesionaria F', 'Calle Oeste 987', '8901234567'),
  (7, 'Concesionaria G', 'Avenida Principal 246', '2345678901');

-- Llenado de la tabla 'marca'
INSERT INTO marca (id, nombre) VALUES
  (1, 'Marca A'),
  (2, 'Marca B'),
  (3, 'Marca C'),
  (4, 'Marca D'),
  (5, 'Marca E'),
  (6, 'Marca F'),
  (7, 'Marca G');

-- Llenado de la tabla 'modelo'
INSERT INTO modelo (id, nombre, marca_id) VALUES
  (1, 'Modelo 1', 1),
  (2, 'Modelo 2', 1),
  (3, 'Modelo 3', 2),
  (4, 'Modelo 4', 2),
  (5, 'Modelo 5', 3),
  (6, 'Modelo 6', 4),
  (7, 'Modelo 7', 5);

-- Llenado de la tabla 'vehiculo'
INSERT INTO vehiculo (id, modelo_id, anio, color, precio) VALUES
  (1, 1, 2020, 'Rojo', 25000.00),
  (2, 2, 2021, 'Azul', 28000.00),
  (3, 3, 2019, 'Negro', 22000.00),
  (4, 4, 2022, 'Blanco', 30000.00),
  (5, 5, 2020, 'Gris', 27000.00),
  (6, 6, 2021, 'Plata', 32000.00),
  (7, 7, 2018, 'Rojo', 20000.00);

-- Llenado de la tabla 'cliente'
INSERT INTO cliente (id, nombre, direccion, telefono) VALUES
  (1, 'Cliente A', 'Calle Principal 1', '1111111111'),
  (2, 'Cliente B', 'Avenida Central 2', '2222222222'),
  (3, 'Cliente C', 'Boulevard Norte 3', '3333333333'),
  (4, 'Cliente D', 'Calle Sur 4', '4444444444'),
  (5, 'Cliente E', 'Avenida Este 5', '5555555555'),
  (6, 'Cliente F', 'Calle Oeste 6', '6666666666'),
  (7, 'Cliente G', 'Avenida Principal 7', '7777777777');

-- Llenado de la tabla 'venta'
INSERT INTO venta (id, cliente_id, vehiculo_id, fecha_venta) VALUES
  (1, 1, 1, '2023-01-01'),
  (2, 2, 2, '2023-02-02'),
  (3, 3, 3, '2023-03-03'),
  (4, 4, 4, '2023-04-04'),
  (5, 5, 5, '2023-05-05'),
  (6, 6, 6, '2023-06-06'),
  (7, 7, 7, '2023-07-07');

-- Llenado de la tabla 'empleado'
INSERT INTO empleado (id, nombre, puesto, salario) VALUES
  (1, 'Empleado A', 'Vendedor', 2000.00),
  (2, 'Empleado B', 'Vendedor', 2000.00),
  (3, 'Empleado C', 'Mecánico', 2500.00),
  (4, 'Empleado D', 'Mecánico', 2500.00),
  (5, 'Empleado E', 'Recepcionista', 1800.00),
  (6, 'Empleado F', 'Recepcionista', 1800.00),
  (7, 'Empleado G', 'Gerente', 5000.00);

-- Llenado de la tabla 'servicio'
INSERT INTO servicio (id, descripcion, costo) VALUES
  (1, 'Cambio de aceite', 50.00),
  (2, 'Alineación y balanceo', 100.00),
  (3, 'Reparación de motor', 500.00),
  (4, 'Cambio de frenos', 150.00),
  (5, 'Lavado exterior', 20.00),
  (6, 'Lavado interior', 30.00),
  (7, 'Pintura y retoque', 200.00);

-- Llenado de la tabla 'orden_reparacion'
INSERT INTO orden_reparacion (id, vehiculo_id, empleado_id, servicio_id, fecha_inicio, fecha_fin) VALUES
  (1, 1, 3, 1, '2023-01-01', '2023-01-02'),
  (2, 2, 4, 2, '2023-02-01', '2023-02-02'),
  (3, 3, 3, 3, '2023-03-01', '2023-03-05'),
  (4, 4, 4, 4, '2023-04-01', '2023-04-03'),
  (5, 5, 3, 5, '2023-05-01', '2023-05-01'),
  (6, 6, 4, 6, '2023-06-01', '2023-06-02'),
  (7, 7, 3, 7, '2023-07-01', '2023-07-03');

-- Llenado de la tabla 'proveedor'
INSERT INTO proveedor (id, nombre, direccion, telefono) VALUES
  (1, 'Proveedor A', 'Calle Principal 11', '1111111111'),
  (2, 'Proveedor B', 'Avenida Central 22', '2222222222'),
  (3, 'Proveedor C', 'Boulevard Norte 33', '3333333333'),
  (4, 'Proveedor D', 'Calle Sur 44', '4444444444'),
  (5, 'Proveedor E', 'Avenida Este 55', '5555555555'),
  (6, 'Proveedor F', 'Calle Oeste 66', '6666666666'),
  (7, 'Proveedor G', 'Avenida Principal 77', '7777777777');


--Obtener todos los vehículos disponibles en la concesionaria:

SELECT v.id, m.nombre AS marca, mo.nombre AS modelo, v.anio, v.color, v.precio
FROM vehiculo v
JOIN modelo mo ON v.modelo_id = mo.id
JOIN marca m ON mo.marca_id = m.id;


--Obtener el nombre y el teléfono de los clientes que han realizado una compra:
SELECT c.nombre, c.telefono
FROM cliente c
JOIN venta v ON c.id = v.cliente_id;

--Obtener la cantidad de ventas realizadas por cada empleado:
SELECT e.nombre, COUNT(*) AS cantidad_ventas
FROM empleado e
JOIN venta v ON e.id = v.empleado_id
GROUP BY e.nombre;

--Obtener la marca y el modelo de los vehículos vendidos junto con el nombre del cliente y la fecha de venta:
SELECT m.nombre AS marca, mo.nombre AS modelo, c.nombre AS cliente, v.fecha_venta
FROM venta v
JOIN vehiculo ve ON v.vehiculo_id = ve.id
JOIN modelo mo ON ve.modelo_id = mo.id
JOIN marca m ON mo.marca_id = m.id
JOIN cliente c ON v.cliente_id = c.id;

--Obtener la descripción de los servicios realizados en las órdenes de reparación:
SELECT o.id, s.descripcion
FROM orden_reparacion o
JOIN servicio s ON o.servicio_id = s.id;

--Obtener el nombre de los proveedores junto con la cantidad de servicios contratados:
SELECT p.nombre, COUNT(*) AS cantidad_servicios
FROM proveedor p
JOIN servicio s ON p.id = s.proveedor_id
GROUP BY p.nombre;


--Obtener el nombre de los empleados y el total de salarios pagados por puesto:
SELECT puesto, SUM(salario) AS total_salarios
FROM empleado
GROUP BY puesto;

--Obtener la dirección de la concesionaria y la cantidad de vehículos disponibles actualmente:
SELECT c.direccion, COUNT(*) AS cantidad_vehiculos_disponibles
FROM concesionaria c
JOIN vehiculo v ON c.id = v.concesionaria_id
WHERE v.estado = 'Disponible'
GROUP BY c.direccion;


--Obtener el modelo y el año de los vehículos vendidos en orden descendente por precio:
SELECT mo.nombre AS modelo, v.anio, v.precio
FROM venta ve
JOIN vehiculo v ON ve.vehiculo_id = v.id
JOIN modelo mo ON v.modelo_id = mo.id
ORDER BY v.precio DESC;

--Obtener el nombre del cliente, el modelo del vehículo y la fecha de venta para las ventas realizadas en el último mes:
SELECT c.nombre AS cliente, mo.nombre AS modelo, ve.fecha_venta
FROM venta ve
JOIN cliente c ON ve.cliente_id = c.id
JOIN vehiculo v ON ve.vehiculo_id = v.id
JOIN modelo mo ON v.modelo_id = mo.id
WHERE ve.fecha_venta >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH);
