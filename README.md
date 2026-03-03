# 🛒 **Zepto SQL Data Analysis Project**

This is a complete **Data Analyst portfolio project** using a real-world e-commerce inventory dataset from **Zepto**, one of India’s fastest-growing quick-commerce startups.  
The project demonstrates **end-to-end SQL analysis**, from database setup and data cleaning to business insights and reporting.

---

## 📁 **Dataset Overview**

- Each row represents a unique **SKU (Stock Keeping Unit)**.  
- Columns include:  
  - **`sku_id`** – Unique identifier for each product  
  - **`category`** – Product category (Fruits, Beverages, Snacks, etc.)  
  - **`name`** – Product name  
  - **`mrp`** – Maximum Retail Price (converted from paise to ₹)  
  - **`discountPercent`** – Discount applied  
  - **`discountedSellingPrice`** – Price after discount  
  - **`availableQuantity`** – Units available  
  - **`weightInGms`** – Product weight in grams  
  - **`outOfStock`** – Boolean flag  
  - **`quantity`** – Units per package  

---

## 🔧 **Project Workflow**

1. **Database & Table Creation**  
   - Created PostgreSQL table `zepto` with proper data types for all columns.

2. **Data Import & Cleaning**  
   - Imported CSV dataset into PostgreSQL.  
   - Converted pricing from paise to rupees.  
   - Removed rows with zero MRP or discounted price.  

3. **Data Exploration & Analysis**  
   - Checked for null values and duplicates.  
   - Explored product categories and stock availability.  
   - Calculated top discounts, high-MRP products out of stock, and total inventory value.  

4. **Business Insights**  
   - Top 10 best-value products by discount.  
   - Products with MRP > ₹500 & minimal discount.  
   - Estimated revenue per category.  
   - Price per gram for products >100g.  
   - Grouped products by weight: **Low**, **Medium**, **Bulk**.  
   - Total inventory weight per category.

---

## 📊 **Sample SQL Queries**

```sql
-- Total revenue per category
SELECT category, SUM(discountedSellingPrice * availableQuantity) AS totalRevenue
FROM zepto
GROUP BY category
ORDER BY totalRevenue DESC;

-- Top 10 best-value products
SELECT name, discountPercent
FROM zepto
ORDER BY discountPercent DESC
```
---
## 🔧 **How to use**

Clone the repository

git clone
```
https://github.com/MarwanEssa2006/Zepto-SQL_Analysis
```
Open the SQL file in pgAdmin or any PostgreSQL client.

Create a database and run the SQL file to explore data and queries.

## 🔧 **👨‍💻 About the Author**
   - Marwan Essa – Data Analyst & Full-Stack Developer.  
   - LinkedIn: marwanessa-fullstack
   - GitHub: MarwanEssa2006





