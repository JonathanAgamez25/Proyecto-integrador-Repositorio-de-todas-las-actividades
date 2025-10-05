-- Backup de la base de datos Jardineria_Staging
BACKUP DATABASE Jardineria_Staging
TO DISK = 'C:\Documentos\scripts.BD\Jardineria_Staging.bak'
WITH FORMAT,
     INIT,
     NAME = 'Backup Jardineria_Staging',
     SKIP,
     NOREWIND,
     NOUNLOAD,
     STATS = 10;

-- Backup de la base de datos Jardineria_DM
BACKUP DATABASE Jardineria_DM
TO DISK = 'C:\Documentos\scripts.BD\Jardineria_DM.bak'
WITH FORMAT,
     INIT,
     NAME = 'Backup Jardineria_DM',
     SKIP,
     NOREWIND,
     NOUNLOAD,
     STATS = 10;
