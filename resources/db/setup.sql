-- Check if the database exists and create it if not
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'webapp')
BEGIN
    CREATE DATABASE webapp;
END;
GO

-- Use the newly created or existing database
USE webapp;

-- Check if the login exists; if not, create it
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'app')
BEGIN
    CREATE LOGIN app WITH PASSWORD = 'Aspdotnet2@';
END;

-- Check if the user exists; if not, create it
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'app')
BEGIN
    CREATE USER app FOR LOGIN app;
END;

-- Grant permissions to the user
GRANT SELECT, INSERT, UPDATE, DELETE TO app;
GRANT CREATE TABLE TO app;
GRANT ALTER, CONTROL, SELECT, INSERT, UPDATE, DELETE, EXECUTE ON SCHEMA::dbo TO [app];
GO
