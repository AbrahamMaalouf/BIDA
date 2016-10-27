use BIDA_Project7;

select *
from Dishes;

select *
from DishIngredient;

select *
from Employees;

select *
from Ingredients;

select *
from Orders;

select *
from Stores;

select *
from Suppliers;

/* We want to display all of the data */

select sum(Total) as "Sales"
from Orders
group by OrderID;

/* We want to show how much money the restaraunt made on each order */

select o.OrderID,
d.DishName
from Orders as o
join Dishes as d
on o.DishID = d.DishID;

/* We want to show what meal the customer ordered for each order */

select i.IngredientName, di.Amount
from Ingredients as i
left outer join DishIngredient as di
on i.IngredientID = di.IngredientID;

/* Left outer join is necessary because not every ingredient was used to make a dish, but we still want to see a full list of ingredients with their corresponding amounts (when applicable) */

select DishName, Price
	from Dishes
	where Price > (select avg(Price) as "Average Price"
					from dishes);

/* We want to show the dishes that have a price that is greater than the average dish price */
/* Abraham Maalouf, Anne McCormack */	