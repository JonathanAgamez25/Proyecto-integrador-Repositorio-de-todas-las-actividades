-- Validar dimensiones
SELECT COUNT(*) AS total_clientes FROM dbo.dim_cliente;
SELECT COUNT(*) AS total_oficinas FROM dbo.dim_oficina;
SELECT COUNT(*) AS total_empleados FROM dbo.dim_empleado;
SELECT COUNT(*) AS total_productos FROM dbo.dim_producto;
SELECT COUNT(*) AS total_tiempo FROM dbo.dim_tiempo;

-- Validar tabla de hechos
SELECT COUNT(*) AS total_ventas FROM dbo.fact_ventas;
SELECT TOP 10 * FROM dbo.fact_ventas;
