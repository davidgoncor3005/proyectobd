use GameExpress2;

----------------------------------    1ºEVALUCION   -----------------------------------      
-- Consulta 1: Una consulta de una tabla con WHERE
-- Obtener los clientes que son socios y se registraron después del 01 de enero de 2024,
-- mostrando también si son socios y la fecha de registro.
SELECT c.id_cliente, c.nombre, c.apellido1, c.apellido2, c.fecha_registro, c.socio
FROM cliente c
WHERE c.socio = 'Si' AND c.fecha_registro > '2024-01-01';


-- Consulta 2: Una consulta de más de una tabla
-- Obtener una lista de pedidos con los datos del cliente que los realizó,
-- incluyendo la forma de pago.
SELECT p.id_pedido, p.fecha, p.forma_pago, c.nombre, c.apellido1, c.email
FROM pedido p
INNER JOIN cliente c ON p.id_cliente = c.id_cliente
WHERE p.forma_pago = 'tarjeta_credito';


-- Consulta 3: Una consulta con agrupación
-- Calcular el número total de juegos vendidos y el ingreso total por cada año
SELECT
   YEAR(p.fecha),
   SUM(jp.cantidad),
   SUM(jp.cantidad * j.precio)
FROM pedido p
INNER JOIN juego_pedido jp ON p.id_pedido = jp.id_pedido
INNER JOIN juego j ON jp.id_juego = j.id_juego
GROUP BY YEAR(p.fecha)
ORDER BY YEAR(p.fecha);


-- Consulta 4: Una consulta con subconsultas
-- Juegos cuyo precio es superior al precio promedio de los juegos.
SELECT j.id_juego, j.titulo, j.plataforma, j.precio
FROM juego j
WHERE j.precio > (
   SELECT AVG(j.precio)
   FROM juego j
);


-- Consulta 5: Una que combine varias anteriores
-- Listar los juegos más vendidos en 2025 y las tiendas donde más se vendieron
SELECT j.titulo AS juego, t.id_tienda AS tienda, SUM(jp.cantidad) AS total_vendidos
FROM pedido p
INNER JOIN juego_pedido jp ON p.id_pedido = jp.id_pedido
INNER JOIN juego j ON jp.id_juego = j.id_juego
INNER JOIN tienda t ON t.id_direccion = p.id_direccion
WHERE YEAR(p.fecha) = 2025
GROUP BY j.titulo, t.id_tienda
ORDER BY total_vendidos DESC;




----------------------------------    2ºEVALUCION   -----------------------------------      
-- Consulta 1: Clientes que mas han comprado y cuanto han gastado
SELECT c.id_cliente, CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2), 
	COUNT(DISTINCT p.id_pedido),
    SUM(jp.cantidad),
    SUM(jp.cantidad * j.precio)
FROM cliente c
INNER JOIN pedido p ON c.id_cliente = p.id_cliente
INNER JOIN juego_pedido jp ON p.id_pedido = jp.id_pedido
INNER JOIN juego j ON jp.id_juego = j.id_juego
GROUP BY c.id_cliente, c.nombre, c.apellido1, c.apellido2
ORDER BY SUM(jp.cantidad * j.precio) DESC;
-- Explicacion:  Agrupa por cada cliente contado los pedidos unicos que se han hecho, 
-- la cantidad de juegos y cuanto dinero total se han gastado.


-- Consulta 2: Evolucion por año y mes de pedidos y ganancias
SELECT YEAR(p.fecha), MONTH(p.fecha), COUNT(DISTINCT p.id_pedido), SUM(jp.cantidad * j.precio) 
FROM pedido p
INNER JOIN juego_pedido jp ON p.id_pedido = jp.id_pedido
INNER JOIN juego j ON jp.id_juego = j.id_juego
GROUP BY YEAR(p.fecha), MONTH(p.fecha)
ORDER BY YEAR(p.fecha) ASC, MONTH(p.fecha) ASC;
-- Explicacion: Agrupa por cada año y mes contando los pedidos unicos que se han hecho
-- y calculando ganancias.


-- Consulta 3: Ventas según forma de pago y forma de entrega
SELECT p.forma_pago, p.forma_entrega, COUNT(DISTINCT p.id_pedido), SUM(jp.cantidad * j.precio)
FROM pedido p
INNER JOIN juego_pedido jp ON p.id_pedido = jp.id_pedido
INNER JOIN juego j ON jp.id_juego = j.id_juego
GROUP BY p.forma_pago, p.forma_entrega;
-- Explicacion: Agrupa los pedidos por forma de pago y forma de entrega
-- contando los pedidos unicos que se han hecho y calculando ganancias.


-- Consulta 4: Antigüedad y sueldo promedio por puesto (rol)
SELECT e.rol,
    ROUND(AVG(DATEDIFF(CURDATE(), e.fecha_contratacion) / 365), 2),
    ROUND(AVG(e.sueldo), 2)
FROM empleado e
GROUP BY e.rol;
-- Explicacion: Muestra por cada puesto de trabajo la antiguedad promedia 
-- y sueldo promedio.


-- Consulta 5: Ventas totales por plataforma y genero de juego
SELECT j.genero, j.plataforma, SUM(jp.cantidad), SUM(jp.cantidad * j.precio)
FROM juego_pedido jp 
INNER JOIN juego j ON jp.id_juego = j.id_juego
INNER JOIN pedido p ON jp.id_pedido = p.id_pedido
GROUP BY j.genero, j.plataforma
ORDER BY SUM(jp.cantidad * j.precio) DESC;
-- Explicacion: Agrupa los juegos por género y plataforma, 
-- mostrando la cantidad total de juegos vendidos y el ingreso total.



-- Vista 1: "Clientes que más han comprado y cuánto han gastado"
CREATE VIEW cliente_mas_valiosos AS
SELECT c.id_cliente, CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2), 
	COUNT(DISTINCT p.id_pedido),
    SUM(jp.cantidad),
    SUM(jp.cantidad * j.precio)
FROM cliente c
INNER JOIN pedido p ON c.id_cliente = p.id_cliente
INNER JOIN juego_pedido jp ON p.id_pedido = jp.id_pedido
INNER JOIN juego j ON jp.id_juego = j.id_juego
GROUP BY c.id_cliente, c.nombre, c.apellido1, c.apellido2
ORDER BY SUM(jp.cantidad * j.precio) DESC;

SELECT * FROM cliente_mas_valiosos;


-- Vista 2: "Antigüedad y sueldo promedio por puesto (rol)"
CREATE VIEW antigüedad_sueldo_empleados_promedio AS
SELECT e.rol,
    ROUND(AVG(DATEDIFF(CURDATE(), e.fecha_contratacion) / 365), 2),
    ROUND(AVG(e.sueldo), 2)
FROM empleado e
GROUP BY e.rol;

SELECT * FROM antigüedad_sueldo_empleados_promedio;



-- Procedimiento 1: Muestra todos los empleados con antigüedad igual o superior a X años. 
-- Si no hay, muestra un mensaje.
DELIMITER &&
DROP PROCEDURE IF EXISTS empleados_antiguos &&
CREATE PROCEDURE empleados_antiguos(IN anios INT)
BEGIN
  DECLARE total INT;

  -- Verifica si existen empleados con esa antigüedad
  SELECT COUNT(*) INTO total
  FROM empleado e
  WHERE DATEDIFF(CURDATE(), e.fecha_contratacion) / 365 >= anios;

  -- Si hay se muestran
  IF total > 0 THEN
    SELECT e.id_empleado, CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2), 
    	   e.fecha_contratacion,
           ROUND(DATEDIFF(CURDATE(), e.fecha_contratacion) / 365, 2)
    FROM empleado e
    WHERE DATEDIFF(CURDATE(), e.fecha_contratacion) / 365 >= anios;
  ELSE
    -- Si no hay, se muestra el siguiente mensaje:
    SELECT CONCAT('NO HAY EMPLEADOS CON MÁS DE ', anios, ' AÑOS DE ANTIGÜEDAD');
  END IF;
END &&
DELIMITER ;

CALL empleados_antiguos(2);
CALL empleados_antiguos(50);  -- No hay resultados ya que no hay nadie que supere los 50 años


-- Procedimiento 2: Muestra el total gastado por un cliente.
-- Este llamara a la función total_gasto_cliente.
DELIMITER &&
DROP PROCEDURE IF EXISTS info_gasto_cliente &&
CREATE PROCEDURE info_gasto_cliente(IN id_cli INT)
BEGIN
  DECLARE mensaje VARCHAR(100);

  -- Llamada a la función
  SET mensaje = total_gasto_cliente(id_cli);

  -- Mostrar mensaje
  SELECT mensaje;
END &&
DELIMITER ;

CALL info_gasto_cliente(20);
CALL info_gasto_cliente(541);  -- Cliente no existe o sin pedidos


-- Procedimiento 3: Muestra el total de ventas registradas por cada tienda.
-- Si no hay ventas, se muestra un mensaje de que no hay.
DELIMITER &&
DROP PROCEDURE IF EXISTS ventas_por_tienda &&
CREATE PROCEDURE ventas_por_tienda()
BEGIN
  DECLARE total INT;

  -- Verifica si hay ventas
  SELECT COUNT(*) INTO total
  FROM pedido p
  INNER JOIN juego_pedido jp ON p.id_pedido = jp.id_pedido;

  -- Si no hay ventas
  IF total = 0 THEN
    SELECT 'NO HAY VENTAS REGISTRADAS EN NINGUNA TIENDA';
  ELSE
    -- Si hay, muestra el total por tienda
    SELECT t.id_tienda, ROUND(SUM(jp.cantidad * j.precio), 2)
    FROM tienda t
    INNER JOIN empleado e ON e.id_tienda = t.id_tienda
    INNER JOIN pedido p ON p.id_empleado = e.id_empleado
    INNER JOIN juego_pedido jp ON p.id_pedido = jp.id_pedido
    INNER JOIN juego j ON jp.id_juego = j.id_juego
    GROUP BY t.id_tienda;
  END IF;
END &&
DELIMITER ;

CALL ventas_por_tienda();


-- Funcion 1: Devuelve la antigüedad de un empleado en años.
-- Si el ID no existe, devuelve un mensaje indicando que no se encontró.
DELIMITER &&
DROP FUNCTION IF EXISTS antiguedad_empleado &&
CREATE FUNCTION antiguedad_empleado(id_emp INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
  DECLARE fecha DATE;
  DECLARE antiguedad DECIMAL(5,2);
  DECLARE resultado VARCHAR(100);

  -- Se busca la fecha de contratación del empleado
  SELECT e.fecha_contratacion INTO fecha
  FROM empleado e
  WHERE e.id_empleado = id_emp;

  -- Si no se encontró el empleado
  IF fecha IS NULL THEN
    SET resultado = 'NO EXISTE UN EMPLEADO CON ESE ID';
  ELSE
    -- Calculo de la antigüedad en años
    SET antiguedad = DATEDIFF(CURDATE(), fecha) / 365;
    SET resultado = CONCAT('Antigüedad: ', ROUND(antiguedad, 2), ' años.');
  END IF;
  RETURN resultado;
END &&
DELIMITER ;

SELECT antiguedad_empleado(10);
SELECT antiguedad_empleado(541);  -- ID inexistente


-- Funcion 2: Devuelve el total gastado por un cliente (precio * cantidad).
-- Si no ha comprado, se muestra un mensaje que nunca lo ha hecho.
DELIMITER &&
DROP FUNCTION IF EXISTS total_gasto_cliente &&
CREATE FUNCTION total_gasto_cliente(id_cliente INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
  DECLARE total DECIMAL(10,2);
  DECLARE resultado VARCHAR(100);

  -- Se calcula el total gastado por el cliente
  SELECT SUM(jp.cantidad * j.precio) INTO total
  FROM pedido p
  INNER JOIN juego_pedido jp ON p.id_pedido = jp.id_pedido
  INNER JOIN juego j ON jp.id_juego = j.id_juego
  WHERE p.id_cliente = id_cliente;

  -- Validacion de si ha hecho compra o no
  IF total IS NULL THEN
    SET resultado = 'El cliente no ha realizado ninguna compra.';
  ELSE
    SET resultado = CONCAT('Total gastado: ', total, ' €');
  END IF;
  RETURN resultado;
END &&
DELIMITER ;

SELECT total_gasto_cliente(20);
SELECT total_gasto_cliente(1);  -- Cliente sin pedidos



-- Trigger 1: Trigger que impide insertar pedidos con fechas que no corresponden al año actual.
-- Si el año de la fecha no coincide con el año actual, se muestra un mensaje de error.
DELIMITER //
DROP TRIGGER IF EXISTS insertar_pedido //
CREATE TRIGGER insertar_pedido BEFORE INSERT ON pedido FOR EACH ROW
BEGIN
  -- Verificamos si el pedido corresponde al año actual
  IF YEAR(NEW.fecha) != YEAR(CURDATE()) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'EL PEDIDO NO CORRESPONDE AL AÑO ACTUAL';
  END IF;
END //
DELIMITER ;

-- ❌ Este muestra un error (año diferente)
INSERT INTO pedido (id_pedido, fecha, forma_entrega, forma_pago, descuento, id_cliente, id_empleado, id_direccion)
VALUES (1000, '2023-12-05', 'fisico', 'paypal', 0, 1, 1, 1);
-- ✅ Este sí permite insertar pedido (año actual)
INSERT INTO pedido (id_pedido, fecha, forma_entrega, forma_pago, descuento, id_cliente, id_empleado, id_direccion)
VALUES (541, CURDATE(), 'online', 'tarjeta_credito', 0, 1, 1, 1);


-- Trigger 2: Trigger que impide que un cliente realice más de 3 pedidos en el mismo mes.
-- Si ya ha alcanzado el maximo, se muestra un mensaje un error.
DELIMITER //
DROP TRIGGER IF EXISTS pedidos_maximos //
CREATE TRIGGER pedidos_maximos BEFORE INSERT ON pedido FOR EACH ROW
BEGIN
  DECLARE numpedidos INT;

  -- Se cuenta cuantos pedidos ha hecho ese cliente en el mismo mes del nuevo pedido
  SELECT COUNT(*) INTO numpedidos
  FROM pedido p
  WHERE p.id_cliente = NEW.id_cliente 
  AND MONTH(p.fecha) = MONTH(NEW.fecha);

  -- Si ya tiene 3 o más, no se permite insertar
  IF numpedidos >= 3 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'EL CLIENTE HA REALIZADO MÁS DE 3 PEDIDOS ESTE MES';
  END IF;
END //
DELIMITER ;

-- ✅ Primeros 3 pedidos válidos (cliente 2)
INSERT INTO pedido VALUES (541, CURDATE(), 'fisico', 'efectivo', 0, 2, 1, 1);
INSERT INTO pedido VALUES (542, CURDATE(), 'online', 'paypal', 0, 2, 1, 1);
INSERT INTO pedido VALUES (543, CURDATE(), 'fisico', 'tarjeta_credito', 0, 2, 1, 1);
-- ❌ Mensaje de error ya que es el cuarto pedido del cliente en el mismo mes
INSERT INTO pedido VALUES (2004, CURDATE(), 'online', 'efectivo', 0, 2, 1, 1);




