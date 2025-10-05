USE jardineria;

-- 1️⃣ Verificar valores nulos
SELECT COUNT(*) AS nulos_nombre_cliente
FROM cliente
WHERE nombre_cliente IS NULL OR nombre_cliente = '';

SELECT COUNT(*) AS nulos_fecha_pedido
FROM pedido
WHERE fecha_pedido IS NULL;

-- 2️⃣ Buscar duplicados
SELECT id_cliente, COUNT(*) AS repeticiones
FROM cliente
GROUP BY id_cliente
HAVING COUNT(*) > 1;

SELECT id_pedido, COUNT(*) AS repeticiones
FROM pedido
GROUP BY id_pedido
HAVING COUNT(*) > 1;

-- 3️⃣ Validar rangos
SELECT *
FROM producto
WHERE precio_venta < 0 OR cantidad_en_stock < 0;

-- 4️⃣ Validar integridad referencial
SELECT p.id_pedido
FROM pedido p
LEFT JOIN cliente c ON p.id_cliente = c.id_cliente
WHERE c.id_cliente IS NULL;

-- 5️⃣ Recuento general de registros
SELECT COUNT(*) AS total_clientes FROM cliente;
SELECT COUNT(*) AS total_pedidos FROM pedido;
SELECT COUNT(*) AS total_productos FROM producto;


