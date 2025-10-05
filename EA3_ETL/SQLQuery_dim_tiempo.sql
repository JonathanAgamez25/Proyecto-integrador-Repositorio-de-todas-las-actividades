-- Crear tabla dim_tiempo
CREATE TABLE dbo.dim_tiempo(
    tiempo_sk INT IDENTITY(1,1) NOT NULL,
    fecha DATE NOT NULL,
    anio INT,
    trimestre INT,
    mes INT,
    dia INT,
    nombre_mes VARCHAR(20),
    nombre_dia_semana VARCHAR(20),
    CONSTRAINT PK_dim_tiempo PRIMARY KEY CLUSTERED (tiempo_sk)
);

-- Poblar dim_tiempo desde fechas de pedidos
INSERT INTO dbo.dim_tiempo (fecha, anio, trimestre, mes, dia, nombre_mes, nombre_dia_semana)
SELECT DISTINCT
    p.fecha_pedido,
    YEAR(p.fecha_pedido),
    DATEPART(QUARTER, p.fecha_pedido),
    MONTH(p.fecha_pedido),
    DAY(p.fecha_pedido),
    DATENAME(MONTH, p.fecha_pedido),
    DATENAME(WEEKDAY, p.fecha_pedido)
FROM jardineria.dbo.pedido p
WHERE p.fecha_pedido IS NOT NULL;
