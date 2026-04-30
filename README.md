# java project
Core Java: The "FinSafe" Transaction Validator
Business Case: "FinSafe" is a digital wallet app. They are seeing an increase in "Overdraft" errors where users spend more than they have because the app processes transactions too slowly.
Problem Statement
Build a robust Transaction Processor that validates every "Spend" request against the user's current balance and logs every action for auditing purposes.
Student Tasks:
1.	Encapsulation: Create an Account class with private variables (balance, accountHolder).
2.	Custom Exception: Create a user-defined exception InSufficientFundsException.
3.	Validation Logic: Write a processTransaction(double amount) method.
○	If the amount is negative, throw an IllegalArgumentException.
○	If the amount > balance, throw your custom InSufficientFundsException.
4.	Transaction History: Store the last 5 successful transaction amounts in an ArrayList and provide a printMiniStatement() method.
Deliverable: A console-based Java application where a user can Deposit, Withdraw, and View History with full error handling.

# python project
Problem Statement: Smart Expense Tracker with Insights
Many individuals struggle to track daily expenses and understand spending patterns. Build a Python application that allows users to log, categorize, and analyze their expenses.
Objectives
●	Record daily expenses (date, category, amount, description)
●	Categorize spending (Food, Travel, Bills, etc.)
●	Generate monthly summaries and insights
Key Features
●	CLI or simple GUI input system
●	Data storage using CSV or JSON
●	Monthly expense summary
●	Category-wise breakdown (pie chart using libraries like matplotlib)
●	Detect highest spending category
Expected Outcome
A tool that helps users understand where their money goes and suggests areas to reduce spending.

# sql project
Problem Statement: Online Retail Sales Analysis Database
Retail businesses generate huge sales data but lack structured insights. Design a database and write SQL queries to analyze sales performance.
Objectives
●	Create a relational database for an online store
●	Store customer, product, and order data
●	Extract meaningful insights using SQL queries
Database Tables
●	Customers (customer_id, name, city)
●	Products (product_id, name, category, price)
●	Orders (order_id, customer_id, date)
●	Order_Items (order_id, product_id, quantity)
Key Tasks
●	Find top-selling products
●	Identify most valuable customers
●	Monthly revenue calculation
●	Category-wise sales analysis
●	Detect inactive customers
Expected Outcome
A structured database with optimized queries that provide actionable business insights.

