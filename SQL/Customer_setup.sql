Create Table "Company.Info" (
  CompanyID serial Primary Key not null
  ,LegalName varchar(80) null
  ,DBAName varchar(80) Not null
);

Create Table "Company.Branch" (
  BranchID serial Primary Key Not null
  ,BranchTypeID int not null
  ,BranchName varchar(50) Not null
  ,OpenDate date null
  ,CloseDate date null
);

Create Table "Compnay.Department" (
  DepartmentID serial Primary Key not null
  ,BranchID int null
  ,DepartmentName varchar(50)
);