CREATE DATABASE BIDA_Project7;
GO

USE BIDA_Project7;
GO


CREATE TABLE Dishes(
	[DishID] INT NOT NULL PRIMARY KEY, 
    [DishName] TEXT NOT NULL, 
    [Price] MONEY NOT NULL);

CREATE TABLE DishIngredient(
 	[DishIngredientID] INT NOT NULL PRIMARY KEY, 
    [DishID] INT NOT NULL, 
    [IngredientID] INT NOT NULL, 
    [Amount] TEXT NOT NULL);

CREATE TABLE Employees(
	[EmployeeID] INT NOT NULL PRIMARY KEY, 
    [FirstName] TEXT NOT NULL, 
    [LastName] TEXT NOT NULL, 
    [Type] TEXT NOT NULL, 
    [StoreID] INT NOT NULL);

CREATE TABLE Ingredients(
 	[IngredientID] INT NOT NULL PRIMARY KEY, 
    [SupplierID] INT NOT NULL, 
    [IngredientName] TEXT NOT NULL);

CREATE TABLE Orders(
	[OrderID] INT NOT NULL PRIMARY KEY, 
    [StoreID] INT NOT NULL, 
    [OrderDate] TEXT NOT NULL, 
    [DishID] INT NOT NULL, 
    [Tax] NUMERIC(8,2) NOT NULL, 
    [Tip] NUMERIC(8,2) NOT NULL, 
    [Total] NUMERIC(8,2) NOT NULL);

CREATE TABLE Stores(
	[StoreID] INT NOT NULL PRIMARY KEY, 
    [ManagerFirstName] TEXT NOT NULL, 
    [ManagerLastName] TEXT NOT NULL,
	[Address] TEXT NOT NULL, 
    [PhoneNumber] TEXT NOT NULL, 
    [Capacity] INT NOT NULL);

CREATE TABLE Suppliers(
	[SupplierID] INT NOT NULL PRIMARY KEY, 
    [SupplierName] TEXT NOT NULL, 
    [StoreID] INT NOT NULL, 
    [PhoneNumber] TEXT NOT NULL, 
    [Address] TEXT NOT NULL);


ALTER TABLE DishIngredient ADD CONSTRAINT FK_DI1
FOREIGN KEY (DishID) REFERENCES Dishes(DishID);

ALTER TABLE DishIngredient ADD CONSTRAINT FK_DI2
FOREIGN KEY (IngredientID) REFERENCES Ingredients(IngredientID);

ALTER TABLE Employees ADD CONSTRAINT FK_Store_Employee
FOREIGN KEY (StoreID) REFERENCES Stores(StoreID);

ALTER TABLE Ingredients ADD CONSTRAINT FK_Supplier_Ingredient
FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID);

ALTER TABLE Orders ADD CONSTRAINT FK_Store_Order
FOREIGN KEY (StoreID) REFERENCES Stores(StoreID);

ALTER TABLE Orders ADD CONSTRAINT FK_Dish_Order
FOREIGN KEY (DishID) REFERENCES Dishes(DishID);

ALTER TABLE Suppliers ADD CONSTRAINT FK_Store_Supplier
FOREIGN KEY (StoreID) REFERENCES Stores(StoreID);
GO


INSERT INTO Dishes (DishID, DishName, Price) VALUES 
(1, 'Chicken Alfredo', $20.00),
(2, 'Meat Lasagna', $15.00),
(3, 'Spaghetti and Meatballs', $25.00),
(4, 'Shrimp Scampi', $25.00),
(5, 'Cheese Cannoli', $5.00),
(6, 'Pasta Putanesca', $25.00),
(7, 'Penne a la mode', $25.00),
(8, 'French Fries', $5.00),
(9, 'Polenta', $10.00),
(10, 'Vegetable Ravioli', $15.00);

INSERT INTO DishIngredient(DishIngredientID, DishID, IngredientID, Amount) VALUES 
(1, 1, 2, '1/4 cup'),
(2, 3, 2, '1/2 cup'),
(3, 5, 1, '1/3 cup'),
(4, 6, 2, '1/2 cup'),
(5, 8, 3, '1/4 cup'),
(6, 3, 7, '1/5 cup'),
(7, 5, 2, '1 cup'),
(8, 3, 4, '1/4 cup'),
(9, 1, 5, '1/6 cup'),
(10, 9, 1, '1/5 cup');

INSERT INTO Employees(EmployeeID, FirstName, LastName, Type, StoreID) VALUES 
(1, 'Mark', 'Summers', 'Waiter', 1),
(2, 'John', 'Malkovich', 'Manager', 1),
(3, 'Susan', 'Athas', 'Waitress', 2),
(4, 'Emily', 'Sousa', 'Chef', 2),
(5, 'Jason', 'Kraft', 'Waiter', 3),
(6, 'Alexander', 'Hubik', 'Chef', 3),
(7, 'Lily', 'Evans', 'Manager', 4),
(8, 'Alice', 'Romanov', 'Chef', 4),
(9, 'Mary', 'Elcott', 'Chef', 3),
(10, 'Brian', 'Cronin', 'Waiter', 4);

INSERT INTO Ingredients(IngredientID, SupplierID, IngredientName) VALUES 
(1, 1, 'Mozarella Cheese'),
(2, 1, 'Tomato'),
(3, 2, 'Pasta Dough'),
(4, 2, 'Pizza Dough'),
(5, 3, 'Basil'),
(6, 3, 'Pepper'),
(7, 4, 'Ricotta Cheese'),
(8, 4, 'Paprika'),
(9, 5, 'Chicken'),
(10, 5, 'Beef');

INSERT INTO Orders(OrderID, StoreID, OrderDate, DishID, Tax, Tip, Total) VALUES 
(1, 2, '03/11/2008', 4, 5.21, 3.12, 24.18),
(2, 4, '03/13/2008', 3, 3.11, 0, 18.47),
(3, 3, '03/16/2008', 5, 1.10, 5.13, 30.58),
(4, 1, '03/16/2008', 1, 8.29, 2.46, 50.11),
(5, 1, '03/22/2008', 1, 2.94, 0, 30.93),
(6, 2, '03/22/2008', 1, 7.36, 2.57, 24.32),
(7, 4, '03/27/2008', 1, 2.21, 6.34, 14.21),
(8, 3, '04/02/2008', 1, 2.14, 5.42, 24.35),
(9, 4, '04/13/2008', 1, 9.45, 2.25, 50.42),
(10, 5, '04/13/2008', 1, 3.74, 2.16, 53.21);

INSERT INTO Stores(StoreID, ManagerFirstName, ManagerLastName, Address, PhoneNumber, Capacity) VALUES 
(1, 'John', 'Fitzpatrick', '72 Laura Boulevard', '781-347-4821', 87),
(2, 'Martha', 'Bowen', '81 Martin Street', '781-378-4328', 36),
(3, 'Luigi', 'Falcone', '113 Waterfall Road', '781-395-8379', 27),
(4, 'Antonio', 'Rizolli', '100 Main Street', '781-289-2674', 51),
(5, 'Joe', 'Newman', '1873 Sailor Street', '781-398-1743', 191);

INSERT INTO Suppliers(SupplierID, SupplierName, StoreID, PhoneNumber, Address) VALUES 
(1, 'Local Market', 1, '781-374-2638', '812 North Street'),
(2, 'Hanks Fish Emporium', 2, '781-332-2728', '23 Weston Road'),
(3, 'Walmart', 3, '781-924-9217', '74 Kingsley Ave'),
(4, 'Whole Foods', 4, '781-984-2573', '11 Ronan Street'),
(5, 'Sunset Farms', 5, '781-985-2947', '29 Knight Street');
