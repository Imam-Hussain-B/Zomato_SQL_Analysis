# Zomato Advanced SQL Analytics Project

## 🍽️ Overview
This project demonstrates advanced SQL data analysis using a real-world Zomato restaurant dataset. It showcases relational schema design, data normalization, analytical queries, and business insights generation.

This README provides comprehensive documentation for understanding the project architecture, queries, and implementation. It is tailored for academic projects, portfolios, or data analyst interviews.

---

## 💡 Objectives

- Normalize and model Zomato's restaurant metadata using SQL.
- Answer real-world business questions using advanced SQL queries.
- Perform exploratory data analysis using filtering, grouping, joins, and window functions.
- Visualize the insights using BI tools (optional extension).

---

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

## 📂 Project Structure

```
zomato-sql-analysis/
├── data/                  # Cleaned dataset files (CSV)
├── sql/
│   ├── schema.sql         # Table creation and normalization
│   ├── inserts.sql        # Dummy data insertion
│   └── queries/           # Analytical queries (15+)
├── docs/
│   ├── ERD.png            # Entity-Relationship Diagram
│   └── problem_statements.md
├── notebooks/             # Optional Excel or Jupyter files
└── README.md              # Project documentation
```

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

## 🌐 How to Use

1. Clone the repository:
```bash
git clone https://github.com/yourusername/zomato-sql-analysis.git
cd zomato-sql-analysis
```

2. Set up MySQL or PostgreSQL and import schema:
```sql
source sql/schema.sql;
source sql/inserts.sql;
```

3. Run analytical queries:
```sql
source sql/queries/query1_top_rated.sql;
```

4. (Optional) Load CSVs into Excel or BI tools for visualization.

---

## 🚀 Future Work

- Add stored procedures and views
- Integrate with Power BI or Tableau dashboards
- Perform sentiment analysis on review data
- Build a web UI for interactive analysis

---

## 🌐 License
This project is open for educational and personal learning purposes only. No copyrighted API or proprietary data is used.

---

## 🙏 Acknowledgements
- Dataset concept inspired by Zomato open data forums
- SQL schema modeled for academic and industry readiness

---

For contributions, suggestions, or improvements, feel free to raise an issue or fork the project. Happy querying! ✨

