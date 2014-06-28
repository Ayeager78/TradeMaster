CREATE TABLE "Employees.Employee" (
  EmployeeID serial PRIMARY KEY not null
  ,FirstName varchar(30) not null
  ,MiddleName varchar(30) null
  ,LastName varchar(50) not null
  ,Salutation varchar(20) null
  ,Suffix varchar(15) null
  ,SocialSecurity char(9) not null
  ,BirthDate date not null
  ,StartDate date not null
  ,TerminationDate date null
  ,RehireEligible bit null
  ,LastUpdated timestamp not null
);

CREATE TABLE "Employees.Address" (
  EmployeeAddressID serial primary key not null
  ,EmployeeID int not null
  ,AddressTypeID int not null
  ,Address1 varchar(65) not null
  ,Address2 varchar(65) null
  ,City varchar(30) not null
  ,State char(2) not null
  ,ZipCode varchar(9) not null
);

CREATE TABLE "Employee.Phone" (
  EmployeePhoneID serial primary key not null
  ,EmployeeID int not null
  ,PhoneTypeID int not null
  ,CountryCode int not null
  ,AreaCityCode varchar(10) not null
  ,LocalNumber char(7) not null
  ,IsPrimary bit not null
  ,DeletedDate timestamp null
  ,LastUpdated timestamp null
);

Create Table "Employee.Email" (
  EmployeeEmailID serial primary key not null
  ,EmployeeID int not null
  ,EmailTypeID int not null
  ,EmailAddress varchar(50) not null
  ,IsDefault bit not null
  ,DeletedDate timestamp null
  ,LastUpdated timestamp not null
);

-- this is for things like "full-time, part time, contract etc..."
Create Table "Employee.PositionTypeLookup" (
  PositionTypeID serial primary key not null
  ,PositionTypeName varchar(25)
  ,PositionTypeShortName varchar(25)
  ,DeletedDate timestamp null
);

Create Table "Employee.Position" (
  PositionID serial PRIMARY KEY
  ,DepartmentID int not null
  ,PositionTypeID int not null
  ,Title varchar(50) not null
  ,ShortDescription varchar(120)
  ,JobDescription text null
  ,DeletedDate timestamp null
  ,LastUpdated timestamp not null
);

Create Table "Employee.PayTypeLookup" (
  PayTypeID serial PRIMARY KEY
  ,PayTypeShortName varchar(20) not null
  ,PayTypeName varchar(50)
  ,PayTypeDescription varchar(20)
);

Create Table "Employee.PayAndPosition" (
  RowID serial PRIMARY KEY not null
  ,PositionID int not null
  ,EmployeeID int not null
  ,PayTypeID int not null
  ,StartDate DATE not null
  ,EndDate Date null
  ,ReportsTo int not null
  ,CompensationAmount money not null
);

Create Table "Employee.LicenseCertAuthorityLookup" (
  LicenseCertAuthorityID serial Primary Key not null
  ,AuthorityName varchar(40) not null
  ,AuthorityShortName varchar(30) Not null
  ,DeletedDate timestamp null
);

Create Table "Employee.LicenseAndCertLookup" (
  LicenseCertID serial Primary Key Not null
  ,LicenseCertName varchar(40) not null
  ,LicenseCertShortName varchar(30) not null
  ,LicenseCertAuthorityID int not null
  ,LicenseCertDescription varchar(80) null
  ,DeletedDate TimeStamp null
  ,Active bit not null
);

Create Table "Employee.LicenseAndCert" (
  RowID serial PRIMARY KEY not null
  ,EmployeeID int not null
  ,LicenseCertID int not null
  ,EmployeeLicenseCertNumber varchar(30) null
  ,IssueDate date null
  ,ExpireDate date null
  ,LastUpdated timestamp not null
  ,DeletedDate timestamp null
);

Create Table "Employee.EmergencyContact" (
  RowID serial Primary Key NOT NULL
  ,EmployeeID int not null
  ,FirstName varchar(30) null
  ,LastName varchar(50) null
  ,RelationshipID int null
  ,PrimaryPhoneID int null
  ,SecondaryPhoneID int null
  ,EmailID int null
  ,DeletedDate timestamp null
);