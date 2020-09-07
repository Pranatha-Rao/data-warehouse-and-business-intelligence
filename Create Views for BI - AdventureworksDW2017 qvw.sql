/****** Create Views for BI   Script ******/
-- rick sherman
-- Modified : 2020-05-14

USE AdventureWorksDW2017;
GO

select * from DimCurrency_qvw;


select * from FactInternetSales

select * from DimGeography_qvw;


create view DimCurrency_qvw
as
SELECT
  CurrencyKey
 ,CurrencyAlternateKey
 --,CurrencyName
FROM DimCurrency
GO

create VIEW DimSalesTerritory_gvw
as
SELECT
  SalesTerritoryKey
 --,SalesTerritoryAlternateKey
 ,SalesTerritoryRegion
 ,SalesTerritoryCountry
 ,SalesTerritoryGroup
 --,SalesTerritoryImage
FROM DimSalesTerritory
GO

create view DimEmployee_qvw
as
SELECT
  EmployeeKey
 ,ParentEmployeeKey
 ,EmployeeNationalIDAlternateKey
 ,ParentEmployeeNationalIDAlternateKey
-- ,SalesTerritoryKey
 ,LastName + ', ' + FirstName as EmployeeName
 ,FirstName
 ,LastName
 ,MiddleName
 ,NameStyle
 ,Title
 ,HireDate
 ,BirthDate
 --,LoginID
 --,EmailAddress
 --,Phone
 ,MaritalStatus
-- ,EmergencyContactName
-- ,EmergencyContactPhone
 ,SalariedFlag
 ,Gender
 ,PayFrequency
 ,BaseRate
 ,VacationHours
 ,SickLeaveHours
 ,CurrentFlag
 ,SalesPersonFlag
 ,DepartmentName
 ,StartDate
 ,EndDate
 ,Status
-- ,EmployeePhoto
FROM DimEmployee
GO

create view DimProduct_qvw
as
SELECT
  ProductKey
 --,ProductAlternateKey
 ,pro.ProductSubcategoryKey
 --,sub.ProductSubcategoryAlternateKey
 ,sub.ProductCategoryKey
 --,ProductCategoryAlternateKey
  ,EnglishProductName as ProductName
  ,EnglishDescription as ProductDescription
  ,EnglishProductSubcategoryName as ProductSubcategory
  ,EnglishProductCategoryName as ProductCategory
  ,ModelName as ProductModel
  ,ProductLine
 ,WeightUnitMeasureCode
 ,SizeUnitMeasureCode
 ,StandardCost
 ,FinishedGoodsFlag
 ,Color
 ,SafetyStockLevel
 ,ReorderPoint
 ,ListPrice
 ,[Size]
 ,SizeRange
 ,Weight
 ,DaysToManufacture
 ,DealerPrice
 ,Class
 ,Style
 --,LargePhoto
 ,StartDate as ProductStartDate
 ,EndDate as ProductEndDate
 ,Status as ProductStatus
FROM DimProduct pro
left outer join DimProductSubcategory sub
on pro.ProductSubcategoryKey = sub.ProductSubcategoryKey
left outer join DimProductCategory cat
on sub.ProductCategoryKey = cat.ProductCategoryKey
GO

create view DimPromotion_qvw
as
SELECT
  PromotionKey
 --,PromotionAlternateKey
 ,EnglishPromotionName as PromotionName
 ,DiscountPct
 ,EnglishPromotionType as PromotionType
 ,EnglishPromotionCategory as PromotionCategory
 ,StartDate as PromotionStartDate
 ,EndDate as PromotionEndDate
 ,MinQty
 ,MaxQty
FROM DimPromotion
GO

create view DimGeography_qvw
as
SELECT GeographyKey,
       City,
       StateProvinceCode,
       StateProvinceName as StateProvince,
       CountryRegionCode,
       EnglishCountryRegionName as CountryRegion,
       PostalCode,
       SalesTerritoryKey
      -- IpAddressLocator
  FROM DimGeography
GO


create view DimReseller_qvw
as
SELECT  
  ResellerKey
 ,GeographyKey
 --,ResellerAlternateKey
 --,Phone
 ,BusinessType
 ,ResellerName
 ,NumberEmployees
 ,OrderFrequency
 ,OrderMonth
 ,FirstOrderYear
 ,LastOrderYear
 ,ProductLine
 ,AddressLine1
 ,AddressLine2
 ,AnnualSales
 ,BankName
 ,MinPaymentType
 ,MinPaymentAmount
 ,AnnualRevenue
 ,YearOpened
FROM DimReseller
GO


create view DimCustomer_qvw
as
SELECT
  CustomerKey
 ,GeographyKey
 --,CustomerAlternateKey
  ,LastName + ', ' + FirstName as CustomerName
 ,Title
 ,FirstName
 ,MiddleName
 ,LastName
 ,NameStyle
 ,BirthDate
 ,MaritalStatus
 ,Suffix
 ,Gender
 --,EmailAddress
 ,YearlyIncome
 ,TotalChildren
 ,NumberChildrenAtHome
 ,EnglishEducation as Education
 ,EnglishOccupation as Occupation
 ,HouseOwnerFlag
 ,NumberCarsOwned
 ,AddressLine1
 ,AddressLine2
 --,Phone
 ,DateFirstPurchase
 ,CommuteDistance
FROM DimCustomer
GO

Create View DimShipDate_qvw
as
SELECT
  DateKey as ShipDateKey
 ,FullDateAlternateKey as ShipDate
 ,DayNumberOfWeek as Ship_DayNumberOfWeek
 ,EnglishDayNameOfWeek as Ship_DayNameOfWeek
 ,DayNumberOfMonth as Ship_DayNumberOfMonth
 ,DayNumberOfYear as Ship_DayNumberOfYear
 ,WeekNumberOfYear Ship_WeekNumberOfYear
 ,EnglishMonthName as  Ship_MonthName
 ,MonthNumberOfYear as Ship_Month
 ,CalendarQuarter as Ship_Quarter
 ,CalendarYear as Ship_Year
-- ,CalendarSemester 
 --,FiscalQuarter
 --,FiscalYear
-- ,FiscalSemester
FROM DimDate
GO

Create View DimOrderDate_qvw
as
SELECT
  DateKey as OrderDateKey
 ,FullDateAlternateKey as OrderDate
 ,DayNumberOfWeek as Order_DayNumberOfWeek
 ,EnglishDayNameOfWeek as Order_DayNameOfWeek
 ,DayNumberOfMonth as Order_DayNumberOfMonth
 ,DayNumberOfYear as Order_DayNumberOfYear
 ,WeekNumberOfYear Order_WeekNumberOfYear
 ,EnglishMonthName as  Order_MonthName
 ,MonthNumberOfYear as Order_Month
 ,CalendarQuarter as Order_Quarter
 ,CalendarYear as Order_Year
-- ,CalendarSemester 
 --,FiscalQuarter
 --,FiscalYear
-- ,FiscalSemester
FROM DimDate
GO

Create View DimDueDate_qvw
as
SELECT
  DateKey as DueDateKey
 ,FullDateAlternateKey as DueDate
 ,DayNumberOfWeek as Due_DayNumberOfWeek
 ,EnglishDayNameOfWeek as Due_DayNameOfWeek
 ,DayNumberOfMonth as Due_DayNumberOfMonth
 ,DayNumberOfYear as Due_DayNumberOfYear
 ,WeekNumberOfYear Due_WeekNumberOfYear
 ,EnglishMonthName as  Due_MonthName
 ,MonthNumberOfYear as Due_Month
 ,CalendarQuarter as Due_Quarter
 ,CalendarYear as Due_Year
-- ,CalendarSemester 
 --,FiscalQuarter
 --,FiscalYear
-- ,FiscalSemester
FROM DimDate
GO

Create View DimDate_qvw
as
SELECT
  DateKey as DateKey
 ,FullDateAlternateKey as FullDate
 ,DayNumberOfWeek 
 ,EnglishDayNameOfWeek as DayNameOfWeek
 ,DayNumberOfMonth 
 ,DayNumberOfYear 
 ,WeekNumberOfYear 
 ,EnglishMonthName as  MonthName
 ,MonthNumberOfYear as Month
 ,CalendarQuarter as Quarter
 ,CalendarYear as Year
-- ,CalendarSemester 
 --,FiscalQuarter
 --,FiscalYear
-- ,FiscalSemester
FROM DimDate
GO

create view FactInternetSales_qvw
as

SELECT
  ProductKey
 ,OrderDateKey
 ,DueDateKey
 ,ShipDateKey
 ,CustomerKey
 ,PromotionKey
 ,CurrencyKey
-- ,SalesTerritoryKey
,SalesOrderNumber
,SalesOrderLineNumber
-- ,RevisionNumber
 ,OrderQuantity
-- ,UnitPrice
 ,ExtendedAmount
-- ,UnitPriceDiscountPct
 ,DiscountAmount
-- ,ProductStandardCost
 ,TotalProductCost
 ,SalesAmount
 ,TaxAmt
 ,Freight
 -- ,CarrierTrackingNumber
 -- ,CustomerPONumber
 ,OrderDate
 ,DueDate
 ,ShipDate
FROM FactInternetSales
GO

create VIEW FactResellerSales_qvw
as
SELECT
  ProductKey
 ,OrderDateKey
 ,DueDateKey
 ,ShipDateKey
 ,ResellerKey
 ,EmployeeKey
 ,PromotionKey
 ,CurrencyKey
 --,SalesTerritoryKey
,SalesOrderNumber
,SalesOrderLineNumber
--,RevisionNumber
 ,OrderQuantity
 --,UnitPrice
 ,ExtendedAmount
 ,UnitPriceDiscountPct
 ,DiscountAmount
 --,ProductStandardCost
 ,TotalProductCost
 ,SalesAmount
 ,TaxAmt
 ,Freight
-- ,CarrierTrackingNumber
--,CustomerPONumber
 ,OrderDate
 ,DueDate
 ,ShipDate
FROM FactResellerSales
GO



create view FactTotalSales_qvw
as

SELECT
  ProductKey
 ,OrderDateKey
 ,DueDateKey
 ,ShipDateKey
 ,'Internet' as Channel
 ,CustomerKey as SoldToKey
 ,CustomerKey
 ,NULL as ResellerKey
 ,NULL as EmployeeKey
 ,PromotionKey
 ,CurrencyKey
-- ,SalesTerritoryKey
 ,SalesOrderNumber
 ,SalesOrderLineNumber
 ,RevisionNumber
 ,OrderQuantity
 ,UnitPrice
 ,ExtendedAmount
 --,UnitPriceDiscountPct
 ,DiscountAmount
-- ,ProductStandardCost
 ,TotalProductCost
 ,SalesAmount
 ,TaxAmt
 ,Freight
 --,CarrierTrackingNumber
 --,CustomerPONumber
 ,OrderDate
 ,DueDate
 ,ShipDate
FROM FactInternetSales

union

SELECT
  ProductKey
 ,OrderDateKey
 ,DueDateKey
 ,ShipDateKey
 ,'Reseller'  as Channel
 ,ResellerKey as SoldToKey
 ,NULL        as CustomerKey   
 ,ResellerKey
 ,EmployeeKey
 ,PromotionKey
 ,CurrencyKey
-- ,SalesTerritoryKey
 ,SalesOrderNumber
 ,SalesOrderLineNumber
 ,RevisionNumber
 ,OrderQuantity
 ,UnitPrice
 ,ExtendedAmount
 --,UnitPriceDiscountPct
 ,DiscountAmount
-- ,ProductStandardCost
 ,TotalProductCost
 ,SalesAmount
 ,TaxAmt
 ,Freight
-- ,CarrierTrackingNumber
-- ,CustomerPONumber
 ,OrderDate
 ,DueDate
 ,ShipDate
FROM  FactResellerSales
;

create view DimSoldTo_qvw
as
SELECT CustomerKey as SoldToKey
       ,'Person' as SoldToType
       ,case when MiddleName is null then  LastName + ', ' + FirstName
             else LastName + ', ' + FirstName + ' ' + MiddleName
             end as SoldToName
    ,GeographyKey
FROM DimCustomer
union
SELECT ResellerKey as SoldToKey
      ,'Reseller' as SoldToType
     , ResellerName  as SoldToName
   ,GeographyKey
FROM DimReseller
;
