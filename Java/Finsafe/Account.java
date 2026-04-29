package Java.Finsafe;

import java.util.ArrayList;

public class Account {
    private String holderName;      // Encapsulation: balance & owner kept private
    private double currentBalance;
    private ArrayList<Double> recentTransactions; // Stores up to last 5 entries

    public Account(String holderName, double openingBalance) {
        this.holderName = holderName;
        this.currentBalance = openingBalance;
        this.recentTransactions = new ArrayList<>();
    }

    public void processTransaction(double amount) throws InSufficientFundsException {

        if (amount <= 0) {
            throw new IllegalArgumentException("Amount must be greater than zero.");
        }

        if (amount > currentBalance) {
            throw new InSufficientFundsException("Low Balance! Available Balance: $" + currentBalance);
        }

        currentBalance -= amount;
        recordTransaction(-amount);
        System.out.println("Transaction Approved. Updated Balance: $" + currentBalance);
    }

    public void deposit(double amount) {
        if (amount > 0) {
            currentBalance += amount;
            recordTransaction(amount);
            System.out.println("Amount Credited. Current Balance: $" + currentBalance);
        }
    }

    private void recordTransaction(double amount) {
        recentTransactions.add(amount);
        if (recentTransactions.size() > 5) {
            recentTransactions.remove(0); // Keep only the 5 most recent records
        }
    }

    public void printMiniStatement() {
        System.out.println("\n=== Account Summary for " + holderName + " ===");
        for (Double entry : recentTransactions) {
            String label = (entry > 0) ? "Credit" : "Debit";
            System.out.println(label + "  $" + Math.abs(entry));
        }
        System.out.println("Available Balance: $" + currentBalance + "\n");
    }
}
