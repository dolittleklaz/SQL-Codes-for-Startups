/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [SystemInformationID]
      ,[Database Version]
      ,[VersionDate]
      ,[ModifiedDate]
  FROM [AdventureWorksLT2012].[dbo].[BuildVersion]


  create table Tam (
  ID varchar(2) not null, 
  Name varchar(50));

  drop table Tam

  select top 100 name, ListPrice
  From SalesLT.Product
  order by ListPrice DESC;