# 🛍️ Customer Feedback Analysis – E-commerce Data Integration & Insights

## 📌 Project Overview
This project analyzes **customer feedback and product performance** for an e-commerce company by integrating data from multiple sources (CSV, JSON, XML) into a relational database.  
It covers **data parsing**, **cleaning**, **integration**, **SQL-based analysis**, and **visualization**.

---

## 📂 Repository Structure

Customer_Feedback_Analysis/

│── ERD.png # Entity–Relationship Diagram

│── SQLQuery.sql # SQL scripts for database creation & analysis

│── Final project Report-Afnan Madi.pdf # Full project report

│── Data parsing scripts.pdf # Data parsing documentation

│── Customer Feedback Analysis Presentation.pptx # Project presentation



---

## 🛠️ Tools & Technologies
- **Python** (CSV, JSON, XML parsing – `pandas`, `json`, `xml.etree.ElementTree`)
- **SQL Server / MySQL** for database design, queries, and optimization
- **PowerPoint** for presentation
- **Draw.io** for ER diagram creation

---

## 🔍 Key Steps

### 1. Database Design
- Designed **Entity–Relationship Diagram (ERD)** for `Customers`, `Products`, and `Reviews`.
- Created normalized **relational schemas** with primary and foreign keys.

### 2. Data Parsing & Integration
- Parsed CSV, JSON, and XML datasets using Python scripts.
- Cleaned missing/invalid entries and enforced **referential integrity**.
- Loaded data into staging tables, then into final tables.

### 3. SQL Queries & Analysis
- **Top-rated products** by average rating.
- **Common complaints** based on keyword searches.
- **Sentiment classification** (Positive, Neutral, Negative) from ratings.
- **Trends over time** in reviews and ratings.

### 4. Insights & Recommendations
- Identified product categories with highest satisfaction.
- Highlighted recurring customer complaints for quality improvement.

---

## 🚀 How to Run the Project
```bash
# Clone the repository
git clone https://github.com/Afnanmadi/Customer-Feedback-Analysis-

# Navigate into the folder
cd Customer_Feedback_Analysis

# Review SQL scripts in your preferred database
# Example (MySQL):
mysql -u root -p < SQLQuery.sql



---
📜 License
This project is licensed under the MIT License.

✍️ Author
Afnan Madi
Business Intelligence Analyst | Data Enthusiast
LinkedIn | GitHub
