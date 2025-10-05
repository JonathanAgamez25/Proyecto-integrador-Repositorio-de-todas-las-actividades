USE Jardineria_Staging;
GO
-- ==============================================
-- TABLA CLIENTES
-- ==============================================
SELECT TOP 0 *,
       GETDATE() AS FECHA_CARGA,
       NEWID()   AS BATCH_ID
INTO CLIENTES
FROM Jardineria.dbo.cliente;
GO
-- ==============================================
-- TABLA PEDIDOS
-- ==============================================
USE Jardineria_Staging;
GO
SELECT TOP 0 *,
       GETDATE() AS FECHA_CARGA,
       NEWID()   AS BATCH_ID
INTO PEDIDOS
FROM Jardineria.dbo.pedido;
GO
-- ==============================================
-- TABLA PRODUCTOS
-- ==============================================
USE Jardineria_Staging;
GO
SELECT TOP 0 *,
       GETDATE() AS FECHA_CARGA,
       NEWID()   AS BATCH_ID
INTO PRODUCTOS
FROM Jardineria.dbo.producto;
GO
-- ==============================================
-- TABLA DETALLE_PEDIDO
-- ==============================================
USE Jardineria_Staging;
GO
SELECT TOP 0 *,
       GETDATE() AS FECHA_CARGA,
       NEWID()   AS BATCH_ID
INTO DETALLE_PEDIDO
FROM Jardineria.dbo.detalle_pedido;
GO

-- ==============================================
-- TABLA OFICINAS 
-- ==============================================
USE Jardineria_Staging;
GO

SELECT TOP 0 *,
       GETDATE() AS FECHA_CARGA,
       NEWID()   AS BATCH_ID
INTO OFICINAS
FROM Jardineria.dbo.oficina;
GO

-- ==============================================
-- TABLA EMPLEADOS
-- ==============================================


SELECT TOP 0 *,
       GETDATE() AS FECHA_CARGA,
       NEWID()   AS BATCH_ID
INTO EMPLEADOS
FROM Jardineria.dbo.empleado;
GO


-- ==============================================
-- CARGA CLIENTES
-- ==============================================
INSERT INTO CLIENTES
       (nombre_cliente,
        nombre_contacto,
        apellido_contacto,
        telefono,
        fax,
        linea_direccion1,
        linea_direccion2,
        ciudad,
        region,
        pais,
        codigo_postal,
        ID_empleado_rep_ventas,
        limite_credito,
        FECHA_CARGA,
        BATCH_ID)
SELECT nombre_cliente,
       nombre_contacto,
       apellido_contacto,
       telefono,
       fax,
       linea_direccion1,
       linea_direccion2,
       ciudad,
       region,
       pais,
       codigo_postal,
       ID_empleado_rep_ventas,
       limite_credito,
       GETDATE(),
       NEWID()
FROM Jardineria.dbo.cliente;
GO

-- ==============================================
-- CARGA PEDIDOS
-- ==============================================
INSERT INTO PEDIDOS
       (fecha_pedido,
        fecha_esperada,
        fecha_entrega,
        estado,
        comentarios,
        ID_cliente,
        FECHA_CARGA,
        BATCH_ID)
SELECT fecha_pedido,
       fecha_esperada,
       fecha_entrega,
       estado,
       comentarios,
       ID_cliente,
       GETDATE(),
       NEWID()
FROM Jardineria.dbo.pedido;
GO

-- ==============================================
-- CARGA DETALLE_PEDIDO
-- ==============================================
INSERT INTO DETALLE_PEDIDO
       (ID_pedido,
        ID_producto,
        cantidad,
        precio_unidad,
        numero_linea,
        FECHA_CARGA,
        BATCH_ID)
SELECT ID_pedido,
       ID_producto,
       cantidad,
       precio_unidad,
       numero_linea,
       GETDATE(),
       NEWID()
FROM Jardineria.dbo.detalle_pedido;
GO

-- ==============================================
-- CARGA PRODUCTOS
-- ==============================================
INSERT INTO PRODUCTOS
       (CodigoProducto,
        nombre,
        Categoria,
        dimensiones,
        proveedor,
        descripcion,
        cantidad_en_stock,
        precio_venta,
        precio_proveedor,
        FECHA_CARGA,
        BATCH_ID)
SELECT CodigoProducto,
       nombre,
       Categoria,
       dimensiones,
       proveedor,
       descripcion,
       cantidad_en_stock,
       precio_venta,
       precio_proveedor,
       GETDATE(),
       NEWID()
FROM Jardineria.dbo.producto;
GO

-- ==============================================
-- CARGA EMPLEADOS
-- ==============================================
INSERT INTO EMPLEADOS
       (nombre,
        apellido1,
        apellido2,
        extension,
        email,
        ID_oficina,
        ID_jefe,
        puesto,
        FECHA_CARGA,
        BATCH_ID)
SELECT nombre,
       apellido1,
       apellido2,
       extension,
       email,
       ID_oficina,
       ID_jefe,
       puesto,
       GETDATE(),
       NEWID()
FROM Jardineria.dbo.EMPLEADOS;
GO

-- ==============================================
-- CARGA OFICINAS
-- ==============================================
INSERT INTO OFICINAS
       (Descripcion,
        ciudad,
        pais,
        region,
        codigo_postal,
        telefono,
        linea_direccion1,
        linea_direccion2,
        FECHA_CARGA,
        BATCH_ID)
SELECT Descripcion,
       ciudad,
       pais,
       region,
       codigo_postal,
       telefono,
       linea_direccion1,
       linea_direccion2,
       GETDATE(),
       NEWID()
FROM Jardineria.dbo.OFICINAS;
GO

-- =============================================
-- BACKUP COMPLETO DE Jardineria
-- =============================================
BACKUP DATABASE Jardineria
TO DISK = 'C:\Users\Usuario\Escritorio\BackupsSQL\Jardineria_FULL.bak'
WITH FORMAT,
     INIT,
     NAME = 'Backup completo Jardineria',
     STATS = 10;
GO
-- =============================================
-- BACKUP COMPLETO DE Jardineria_Staging
-- =============================================


BACKUP DATABASE Jardineria_Staging
TO DISK = 'C:\Users\Usuario\Escritorio\BackupsSQL\Jardineria_Staging_FULL.bak'
WITH FORMAT,
     INIT,
     NAME = 'Backup completo Jardineria_Staging',
     STATS = 10;
GO
