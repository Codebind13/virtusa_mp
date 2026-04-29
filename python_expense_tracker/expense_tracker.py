import csv
import os
import datetime
import matplotlib.pyplot as plt

categories_file = "expenses.csv"
CATEGORIES = ["Food", "Travel", "Bills", "Shopping", "Entertainment", "Other"]

def initialize_file():
    
    if not os.path.exists(categories_file):
        with open(categories_file, mode='w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(["Date", "Category", "Amount", "Description"])
    
def add_exp():
    print("\n Add New Expense ")
    
    date_str = input("Enter date (YYYY-MM-DD) or press Enter for today: ")
    if not date_str:
        date_str = datetime.date.today().strftime("%Y-%m-%d")

    print("\nCategories:")
    for i, cat in enumerate(CATEGORIES, 1):
        print(f"{i}. {cat}")

    while True:
        try:
            cat_choice = int(input("Select category number: "))
            if 1 <= cat_choice <= len(CATEGORIES):
                category = CATEGORIES[cat_choice - 1]
                break
            else:
                print("Invalid choice... try again")
        except ValueError:
            print("Please enter a valid number")

    while True:
        try:
            amount = float(input("Enter amount: "))
            if amount > 0:
                break
            else:
                print("Amount must be positive")
        except ValueError:
            print("Enter a proper number")

    description = input("Enter description: ")

    with open(categories_file, mode='a', newline='') as file:
        writer = csv.writer(file)
        writer.writerow([date_str, category, amount, description])

    print("Expense added successfully!\n")

def vms():
    print("\n Monthly Summary ")

    month_str = input("Enter month (YYYY-MM) or press Enter for current: ")
    if not month_str:
        month_str = datetime.date.today().strftime("%Y-%m")

    expenses = []

    if not os.path.exists(categories_file):
        print("No expenses recorded yet.\n")
        return

    with open(categories_file, mode='r') as file:
        reader = csv.DictReader(file)
        for row in reader:
            if row["Date"].startswith(month_str):
                expenses.append(row)

    if not expenses:
        print(f"No expenses found for {month_str}.\n")
        return

    total_amount = 0
    category_totals = {}
 
    for exp in expenses:
        amount = float(exp["Amount"])
        total_amount += amount

        cat = exp["Category"]
        category_totals[cat] = category_totals.get(cat, 0) + amount

    print(f"\nTotal spent in {month_str}: ${total_amount:.2f}")
    print("Breakdown:")

    for cat, amt in category_totals.items():
        print(f"- {cat}: ${amt:.2f}")

    highest_cat = max(category_totals, key=category_totals.get)
    print(f"\nHighest: {highest_cat} (${category_totals[highest_cat]:.2f})")

    print("\nInsights:")
    if category_totals[highest_cat] > total_amount * 0.4:
        print(f"Reduce spending on {highest_cat}.\n")
    else:
        print("Spending is balanced.\n")

    show_chart = input("Show pie chart? (y/n): ")
    if show_chart.lower() == 'y':

        plt.figure(figsize=(7, 7))
        plt.pie(
            category_totals.values(),
            labels=category_totals.keys(),
            autopct='%1.1f%%'
        )

        plt.title(f'Expenses ({month_str})')
        plt.axis('equal')
        plt.show()

def main():
    initialize_file()

    while True:
        print("\n1. Add Expense")
        print("2. View Summary")
        print("3. Exit")

        choice = input("Enter choice: ")

        if choice == '1':
            add_exp()

        elif choice == '2':
            vms()

        elif choice == '3':
            print("Closing..")
            break

        else:
            print("Invalid choice\n")


if __name__ == "__main__":
    main()