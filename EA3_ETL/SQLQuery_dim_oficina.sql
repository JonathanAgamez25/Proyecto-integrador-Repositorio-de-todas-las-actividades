-- Crear tabla dim_oficina
CREATE TABLE dbo.dim_oficina(
    oficina_sk INT IDENTITY(1,1) NOT NULL,
    oficina_key INT NOT NULL,
    ciudad VARCHAR(100),
    pais VARCHAR(100),
    region VARCHAR(100),
    codigo_postal VARCHAR(20),
    telefono VARCHAR(50),
    direccion VARCHAR(300),
    CONSTRAINT PK_dim_oficina PRIMARY KEY CLUSTERED (oficina_sk)
);

-- Poblar dim_oficina
INSERT INTO dbo.dim_oficina (
    oficina_key, ciudad, pais, region, codigo_postal, telefono, direccion
)
SELECT 
    o.ID_oficina,
    o.ciudad,
    o.pais,
    o.region,
    o.codigo_postal,
    o.telefono,
    RTRIM(CONCAT(o.linea_direccion1, ' ', ISNULL(o.linea_direccion2,'')))
FROM jardineria.dbo.oficina o;
