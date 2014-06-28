--script for adding Materials tables and test data to the Trademaster Database

create schema "Materials";

CREATE TABLE "Materials.Manufacturers" (
  manufacturerID   SERIAL PRIMARY KEY     NOT NULL
  ,manufacturerName VARCHAR(60)            NOT NULL
  ,standardDiscount DECIMAL DEFAULT 0.0000 NOT NULL
);

CREATE TABLE "Materials.Parts" (
  partID serial primary key not null
  ,CompanyPartNumber varchar(25) not null
  ,DepartmentID int null
  ,manufacturerID int null
  ,partNumMfg varchar(25) null
  ,invoiceDescription varchar(80) not null
  ,extendedDescription varchar(240) null
  ,notes text null
  ,UPC char(12) null
  ,retailPrice money null
  ,usePrice money null
  ,inventoryPart bit not null
  ,lastUpdated timestamp
  );

Create Table "Materials.PartsCategory" (
  CategoryID serial primary key not null
  ,parentCategoryID int null
  ,CategoryName varchar(40) not null
  ,CategoryShortName varchar(30) not null
);

CREATE TABLE "Materials.PartsPriceHistory" (
  rowID serial PRIMARY KEY Not Null
  ,partID int not null
  ,retailPrice money null
  ,usePrice money null
  ,lastChanged timestamp not null
  );

