-- Susana Farías
DROP DATABASE IF EXISTS clientes_pedidos; --Eliminar bd en caso de existir
CREATE DATABASE clientes_pedidos; --crear bd
USE clientes_pedidos; -- usar bd
--creacion de la tabla clientes
CREATE TABLE client_list ( 
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    name_client VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telephone VARCHAR(15)
);

--creacuion de la tabla pedidos
CREATE TABLE orders( 
    id_order INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    date_order DATETIME NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES client_list(id_client)
    );

--insercion de datos a las tablas
INSERT INTO client_list (name_client, email, telephone)
VALUES
('Ana Torres', 'ana.torres@example.com', '5551111'),
('Luis Pérez', 'luis.perez@example.com', '5552222'),
('María González', 'maria.gonzalez@example.com', '5553333'),
('Pedro Rivas', 'pedro.rivas@example.com', '5554444'),
('Carla Díaz', 'carla.diaz@example.com', '5555555');

INSERT INTO orders (client_id, date_order, total)
VALUES
(1, NOW(), 12000),
(2, NOW(), 45000),
(1, NOW(), 8000),
(3, NOW(), 15000),
(4, NOW(), 60000),
(2, NOW(), 20000),
(5, NOW(), 9000),
(3, NOW(), 25000),
(1, NOW(), 30000),
(4, NOW(), 12000);

--consultamos por aquellos clientes que tienen pedidos realzados
SELECT c.name_client AS Cliente,
 o.id_order AS Pedido, 
 o.date_order AS Fecha, 
 o.total AS Monto
FROM client_list AS c
JOIN orders AS o 
ON c.id_client = o.client_id;

--seleccion de pedidos por clientes especificos
SELECT 
    c.name_client AS Cliente,
    o.id_order AS Pedido,
    o.date_order AS Fecha,
    o.total AS Monto
FROM client_list AS c
JOIN orders AS o
    ON c.id_client = o.client_id
WHERE c.id_client = 1;  --realizar el cambio del id_client para otros clientes
 

SELECT 
    c.name_client AS Cliente,
    o.id_order AS Pedido,
    o.date_order AS Fecha,
    o.total AS Monto
FROM client_list AS c
JOIN orders AS o
    ON c.id_client = o.client_id
WHERE LOWER(c.name_client) LIKE LOWER('maría%');  --cambiar dl name_client para otros clientes


--total de pedidos por clientes
SELECT 
    c.name_client AS Cliente,
    SUM(o.total) AS Total_Pedidos
FROM client_list AS c
JOIN orders AS o
    ON c.id_client = o.client_id
GROUP BY c.id_client, c.name_client;

--3 clientes con mas pedidos realizados
SELECT 
    c.name_client AS Cliente,
    COUNT(o.id_order) AS Cantidad_Pedidos
FROM client_list AS c
JOIN orders AS o
    ON c.id_client = o.client_id
GROUP BY c.id_client, c.name_client
ORDER BY Cantidad_Pedidos DESC
LIMIT 3;

--Susana Farías
--ejecutado en consola con
-- mysql -u root -p
-- ingresar la contraseña 
--consultar BD disponibles 
-- SHOW DATABASES; 
--creo bd y comienzo a eejecutar cada una de las consultas
