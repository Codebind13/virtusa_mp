# Java: The "FinSafe" Transaction Validator

### 📖 Overview
FinSafe is a lightweight digital wallet simulator built to handle real-world banking scenarios — preventing overdrafts and delivering meaningful transaction feedback to users.

### 🚀 Core Features
**Encapsulation**: The `Account` class shields sensitive data like balance and owner name using private fields.  
**Custom Exception Handling**: `InSufficientFundsException` gracefully catches and reports overdraft attempts.  
**Input Validation**: Rejects zero or negative amounts before any transaction is processed.  
**Transaction Log**: An `ArrayList` maintains a rolling history of the last 5 transactions for the mini statement.

### 🛠 How to Run
```bash
javac *.java
java Main
```
