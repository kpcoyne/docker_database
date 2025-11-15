USE [master]
GO
PRINT 'Removing existing Objects'
DROP DATABASE IF EXISTS DemoData;
GO
DROP LOGIN IF EXISTS DemoUser;
GO
DROP USER IF EXISTS DemoUser;
GO
PRINT 'Creating Database'
CREATE DATABASE DemoData;
GO
-- Creates the login DemoUser with password.
USE [master]
GO
PRINT 'Creating Users and Logins'
CREATE LOGIN DemoUser WITH PASSWORD = '340$Uuxwp7Mcxo7Khy';
GO
USE [DemoData]
GO
-- Creates a database user for the login created previously.
CREATE USER DemoUser FOR LOGIN DemoUser;
GO
-- set DemoUser user as the owner of the DemoData database
ALTER ROLE db_owner ADD MEMBER [DemoUser];
GO
USE [master]
GO
ALTER SERVER ROLE [serveradmin] ADD MEMBER [DemoUser];
GO
USE [DemoData]
GO
PRINT 'Creating Products table'
CREATE TABLE Products (ID int, ProductName nvarchar(max));
GO

-- Create NODE tables
PRINT 'Creating Person NODE table'
CREATE TABLE Person (
  ID INTEGER PRIMARY KEY,
  name VARCHAR(100)
) AS NODE;
GO
PRINT 'Creating Resturant NODE table'
CREATE TABLE Restaurant (
  ID INTEGER NOT NULL,
  name VARCHAR(100),
  city VARCHAR(100)
) AS NODE;
GO
PRINT 'Creating City NODE table'
CREATE TABLE City (
  ID INTEGER PRIMARY KEY,
  name VARCHAR(100),
  stateName VARCHAR(100)
) AS NODE;
GO
-- Create EDGE tables.
PRINT 'Creating Edge tables'
CREATE TABLE likes (rating INTEGER) AS EDGE;
GO
CREATE TABLE friendOf AS EDGE;
GO
CREATE TABLE livesIn AS EDGE;
GO
CREATE TABLE locatedIn AS EDGE;
GO

