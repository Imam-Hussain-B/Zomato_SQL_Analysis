# Zomato  SQL Analytics Project
 ## 🍽️ Overview
 This project demonstrates advanced SQL data analysis using a real-world Zomato restaurant dataset. It
 showcases relational schema design, data normalization, analytical queries, and business insights
 generation.
 This README provides comprehensive documentation for understanding the project architecture,
 queries, and implementation. It is tailored for academic projects, portfolios, or data analyst interviews.
# 🎯 Project Objectives

### 1. Data Modeling & Normalization
- Design a relational database schema using the principles of 3rd Normal Form (3NF) for the Zomato dataset.

- Separate composite and multi-valued attributes (e.g., cuisines) into appropriate junction tables for efficient querying.

### 2.Data Cleaning & Preparation

- Clean and transform the raw dataset using SQL or spreadsheet tools to ensure consistency, remove duplicates, and format boolean/numeric values.

### 3.Advanced SQL Query Development

- Write and optimize advanced SQL queries to extract business insights using:
- Aggregate functions (SUM, AVG, COUNT)
- Window functions (RANK, ROW_NUMBER, NTILE)
- Subqueries and Common Table Expressions (CTEs)
- JOINS across normalized tables

### 4. Real-world Business Problem Solving

- Analyze food trends, customer preferences, and pricing strategies using SQL.
- Address questions related to:

i) Top-rated restaurants by city
ii) Popular cuisines
iii) Delivery and booking patterns
iv) Location-based pricing and rating behavior

### 5.Performance & Best Practices

- Implement indexing strategies for large datasets.
- Structure queries for maintainability and performance optimization.
 ## 📊 Dataset Description

| Column                     | Description                                     |
|---------------------------|-------------------------------------------------|
| Restaurant ID             | Unique restaurant identifier                    |
| Restaurant Name           | Name of the restaurant                          |
| Country Code              | Country (mapped later to country name)         |
| City                      | City where the restaurant is located           |
| Address                   | Physical address                                |
| Locality                  | Local neighborhood                              |
| Locality Verbose          | More specific locality description              |
| Longitude & Latitude      | Geo-coordinates for mapping                     |
| Cuisines                  | Multi-cuisine info (to be normalized)           |
| Average Cost for Two      | Integer amount in local currency                |
| Currency                  | Currency name                                   |
| Has Table Booking         | Boolean flag                                    |
| Has Online Delivery       | Boolean flag                                    |
| Is Delivering Now         | Boolean flag                                    |
| Switch to Order Menu      | App redirection info                            |
| Price Range               | 1 to 4 pricing tier                             |
| Aggregate Rating          | Rating between 0 and 5                          |
| Rating Color              | UI color code                                   |
| Rating Text               | e.g., Excellent, Good, Poor                     |
| Votes                     | Number of ratings/votes                        |

---
## 📄 Schema Design

- Normalized using 3NF principles
- Separated into following tables:
  - restaurants
  - locations
  - cuisines
  - restaurant_cuisines (M:N junction)
  - pricing
  - ratings
  - services (table booking, online delivery)

Each table uses appropriate data types, foreign keys, and indexing.

---
 
## 🔍 Example Business Questions Answered

1. Top-rated restaurants by city and country
2. Most common cuisines by country
3. Online delivery restaurants with best ratings
4. Correlation between price range and rating
5. Detect cities with highest average spend
6. Which cuisine is most available for delivery?
7. Find missing/incomplete location records
8. Rating inconsistency (numeric vs text)
9. Cuisines with best and worst ratings
10. Detect high cost, low rated restaurants

All queries are documented and stored in `/sql/queries/`.

---
 
 ## 🌐 License
 This project is open for educational and personal learning purposes only. No copyrighted API or
 proprietary data is used.

## 🙏 Acknowledgements
- Dataset concept inspired by Zomato open data forums
- SQL schema modeled for academic and industry readiness

---

For contributions, suggestions, or improvements, feel free to raise an issue or fork the project. Happy querying! ✨

