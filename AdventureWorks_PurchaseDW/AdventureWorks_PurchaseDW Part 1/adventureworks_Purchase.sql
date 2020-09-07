drop database [AW_Purchasing_DW];

create database [AW_Purchasing_DW];

USE [AW_Purchasing_DW]
GO

/****** Object:  Table [dbo].[DimDate]    Script Date: 6/1/2020 5:20:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[DimDate](
	[DateSK] [date] NOT NULL,
	[DayNumberOfWeek] [int] NOT NULL,
	[DayNameOfWeek] [nvarchar](10) NOT NULL,
	[DayNameOfWeekAbbr] [nvarchar](3) NOT NULL,
	[DayNumberOfMonth] [int] NOT NULL,
	[DayNumberOfYear] [int] NOT NULL,
	[WeekNumberOfYear] [int] NOT NULL,
	[MonthName] [nvarchar](10) NOT NULL,
	[MonthNameAbbr] [nvarchar](3) NOT NULL,
	[MonthNumberOfYear] [int] NOT NULL,
	[CalendarQuarter] [int] NOT NULL,
	[CalendarYear] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DateSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



USE [AW_Purchasing_DW]
GO

/****** Object:  Table [dbo].[DimGeography]    Script Date: 6/1/2020 5:22:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimGeography](
	[GeoSK] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](30) NULL,
	[StateProvinceCode] [nvarchar](3) NULL,
	[StateProvinceName] [nvarchar](50) NULL,
	[IsOnlyStateProvinceFlag] [int] NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[CountryRegionName] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](15) NULL,
	
PRIMARY KEY CLUSTERED 
(
	[GeoSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [AW_Purchasing_DW]
GO

/****** Object:  Table [dbo].[DimProducts_Purchased]    Script Date: 6/1/2020 5:22:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimProducts_Purchased](
	[ProductPurchasedSK] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductNumber] [varchar](25) NULL,
	[ProductName] [varchar](50) NULL,
	[ProductSubcategoryID] [int] NULL,
	[ProductSubcategoryName] [varchar](50) NULL,
	[ProductCategoryID] [int] NULL,
	[ProductCategoryName] [varchar](50) NULL,
	[ProductModelID] [int] NULL,
	[ModelName] [varchar](50) NULL,
	[FinishedGoodsFlag] [int] NULL,
	[MakeFlag] [int] NULL,
	[StandardCost] [numeric](15, 2) NULL,
	[ListPrice] [numeric](15, 2) NULL,
	[ProductLine] [char](2) NULL,
	[ProductClass] [char](2) NULL,
	[ProductStyle] [char](2) NULL,
	[WeightUnitMeasureCode] [char](3) NULL,
	[SizeUnitMeasureCode] [char](3) NULL,
	[ProductColor] [varchar](15) NULL,
	[SafetyStockLevel] [int] NULL,
	[ReorderPoint] [int] NULL,
	[ProductSize] [varchar](50) NULL,
	[ProductWeight] [numeric](15, 2) NULL,
	[DaysToManufacture] [int] NULL,
	[SellStartDate] [date] NULL,
	[SellEndDate] [date] NULL,
	[DiscontinuedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductPurchasedSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [AW_Purchasing_DW]
GO

/****** Object:  Table [dbo].[DimProductVendor]    Script Date: 6/1/2020 5:23:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-------------------------------------------
CREATE TABLE [DimContactType](
	[ContactTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ContactType_ContactTypeID] PRIMARY KEY CLUSTERED 
(
	[ContactTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-----------------------------------------------------


CREATE TABLE [DimDepartment](
	[DepartmentID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Department_DepartmentID] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
))
GO
-----------------------------------------------

CREATE TABLE [DimEmployee](
	[EmployeeID] [int] NOT NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Suffix] [nvarchar](10) NULL,
	[NationalIDNumber] [nvarchar](15) NOT NULL,
	[LoginID] [nvarchar](256) NOT NULL,
	[OrganizationNode] [hierarchyid] NULL,
	[OrganizationLevel]  AS ([OrganizationNode].[GetLevel]()),
	[JobTitle] [nvarchar](50) NOT NULL,
	[HireDate] [date] NOT NULL,
	[SalariedFlag] [smallint] NOT NULL,
	[Rate] [int] not null,
	[PayFrequency] [int] not null,
	[VacationHours] [smallint] NOT NULL,
	[SickLeaveHours] [smallint] NOT NULL,
	[CurrentFlag] [smallint] NOT NULL,
	[AddressLine1] [nvarchar](60) NOT NULL,
	[AddressLine2] [nvarchar](60) NULL,
	[EmailPromotion] [int] NOT NULL,
	[DepartmentID] [smallint] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[PhoneNumber] [nvarchar] NOT NULL,
	[PhoneNoTypeName] [nvarchar] NOT NULL,
	[GeoSK] [int] not null,
	[EmailAddress] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[MaritalStatus] [nchar](1) NULL,
	[Gender] [nvarchar](1) NULL,
	primary key ([EmployeeID])
	)
	Go

ALTER TABLE [dbo].[DimEmployee]  WITH CHECK ADD  CONSTRAINT [FK_DimDate] FOREIGN KEY([BirthDate])
REFERENCES [dbo].[DimDate] ([DateSK])
GO
ALTER TABLE [dbo].[DimEmployee]  WITH CHECK ADD  CONSTRAINT [FK_DimDate1] FOREIGN KEY([HireDate])
REFERENCES [dbo].[DimDate] ([DateSK])
GO
ALTER TABLE [dbo].[DimEmployee]  WITH CHECK ADD  CONSTRAINT [FK_DimDate2] FOREIGN KEY([StartDate])
REFERENCES [dbo].[DimDate] ([DateSK])
GO
ALTER TABLE [dbo].[DimEmployee]  WITH CHECK ADD  CONSTRAINT [FK_DimDate3] FOREIGN KEY([EndDate])
REFERENCES [dbo].[DimDate] ([DateSK])
GO
ALTER TABLE [dbo].[DimEmployee]  WITH CHECK ADD  CONSTRAINT [FK_DimDepartment] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[DimDepartment] ([DepartmentID])
GO
ALTER TABLE [dbo].[DimEmployee]  WITH CHECK ADD  CONSTRAINT [FK_DimGeography] FOREIGN KEY([GeoSK])
REFERENCES [dbo].[DimGeography] ([GeoSK])
GO
---------------------------------------


CREATE TABLE [DimBusinessEntityContact](
	[BusinessEntityID] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[ContactTypeID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimBusinessEntityContact]  WITH CHECK ADD  CONSTRAINT [FK_DimContactType] FOREIGN KEY([ContactTypeID])
REFERENCES [dbo].[DimContactType] ([ContactTypeID])
GO




--------------------------------


CREATE TABLE [dbo].[DimVendors](
	[VendorSK] [int] IDENTITY(1,1) NOT NULL,
	[BusinessEntityID] [int] NOT NULL,
	[AccountNumber] [varchar](15) NOT NULL,
	[VendorName] [varchar](50) NOT NULL,
	[CreditRating] [int] NOT NULL,
	[PreferredVendorStatus] [varchar](1) NOT NULL,
	[ActiveFlag] [varchar](1) NOT NULL,
	[PurchasingWebServiceURL] [varchar](1024) NULL,
	[AddressTypeName] [varchar](50) NOT NULL,
	[AddressLine1] [varchar](60) NOT NULL,
	[AddressLine2] [varchar](60) NULL,
	[GeoSK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[VendorSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DimVendors]  WITH CHECK ADD  CONSTRAINT [FK_DimGeography1] FOREIGN KEY([GeoSK])
REFERENCES [dbo].[DimGeography] ([GeoSK])
GO
ALTER TABLE [dbo].[DimVendors]  WITH CHECK ADD  CONSTRAINT [FK_DimBusinessEntityContact1] FOREIGN KEY([BusinessEntityID])
REFERENCES [dbo].[DimBusinessEntityContact] ([BusinessEntityID])
GO

---------------------------------------------


CREATE TABLE [dbo].[DimProductVendor](
	[ProductVendorSK] [int] IDENTITY(1,1) NOT NULL,
	[ProductPurchasedSK] [int] NULL,
	[VendorSK] [int] NULL,
	[ProductID] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
	[AverageLeadTime] [int] NOT NULL,
	[StandardPrice] [numeric](15, 2) NOT NULL,
	[LastReceiptCost] [numeric](15, 2) NULL,
	[LastReceiptDateSK] [int] NULL,
	[LastReceiptDate] [datetime] NULL,
	[MinOrderQty] [int] NOT NULL,
	[MaxOrderQty] [int] NOT NULL,
	[OnOrderQty] [int] NULL,
	[UnitMeasureCode] [nchar](3) NOT NULL,
	[DI_Modified_Date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductVendorSK] ASC
),
CONSTRAINT [FK_VendorSK] FOREIGN KEY([VendorSK])
REFERENCES [dbo].[DimVendors] ([VendorSK]),
CONSTRAINT [FK_ProductPurchasedSK] FOREIGN KEY([ProductPurchasedSK])
REFERENCES [dbo].[DimProducts_Purchased] ([ProductPurchasedSK]),

)
GO

ALTER TABLE [dbo].[DimProductVendor] ADD  DEFAULT (getdate()) FOR [DI_Modified_Date]
GO


USE [AW_Purchasing_DW]
GO

/****** Object:  Table [dbo].[DimShipMethod]    Script Date: 6/1/2020 5:23:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimShipMethod](
	[ShipMethodSK] [int] IDENTITY(1,1) NOT NULL,
	[ShipMethodID] [int] NOT NULL,
	[ShipMethodName] [nvarchar](50) NOT NULL,
	[ShipBase] [numeric](15, 2) NOT NULL,
	[ShipRate] [numeric](15, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShipMethodSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [AW_Purchasing_DW]
GO

/****** Object:  Table [dbo].[DimVendors]    Script Date: 6/1/2020 5:23:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------------
create table DimStore(
StoreID int not null,
StoreName Varchar(50) not null,
primary key(StoreID));

--------------------------------------------------------

create table FactPurchase(
[PurchaseOrderID] INT IDENTITY(1,1) NOT NULL,
[DueDate] DATE NOT NULL,
[OrderQty] SMALLINT NOT NULL,
[ProductPurchasedSK] INT NOT NULL,
[UnitPrice] FLOAT NOT NULL,
[LineTotal] INT NOT NULL,
[ReceivedQty] DECIMAL NOT NULL,
[RejectedQty] DECIMAL NOT NULL,
[StockedQty] INT NOT NULL,
[RevisionNumber] INT NOT NULL,
[Status] TINYINT NOT NULL,
[EmployeeID] INT NOT NULL,
ShipMethodSK INT NOT NULL,
[OrderDate] DATE NOT NULL,
[ShipDate] DATE NOT NULL,
[SubTotal] FLOAT NOT NULL,
[TaxAmt] FLOAT NOT NULL,
[Freight] FLOAT NOT NULL,
[TotalDue] FLOAT NOT NULL,
[VendorSK] INT NOT NULL,
StoreID int,
PRIMARY KEY([PurchaseOrderID]))
GO
ALTER TABLE [dbo].FactPurchase  WITH CHECK ADD  CONSTRAINT [FK_DueDte] FOREIGN KEY ([DueDate])
REFERENCES [dbo].[DimDate] ([DateSK])
GO
ALTER TABLE [dbo].FactPurchase  WITH CHECK ADD  CONSTRAINT [FK_OrderDate] FOREIGN KEY ([OrderDate])
REFERENCES [dbo].[DimDate] ([DateSK])
GO
ALTER TABLE [dbo].FactPurchase  WITH CHECK ADD  CONSTRAINT [FK_ShipDate] FOREIGN KEY ([ShipDate])
REFERENCES [dbo].[DimDate] ([DateSK])
GO
ALTER TABLE [dbo].FactPurchase  WITH CHECK ADD  CONSTRAINT [FK_EmployeeID] FOREIGN KEY ([EmployeeID])
REFERENCES [dbo].[DimEmployee] ([EmployeeID])
GO
ALTER TABLE [dbo].FactPurchase  WITH CHECK ADD  CONSTRAINT [FK_DimVendors] FOREIGN KEY ([VendorSK])
REFERENCES [dbo].[DimVendors] ([VendorSK])
GO
ALTER TABLE [dbo].FactPurchase  WITH CHECK ADD  CONSTRAINT [FK_DimShipMethod] FOREIGN KEY (ShipMethodSK)
REFERENCES [dbo].[DimShipMethod] (ShipMethodSK)
GO
ALTER TABLE [dbo].FactPurchase  WITH CHECK ADD  CONSTRAINT [FK_StoreID] FOREIGN KEY (StoreID)
REFERENCES [dbo].DimStore (StoreID)
GO
ALTER TABLE [dbo].FactPurchase  WITH CHECK ADD  CONSTRAINT [FK_ProductPurchasedSK1] FOREIGN KEY ([ProductPurchasedSK])
REFERENCES [dbo].[DimProducts_Purchased] ([ProductPurchasedSK])
GO