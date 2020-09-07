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
	[DateKey] [date] NOT NULL,
	[FullDateAlternateKey] date not null,
	[DayNumberOfWeek] [int] NOT NULL,
	[DayNameOfWeek] [nvarchar](10) NOT NULL,
	[DayNumberOfMonth] [int] NOT NULL,
	[DayNumberOfYear] [int] NOT NULL,
	[WeekNumberOfYear] [int] NOT NULL,
	[MonthName] [nvarchar](10) NOT NULL,
	[MonthNumberOfYear] [int] NOT NULL,
	[CalendarQuarter] [int] NOT NULL,
	[CalendarYear] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
))WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
	[GeoKey] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](30) NULL,
	[StateProvinceCode] [nvarchar](3) NULL,
	[StateProvinceName] [nvarchar](50) NULL,
	[IsOnlyStateProvinceFlag] [int] NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[CountryRegionName] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](15) NULL,
	
PRIMARY KEY CLUSTERED 
(
	[GeoKey] ASC
))WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
	[ProductID] ASC
))WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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


CREATE TABLE [DimDepartment](
	[DepartmentID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
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
	[AddressLine1] [nvarchar](60) NOT NULL,
	[AddressLine2] [nvarchar](60) NULL,
	[EmailPromotion] [int] NOT NULL,
	[DepartmentID] [smallint] NOT NULL,
	[PhoneNumber] [nvarchar] NOT NULL,
	[PhoneNumberTypeID] int NOT NULL,
	[PhoneNoTypeName] [nvarchar] NOT NULL,
	[GeoKey] [int] not null,
	[EmailAddress] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[MaritalStatus] [nchar](1) NULL,
	[Gender] [nvarchar](1) NULL,
	primary key ([EmployeeID])
	)
	Go

ALTER TABLE [dbo].[DimEmployee]  WITH CHECK ADD  CONSTRAINT [FK_DimDate] FOREIGN KEY([BirthDate])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[DimEmployee]  WITH CHECK ADD  CONSTRAINT [FK_DimDate1] FOREIGN KEY([HireDate])
REFERENCES [dbo].[DimDate] ([DateKey])
GO

ALTER TABLE [dbo].[DimEmployee]  WITH CHECK ADD  CONSTRAINT [FK_DimDepartment] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[DimDepartment] ([DepartmentID])
GO
ALTER TABLE [dbo].[DimEmployee]  WITH CHECK ADD  CONSTRAINT [FK_DimGeography] FOREIGN KEY([GeoKey])
REFERENCES [dbo].[DimGeography] ([GeoKey])
GO
---------------------------------------




--------------------------------


CREATE TABLE [dbo].[DimVendors](
	[VendorKey] [int]  NOT NULL,
	[AccountNumber] [varchar](15) NOT NULL,
	[VendorName] [varchar](50) NOT NULL,
	[CreditRating] [int] NOT NULL,
	[PreferredVendorStatus] [varchar](1) NOT NULL,
	[ActiveFlag] [varchar](1) NOT NULL,
	[PurchasingWebServiceURL] [varchar](1024) NULL,
	[AddressTypeName] [varchar](50) NOT NULL,
	[AddressLine1] [varchar](60) NOT NULL,
	[AddressLine2] [varchar](60) NULL,
	[GeoKey] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[VendorKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DimVendors]  WITH CHECK ADD  CONSTRAINT [FK_DimGeography1] FOREIGN KEY([GeoKey])
REFERENCES [dbo].[DimGeography] ([GeoKey])
GO


---------------------------------------------
CREATE TABLE [DimContactType](
	[ContactTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[VendorKey] int not null,
 CONSTRAINT [PK_ContactType_ContactTypeID] PRIMARY KEY CLUSTERED 
(
	[ContactTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimContactType]  WITH CHECK ADD  CONSTRAINT [FK_VendorKey] FOREIGN KEY([VendorKey])
REFERENCES [dbo].[DimVendors] ([VendorKey])
GO
-----------------------------------------------------

CREATE TABLE [dbo].[DimProductVendor](
	[ProductVendorKey] [int] IDENTITY(1,1) NOT NULL,
	[VendorKey] [int] NULL,
	[ProductID] [int] NOT NULL,
	[AverageLeadTime] [int] NOT NULL,
	[StandardPrice] [numeric](15, 2) NOT NULL,
	[LastReceiptCost] [numeric](15, 2) NULL,
	[LastReceiptDateSK] [int] NULL,
	[LastReceiptDate] [datetime] NULL,
	[MinOrderQty] [int] NOT NULL,
	[MaxOrderQty] [int] NOT NULL,
	[OnOrderQty] [int] NULL,
	[UnitMeasureCode] [nchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductVendorKey] ASC
),
CONSTRAINT [FK_VendorSK] FOREIGN KEY([VendorKey])
REFERENCES [dbo].[DimVendors] ([VendorKey]),
CONSTRAINT [FK_ProductPurchasedKey] FOREIGN KEY([ProductID])
REFERENCES [dbo].[DimProducts_Purchased] ([ProductID]),

)
GO




USE [AW_Purchasing_DW]
GO

/****** Object:  Table [dbo].[DimShipMethod]    Script Date: 6/1/2020 5:23:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimShipMethod](
	[ShipMethodID] [int] NOT NULL,
	[ShipMethodName] [nvarchar](50) NOT NULL,
	[ShipBase] [numeric](15, 2) NOT NULL,
	[ShipRate] [numeric](15, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShipMethodID] ASC
))WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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

create table FactPurchase(
[PurchaseOrderID] INT IDENTITY(1,1) NOT NULL,
[DueDate] DATE NOT NULL,
[OrderQty] SMALLINT NOT NULL,
[ProductID] INT NOT NULL,
[UnitPrice] FLOAT NOT NULL,
[ReceivedQty] DECIMAL NOT NULL,
[RejectedQty] DECIMAL NOT NULL,
[StockedQty] INT NOT NULL,
[RevisionNumber] INT NOT NULL,
[Status] TINYINT NOT NULL,
[EmployeeID] INT NOT NULL,
[ShipMethodID] INT NOT NULL,
[OrderDate] DATE NOT NULL,
[ShipDate] DATE NOT NULL,
[VendorKey] INT NOT NULL,

PRIMARY KEY([PurchaseOrderID]))
GO
ALTER TABLE [dbo].FactPurchase  WITH CHECK ADD  CONSTRAINT [FK_DueDte] FOREIGN KEY ([DueDate])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].FactPurchase  WITH CHECK ADD  CONSTRAINT [FK_OrderDate] FOREIGN KEY ([OrderDate])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].FactPurchase  WITH CHECK ADD  CONSTRAINT [FK_ShipDate] FOREIGN KEY ([ShipDate])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].FactPurchase  WITH CHECK ADD  CONSTRAINT [FK_EmployeeID] FOREIGN KEY ([EmployeeID])
REFERENCES [dbo].[DimEmployee] ([EmployeeID])
GO
ALTER TABLE [dbo].FactPurchase  WITH CHECK ADD  CONSTRAINT [FK_DimVendors] FOREIGN KEY ([VendorKey])
REFERENCES [dbo].[DimVendors] ([VendorKey])
GO
ALTER TABLE [dbo].FactPurchase  WITH CHECK ADD  CONSTRAINT [FK_DimShipMethod] FOREIGN KEY ([ShipMethodID])
REFERENCES [dbo].[DimShipMethod] ([ShipMethodID])
GO

ALTER TABLE [dbo].FactPurchase  WITH CHECK ADD  CONSTRAINT [FK_ProductPurchasedSK1] FOREIGN KEY ([ProductID])
REFERENCES [dbo].[DimProducts_Purchased] ([ProductID])
GO