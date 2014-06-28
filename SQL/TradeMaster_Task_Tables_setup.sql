Use TradeMaster
go

--create Schema FlatRate;
--go

IF object_id('FlatRate.Task', 'U') is not null
	drop table FlatRate.Task

IF object_id('FlatRate.TaskMaterials', 'U') is not null
	drop table FlatRate.TaskMaterials

IF object_id('FlatRate.TaskGroup', 'U') is not null
	drop table FlatRate.TaskGroup


create Table FlatRate.Task (
	taskID int Primary Key Identity
	,groupID int null
	,name varchar(30) not null
	,invoiceDescription varchar(120) not null
	,extendedDescription varchar(500) null
	,active bit not null
	,useMaterialHours bit not null
	,laborHours decimal(5,2) null
	,createDate datetime not null
	,lastUpdated rowversion not null
	)

INSERT INTO FlatRate.Task ( groupID, name, invoiceDescription, extendedDescription, active, useMaterialHours, laborHours, createDate )
	VALUES
		( 1, 'Pull and Reset Toilet', 'Standard pull and reset of toilet includes bowl wax and bolt repalcement', null, 1, 0, 1, getdate() )
		,( 1, 'Replace Fill Valve : Standard', 'Replace tank type Fill valve with Standard Fluidmaster', null, 1, 0, .5, getdate() )


Create Table FlatRate.TaskGroup (	
	groupID int Primary Key Identity
	,name varchar(40) not null
	,[description] varchar(240) null
	,notes varchar(500) null
	)

INSERT INTO FlatRate.TaskGroup ( name, [description], notes )
	VALUES
		('Toilet Repair', 'All Repairs associated with a toilet and its associated water supplies and mounting flanges', null)
		('Faucet Repair', 'Faucet Related Repairs including parts replacements'

Create Table FlatRate.TaskMaterials (	
	RowID int primary key identity
	,taskID int not null
	,partID int not null
	,qty int not null
	)

INSERT INTO FlatRate.TaskMaterials ( taskID, partID, qty )
	VALUES
		( 1, 2, 1)
		,(1, 3, 1)
		,(2, 1, 1)

select * from FlatRate.Task
select * from FlatRate.TaskGroup
select * from FlatRate.TaskMaterials