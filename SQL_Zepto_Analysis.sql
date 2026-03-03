drop table if exists zepto;

create table zepto (
sku_id SERIAL PRIMARY KEY,
category VARCHAR(150),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPrecent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOFstock BOOLEAN,
quantity INTEGER
);

select * from zepto;
select count(*) from zepto;


-- Know count of null values
select * from zepto
where name is null
or
category is null
or
mrp is null
or
discountPrecent is null
or
availableQuantity is null
or
discountedSellingPrice is null
or
weightInGms is null
or
outOFstock is null
or
quantity is null;

-- Explore category

select category from zepto
group by 1;

select distinct category
from zepto
order by 1;

--How many products are in stock and not

select count(name) , outOFstock
from zepto
group by 2;

-- product names present multiple times

select name , count(sku_id) 
from zepto
group by 1
having count(sku_id)>1
order by 2 desc;

--data cleaning 

select * from zepto
where mrp=0 or discountedSellingPrice =0 ;

delete from zepto where mrp=0;


update zepto 
set mrp=mrp/100.0,
discountedSellingPrice=discountedSellingPrice/100.0;

select mrp ,discountedSellingPrice from zepto;


-- Q1. Find the top 10 best-value products based on the discount percentage.
select distinct name,discountprecent from zepto
order by 2 desc
limit 10;

--Q2.What are the Products with High MRP but Out of Stock
select distinct name,mrp,outOFstock
from zepto
where outOFstock='yes' and mrp>300
order by mrp desc
limit 10;

--Q3.Calculate Estimated Revenue for each category
select distinct category,sum(discountedSellingPrice*availableQuantity) as totalRevenue
from zepto
group by 1
order by 2 desc;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
select distinct name,mrp,discountprecent
from zepto
where mrp>500 and discountprecent<10
order by mrp desc ,3 desc;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
select distinct category, avg(discountprecent) as avg_disc
from zepto
group by 1
order by 2 desc
limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
select distinct name,weightInGms,discountedSellingPrice,
round((discountedSellingPrice/weightInGms),2) as pricepergram
from zepto
where weightInGms>=100
order by 4 ;

--Q7.Group the products into categories like Low, Medium, Bulk.
select distinct name,weightInGms,
case when weightInGms<1000 then 'low'
	when weightInGms<5000 then 'medium'
	else 'bulk'
	end 
from zepto;

--Q8.What is the Total Inventory Weight Per Category 
select distinct category,sum(weightInGms*availableQuantity) as total_weight
from zepto
group by 1
order by 2 ;

