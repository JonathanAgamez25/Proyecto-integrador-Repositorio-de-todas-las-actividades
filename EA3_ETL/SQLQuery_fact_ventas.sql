-- Crear tabla fact_ventas
CREATE TABLE dbo.fact_ventas(
    venta_sk INT IDENTITY(1,1) NOT NULL,
    pedido_key INT NOT NULL,
    cliente_sk INT NOT NULL,
    producto_sk INT NOT NULL,
    empleado_sk INT NOT NULL,
    oficina_sk INT NOT NULL,
    tiempo_sk INT NOT NULL,
    cantidad_vendida INT,
    precio_unidad DECIMAL(15,2),
    total_linea DECIMAL(15,2),
    dias_tardanza_entrega INT,
    estado_pedido VARCHAR(50),
    CONSTRAINT PK_fact_ventas PRIMARY KEY CLUSTERED (venta_sk)
);

-- Poblar fact_ventas
INSERT INTO dbo.fact_ventas (
    pedido_key, cliente_sk, producto_sk, empleado_sk, oficina_sk, tiempo_sk,
    cantidad_vendida, precio_unidad, total_linea, dias_tardanza_entrega, estado_pedido
)
SELECT 
    p.ID_pedido,
    dc.cliente_sk,
    dp.producto_sk,
    de.empleado_sk,
    dof.oficina_sk,
    dt.tiempo_sk,
    dped.cantidad,
    dped.precio_unidad,
    (dped.cantidad * dped.precio_unidad) AS total_linea,
    DATEDIFF(DAY, p.fecha_esperada, p.fecha_entrega) AS dias_tardanza_entrega,
    p.estado
FROM jardineria.dbo.pedido p
INNER JOIN jardineria.dbo.detalle_pedido dped
    ON p.ID_pedido = dped.ID_pedido
INNER JOIN Jardineria_DM.dbo.dim_cliente dc
    ON p.ID_cliente = dc.cliente_key
INNER JOIN Jardineria_DM.dbo.dim_producto dp
    ON dped.ID_producto = dp.producto_key
INNER JOIN jardineria.dbo.cliente c
    ON p.ID_cliente = c.ID_cliente
INNER JOIN jardineria.dbo.empleado e
    ON c.ID_empleado_rep_ventas = e.ID_empleado
INNER JOIN Jardineria_DM.dbo.dim_empleado de
    ON e.ID_empleado = de.empleado_key
INNER JOIN jardineria.dbo.oficina o
    ON e.ID_oficina = o.ID_oficina
INNER JOIN Jardineria_DM.dbo.dim_oficina dof
    ON o.ID_oficina = dof.oficina_key
INNER JOIN Jardineria_DM.dbo.dim_tiempo dt
    ON dt.fecha = p.fecha_pedido;
