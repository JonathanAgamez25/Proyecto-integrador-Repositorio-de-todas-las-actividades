-- Crear tabla dim_empleado
CREATE TABLE dbo.dim_empleado(
    empleado_sk INT IDENTITY(1,1) NOT NULL,
    empleado_key INT NOT NULL,
    nombre_completo VARCHAR(200),
    email VARCHAR(100),
    puesto VARCHAR(100),
    oficina_key INT,
    nombre_jefe VARCHAR(200),
    CONSTRAINT PK_dim_empleado PRIMARY KEY CLUSTERED (empleado_sk)
);

-- Poblar dim_empleado
INSERT INTO dbo.dim_empleado (
    empleado_key, nombre_completo, email, puesto, oficina_key, nombre_jefe
)
SELECT 
    e.ID_empleado,
    RTRIM(CONCAT(e.nombre, ' ', e.apellido1, ' ', ISNULL(e.apellido2,''))),
    e.email,
    e.puesto,
    e.ID_oficina,
    RTRIM(CONCAT(j.nombre, ' ', j.apellido1, ' ', ISNULL(j.apellido2,'')))
FROM jardineria.dbo.empleado e
LEFT JOIN jardineria.dbo.empleado j
    ON e.ID_jefe = j.ID_empleado;
