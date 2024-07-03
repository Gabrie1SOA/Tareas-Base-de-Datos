-- Crear la base de datos
CREATE DATABASE BancoLosAfortunados;
USE BancoLosAfortunados;

-- Crear tabla Clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    email VARCHAR(50)
);

-- Crear tabla Cuentas
CREATE TABLE Cuentas (
    id_cuenta INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    saldo DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Crear tabla Transacciones
CREATE TABLE Transacciones (
    id_transaccion INT PRIMARY KEY AUTO_INCREMENT,
    id_cuenta INT,
    monto DECIMAL(10, 2),
    fecha DATE,
    FOREIGN KEY (id_cuenta) REFERENCES Cuentas(id_cuenta)
);

-- Insertar 20 registros en la tabla Clientes
INSERT INTO Clientes (nombre, email) VALUES
('Carlos Lopez', 'carlos@example.com'),
('Ana Martinez', 'ana@example.com'),
('Luis Gomez', 'luis@example.com'),
('Maria Rodriguez', 'maria@example.com'),
('Jose Fernandez', 'jose@example.com'),
('Laura Sanchez', 'laura@example.com'),
('Pedro Diaz', 'pedro@example.com'),
('Lucia Ramirez', 'lucia@example.com'),
('Miguel Torres', 'miguel@example.com'),
('Sofia Perez', 'sofia@example.com'),
('Juan Hernandez', 'juan@example.com'),
('Elena Moreno', 'elena@example.com'),
('Diego Castro', 'diego@example.com'),
('Paula Suarez', 'paula@example.com'),
('Jorge Mendez', 'jorge@example.com'),
('Irene Vargas', 'irene@example.com'),
('Oscar Ruiz', 'oscar@example.com'),
('Marta Jimenez', 'marta@example.com'),
('Alberto Vega', 'alberto@example.com'),
('Gloria Rivera', 'gloria@example.com');

-- Insertar registros en la tabla Cuentas
INSERT INTO Cuentas (id_cliente, saldo) VALUES
(1, 5000.00), (1, 1500.00),
(2, 3000.00),
(3, 2500.00),
(4, 8000.00),
(5, 2000.00),
(6, 1000.00),
(7, 4500.00),
(8, 3200.00),
(9, 6000.00),
(10, 700.00),
(11, 1200.00),
(12, 3800.00),
(13, 2200.00),
(14, 4300.00),
(15, 5300.00),
(16, 1100.00),
(17, 4100.00),
(18, 3600.00),
(19, 2900.00),
(20, 4700.00);

-- Insertar registros en la tabla Transacciones
INSERT INTO Transacciones (id_cuenta, monto, fecha) VALUES
(1, 500.00, '2024-01-15'), (1, -200.00, '2024-02-20'),
(2, 1500.00, '2023-05-25'),
(3, -500.00, '2023-03-10'),
(4, 2000.00, '2024-06-30'),
(5, -300.00, '2024-07-01'),
(6, 800.00, '2023-08-11'),
(7, -100.00, '2023-12-21'),
(8, 600.00, '2023-04-14'),
(9, -200.00, '2024-03-18'),
(10, 400.00, '2024-02-02'),
(11, -100.00, '2023-11-27'),
(12, 1200.00, '2023-09-19'),
(13, -200.00, '2024-05-29'),
(14, 300.00, '2024-01-07'),
(15, -500.00, '2023-10-05'),
(16, 700.00, '2024-06-13'),
(17, -300.00, '2023-07-17'),
(18, 800.00, '2023-02-22'),
(19, -400.00, '2024-04-03'),
(20, 600.00, '2024-03-30');

-- Ejercicio 1: Selección y Filtración Básica
-- Seleccionar el id_cuenta y el saldo de todas las cuentas
SELECT id_cuenta, saldo FROM Cuentas;

-- Filtrar las cuentas que tienen un saldo mayor a 4000
SELECT id_cuenta, saldo FROM Cuentas WHERE saldo > 4000;

-- Seleccionar las cuentas con saldo menor a 2000
SELECT id_cuenta, saldo FROM Cuentas WHERE saldo < 2000;

-- Mostrar los nombres de los clientes y la longitud de sus nombres
SELECT nombre, LENGTH(nombre) AS longitud_nombre FROM Clientes;

-- Seleccionar las cuentas con saldo entre 1000 y 3000
SELECT id_cuenta, saldo FROM Cuentas WHERE saldo BETWEEN 1000 AND 3000;

-- Obtener una lista de todos los clientes y sus cuentas, mostrando los valores NULL
SELECT Clientes.id_cliente, nombre, Cuentas.id_cuenta, saldo 
FROM Clientes LEFT JOIN Cuentas ON Clientes.id_cliente = Cuentas.id_cliente;

-- Concatenar el nombre del cliente y su email con un separador
SELECT CONCAT(nombre, ' - ', email) AS cliente_info FROM Clientes;

-- Extraer los últimos 3 caracteres del email de cada cliente
SELECT email, RIGHT(email, 3) AS ultimos_3_caracteres FROM Clientes;

-- Convertir el nombre del cliente a minúsculas
SELECT LOWER(nombre) AS nombre_minusculas FROM Clientes;

-- Convertir el nombre del cliente a mayúsculas
SELECT UPPER(nombre) AS nombre_mayusculas FROM Clientes;

-- Seleccionar las transacciones ordenadas por monto de mayor a menor, mostrando solo las primeras 10
SELECT * FROM Transacciones ORDER BY monto DESC LIMIT 10;

-- Calcular el saldo de cada cuenta después de aplicar un interés del 5%
SELECT id_cuenta, saldo, saldo * 1.05 AS saldo_con_interes FROM Cuentas;

-- Reemplazar el dominio del email de los clientes
SELECT email, REPLACE(email, '@example.com', '@newdomain.com') AS email_nuevo FROM Clientes;

-- Ejercicio 2: Uso de Funciones de Cadena
-- Selecciona el nombre de cada cliente
SELECT nombre FROM Clientes;

-- Añade una columna que muestre el email del cliente en el formato Correo: [email]
SELECT nombre, CONCAT('Correo: ', email) AS email_formateado FROM Clientes;

-- Mostrar los emails de los clientes en minúsculas
SELECT LOWER(email) AS email_minusculas FROM Clientes;

-- Mostrar el nombre del cliente en mayúsculas
SELECT UPPER(nombre) AS nombre_mayusculas FROM Clientes;

-- Ejercicio 3: Agregación de Datos
-- Selecciona el id_cuenta
SELECT id_cuenta FROM Cuentas;

-- Calcula el total de las transacciones realizadas en cada cuenta
SELECT id_cuenta, SUM(monto) AS total_transacciones FROM Transacciones GROUP BY id_cuenta;

-- Calcular el saldo total de todas las cuentas
SELECT SUM(saldo) AS saldo_total FROM Cuentas;

-- Calcular el monto total de todas las transacciones
SELECT SUM(monto) AS monto_total FROM Transacciones;

-- Calcular el monto promedio de las transacciones
SELECT AVG(monto) AS monto_promedio FROM Transacciones;

-- Ejercicio 4: Funciones de Fecha
-- Selecciona el id_transaccion y la fecha de todas las transacciones
SELECT id_transaccion, fecha FROM Transacciones;

-- Extraer el año de la fecha de cada transacción
SELECT id_transaccion, YEAR(fecha) AS anio FROM Transacciones;

-- Extraer el mes de la fecha de cada transacción
SELECT id_transaccion, MONTH(fecha) AS mes FROM Transacciones;

-- Extraer el día de la semana de la fecha de cada transacción
SELECT id_transaccion, DAYOFWEEK(fecha) AS dia_semana FROM Transacciones;

-- Filtra las transacciones que se realizaron en el año 2024
SELECT * FROM Transacciones WHERE YEAR(fecha) = 2024;

-- Seleccionar las transacciones realizadas en 2023
SELECT * FROM Transacciones WHERE YEAR(fecha) = 2023;

-- Seleccionar las transacciones realizadas en el mes de junio de cualquier año
SELECT * FROM Transacciones WHERE MONTH(fecha) = 6;

-- Seleccionar las transacciones realizadas el 15 de cada mes
SELECT * FROM Transacciones WHERE DAY(fecha) = 15;

-- Ejercicio 5: Agrupación y Contar Resultados
-- Selecciona el id_cuenta
SELECT id_cuenta FROM Transacciones;

-- Cuenta el número de transacciones realizadas en cada cuenta
SELECT id_cuenta, COUNT(*) AS numero_transacciones FROM Transacciones GROUP BY id_cuenta;

-- Calcular el saldo promedio de todas las cuentas
SELECT AVG(saldo) AS saldo_promedio FROM Cuentas;

-- Ejercicio 6: Filtración con Condiciones
-- Seleccionar las transacciones con un monto negativo
SELECT * FROM Transacciones WHERE monto < 0;

-- Seleccionar las transacciones con un monto positivo
SELECT * FROM Transacciones WHERE monto > 0;

-- Ejercicio 7: Ordenamiento
-- Seleccionar todas las cuentas ordenadas por saldo de mayor a menor
SELECT * FROM Cuentas ORDER BY saldo DESC;

-- Seleccionar todos los clientes ordenados alfabéticamente por nombre
SELECT * FROM Clientes ORDER BY nombre;

-- Seleccionar las transacciones realizadas en 2023
SELECT * FROM Transacciones WHERE YEAR(fecha) = 2023;

-- Seleccionar las cuentas ordenadas por saldo de menor a mayor, mostrando solo las primeras 5
SELECT * FROM Cuentas ORDER BY saldo ASC LIMIT 5;

-- Ejercicio 8: Contar Resultados
-- Contar el número total de clientes
SELECT COUNT(*) AS total_clientes FROM Clientes;

-- Contar el número total de cuentas
SELECT COUNT(*) AS total_cuentas FROM Cuentas;

-- Contar el número total de transacciones
SELECT COUNT(*) AS total_transacciones FROM Transacciones;

-- Redondear el saldo de cada cuenta a dos decimales
SELECT id_cuenta, ROUND(saldo, 2) AS saldo_redondeado FROM Cuentas;

-- Ejercicio 9: Máximos y Mínimos
-- Encontrar la cuenta con el saldo más alto
SELECT * FROM Cuentas ORDER BY saldo DESC LIMIT 1;

-- Encontrar la cuenta con el saldo más bajo
SELECT * FROM Cuentas ORDER BY saldo ASC LIMIT 1;

-- Encontrar la transacción con el monto más alto
SELECT * FROM Transacciones ORDER BY monto DESC LIMIT 1;

-- Encontrar la transacción con el monto más bajo
SELECT * FROM Transacciones ORDER BY monto ASC LIMIT 1;
