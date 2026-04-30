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
