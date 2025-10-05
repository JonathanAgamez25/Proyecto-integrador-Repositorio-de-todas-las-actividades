-- Crear tabla dim_cliente
CREATE TABLE dbo.dim_cliente(
    cliente_sk INT IDENTITY(1,1) NOT NULL,
    cliente_key INT NOT NULL,
    nombre_cliente VARCHAR(100),
    nombre_contacto VARCHAR(100),
    telefono VARCHAR(50),
    fax VARCHAR(50),
    ciudad VARCHAR(100),
    pais VARCHAR(100),
    region VARCHAR(100),
    codigo_postal VARCHAR(20),
    limite_credito DECIMAL(15,2),
    CONSTRAINT PK_dim_cliente PRIMARY KEY CLUSTERED (cliente_sk)
);

-- Poblar dim_cliente desde la base jardineria_staging
INSERT INTO dbo.dim_cliente (
    cliente_key, nombre_cliente, nombre_contacto, telefono, fax,
    ciudad, pais, region, codigo_postal, limite_credito
)
SELECT 
    c.ID_cliente,
    c.nombre_cliente,
    CONCAT(c.nombre_contacto, ' ', ISNULL(c.apellido_contacto,'')),
    c.telefono,
    c.fax,
    c.ciudad,
    c.pais,
    c.region,
    c.codigo_postal,
    c.limite_credito
FROM jardineria.dbo.cliente c;
