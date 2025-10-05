-- Crear tabla dim_producto
CREATE TABLE dbo.dim_producto(
    producto_sk INT IDENTITY(1,1) NOT NULL,
    producto_key VARCHAR(15) NOT NULL,
    nombre VARCHAR(100),
    gama VARCHAR(50),
    dimensiones VARCHAR(50),
    proveedor VARCHAR(50),
    descripcion TEXT,
    cantidad_en_stock SMALLINT,
    precio_venta DECIMAL(15,2),
    CONSTRAINT PK_dim_producto PRIMARY KEY CLUSTERED (producto_sk)
);

-- Poblar dim_producto
INSERT INTO dbo.dim_producto (
    producto_key, nombre, gama, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta
)
SELECT 
    p.ID_producto,
    p.nombre,
    p.gama,
    p.dimensiones,
    p.proveedor,
    p.descripcion,
    p.cantidad_en_stock,
    p.precio_venta
FROM jardineria.dbo.producto p;
