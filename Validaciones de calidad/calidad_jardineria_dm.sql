USE Jardineria_DM;

-- 1️⃣ Validar registros nulos o faltantes en dimensiones
SELECT COUNT(*) AS nulos_clientes
FROM dim_cliente
WHERE nombre_cliente IS NULL OR nombre_cliente = '';

SELECT COUNT(*) AS nulos_productos
FROM dim_producto
WHERE nombre_producto IS NULL OR nombre_producto = '';

SELECT COUNT(*) AS nulos_fecha
FROM dim_tiempo
WHERE fecha IS NULL;

-- 2️⃣ Comprobar duplicados en claves sustitutas
SELECT id_cliente, COUNT(*) AS repetidos
FROM dim_cliente
GROUP BY id_cliente
HAVING COUNT(*) > 1;

SELECT id_producto, COUNT(*) AS repetidos
FROM dim_producto
GROUP BY id_producto
HAVING COUNT(*) > 1;

-- 3️⃣ Validar integridad entre hechos y dimensiones
SELECT hv.id_pedido
FROM hechos_ventas hv
LEFT JOIN dim_cliente dc ON hv.id_cliente = dc.id_cliente
WHERE dc.id_cliente IS NULL;

SELECT hv.id_pedido
FROM hechos_ventas hv
LEFT JOIN dim_producto dp ON hv.id_producto = dp.id_producto
WHERE dp.id_producto IS NULL;

-- 4️⃣ Detectar montos o cantidades negativas en los hechos
SELECT COUNT(*) AS negativos
FROM hechos_ventas
WHERE cantidad < 0 OR total_venta < 0;

-- 5️⃣ Comparar conteos con la base staging (verificar carga correcta)
SELECT 
    (SELECT COUNT(*) FROM jardineria_staging.pedidos) AS staging_pedidos,
    (SELECT COUNT(*) FROM hechos_ventas) AS dm_pedidos;

SELECT 
    (SELECT COUNT(*) FROM jardineria_staging.clientes) AS staging_clientes,
    (SELECT COUNT(*) FROM dim_cliente) AS dm_clientes;

SELECT 
    (SELECT COUNT(*) FROM jardineria_staging.productos) AS staging_productos,
    (SELECT COUNT(*) FROM dim_producto) AS dm_productos;
