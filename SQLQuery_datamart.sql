
USE Sales_dm
GO
CREATE TABLE Product_Dim
( [Product_Row_ID] smallint NOT NULL IDENTITY,
[Product_ID] nvarchar(50),
[Product_Name] varchar(max),
[Category_Row_ID] smallint,
[Category] nvarchar(50),
[Sub_Category] nvarchar(50),
PRIMARY KEY (Product_Row_ID));
GO


CREATE TABLE Customer_Dim
([Customer_Row_ID] smallint NOT NULL IDENTITY,
[Customer_ID] nvarchar(50),
[Customer_Name] nvarchar(50),
[Segment] nvarchar(50),
PRIMARY KEY (Customer_Row_ID));
GO

CREATE TABLE Location_Dim
([Location_Row_ID] smallint NOT NUll IDENTITY,
[Country] nvarchar(50),
[City] nvarchar(50),
[State] nvarchar(50),
[Postal_Code] int,
[Region] nvarchar(50),
PRIMARY KEY (Location_Row_ID));
GO

CREATE TABLE Shipping_Dim
([Shipping_Row_ID] smallint NOT NUll IDENTITY,
[Ship_Date] date,
[Ship_Mode] nvarchar(50),
PRIMARY KEY (Shipping_Row_ID));
GO

CREATE TABLE Order_Dim
([Order_Row_ID] smallint NOT NUll IDENTITY,
[Order_ID] nvarchar(50),
	[Order_Date] date ,
	[Sales] float,
PRIMARY KEY (Order_Row_ID));
GO

CREATE TABLE Calender_Dim
([Calender_Row_ID] smallint NOT NUll IDENTITY,
[Date] date,
	[Day] tinyint ,
	[Month] tinyint ,
	[Year] smallint,
PRIMARY KEY (Calender_Row_ID));
GO

CREATE TABLE Sales_Fact
(
[Product_Row_ID] smallint,
[Customer_Row_ID] smallint,
[Location_Row_ID] smallint,
[Shipping_Row_ID] smallint,
[Order_Row_ID] smallint,
[Category_Row_ID] smallint,
[Calender_Row_ID] smallint,
[Sales] float,
[Date] date,
[Region] nvarchar(50),
[Segment] nvarchar(50),
[Category] nvarchar(50),
PRIMARY KEY(Product_Row_ID),
FOREIGN KEY (Product_Row_ID) REFERENCES Product_Dim (Product_Row_ID),
FOREIGN KEY (Customer_Row_ID) REFERENCES Customer_Dim (Customer_Row_ID),
FOREIGN KEY (Location_Row_ID) REFERENCES Location_Dim (Location_Row_ID),
FOREIGN KEY (Shipping_Row_ID) REFERENCES Shipping_Dim (Shipping_Row_ID),
FOREIGN KEY (Order_Row_ID) REFERENCES  Order_Dim(Order_Row_ID),
FOREIGN KEY (Calender_Row_ID) REFERENCES Calender_Dim (Calender_Row_ID),

)
GO