--script for adding Materials tables and test data to the Trademaster Database
use TradeMaster
go

--create schema Supplies;
--go

IF object_id('Supplies.Parts', 'U') is not null
	drop table Supplies.Parts

IF object_id('Supplies.PartsPriceHistory', 'U') is not null
	drop table Supplies.PartsPriceHistory

IF object_id('Supplies.Manufacturers', 'U') is not null
	drop table Supplies.Manufacturers

IF object_id('Supplies.lkp_Manufacturers', 'U') is not null
	drop table Supplies.lkp_Manufacturers



CREATE TABLE Supplies.Manufacturers ( 
							manufacturerID int primary key identity
                            ,name varchar(40) not null
							,standardDiscount decimal(5,4) null
							)
							
INSERT INTO Supplies.Manufacturers( name, standardDiscount )
	Values
		('Moen', .40)
		,('FluidMaster', null )
		,('Black Swan', null )
		,('Sioux Chief', null)

select * from Supplies.Manufacturers
		
CREATE TABLE Supplies.Parts (	
					partID int Identity not null
		            ,partNumOurs nvarchar(25) not null
					,manufacturerID int null
				    ,partNumMfg nvarchar(25) null
					,invoiceDescription nvarchar(80) not null
					,extendedDescription nvarchar(240) null
					,notes text null
					,UPC nchar(12) null					
					,retailPrice money null
					,usePrice money null
					,inventoryPart bit not null										
					--,lastUpdated rowversion not null					
					)

INSERT INTO Supplies.Parts ( partNumOurs, manufacturerID, partNumMfg, invoiceDescription, extendedDescription, notes, UPC, retailPrice, usePrice, inventoryPart )
	Values
		( 'fv400FM', 2, 'fv400', 'Fluidmaster 400 Tank type toilet fill valve', 'Standard tank type fill valve replacement part', null, null, 12.50, 7.50, 1)
		,( 'scTB4560', 4, '4560', 'Composite Toilet Bolt set', 'Soiux Chief Composite Plastic toilet bolt set 2-1/4', null, null, 1.35, null, 1 )
		,( 'BW35', 3, 'BW350', 'Wax ring : bowl to flange', 'Standard Bowl Wax without horn, 100% bees wax.', null, null, 1.65, null, 1 )
		; 

select * from Supplies.Parts

CREATE TABLE Supplies.PartsPriceHistory ( 
								rowID int identity
								,partID int not null
								,retailPrice money null
								,usePrice money null
								,dateChanged rowversion not null                                							 
								)
