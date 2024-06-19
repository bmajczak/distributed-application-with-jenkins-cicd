IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'webapp')
BEGIN
    CREATE DATABASE webapp;
END;
GO

USE webapp;

CREATE LOGIN app WITH PASSWORD = 'Aspdotnet2@';
CREATE USER app FOR LOGIN app;

GRANT SELECT, INSERT, UPDATE, DELETE TO app;
GRANT CREATE TABLE TO app;
GO