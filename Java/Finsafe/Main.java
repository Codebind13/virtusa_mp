package Java.Finsafe;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        Account userAccount = new Account("prajuthh", 500.0);

        System.out.println("Welcome to FinSafe Digital Wallet");

        while (true) {
            System.out.println("1. Add Funds | 2. Withdraw | 3. Account Summary | 4. Quit");
            System.out.print("Choose an option: ");
            int option = input.nextInt();

            if (option == 4) break;

            try {
                switch (option) {
                    case 1:
                        System.out.print("Enter deposit amount: ");
                        userAccount.deposit(input.nextDouble());
                        break;
                    case 2:
                        System.out.print("Enter withdrawal amount: ");
                        userAccount.processTransaction(input.nextDouble());
                        break;
                    case 3:
                        userAccount.printMiniStatement();
                        break;
                    default:
                        System.out.println("Please select a valid option.");
                }
            } catch (InSufficientFundsException | IllegalArgumentException e) {
                System.out.println("ERROR: " + e.getMessage());
            } catch (Exception e) {
                System.out.println("Unexpected Error: Please enter a valid number.");
                input.nextLine();
            }
        }

        input.close();
        System.out.println("Thank you for using FinSafe. Goodbye!");
    }
}
