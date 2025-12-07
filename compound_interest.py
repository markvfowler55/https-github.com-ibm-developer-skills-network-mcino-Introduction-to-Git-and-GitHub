# This script calculates yearly compound interest given principal, annual rate of interest and time period in years.
# Do not use this in production. Sample purpose only.

# Author: Upkar Lidder (IBM)

# Input:
# p, principal amount
# t, time period in years
# r, annual rate of interest

# Output:
# compound interest = p * (1 + r/100)^t


def compound_interest(principal, time, rate):
    """Calculate compound interest."""
    return principal * (pow((1 + rate / 100), time))


def get_float_input(prompt):
    """Get a float input with validation."""
    while True:
        try:
            value = float(input(prompt))
            return value
        except ValueError:
            print("Invalid input! Please enter a number.")


if __name__ == "__main__":
    print("Compound Interest Calculator")

    # Get validated inputs
    principal = get_float_input("Enter the principal amount: ")
    time = get_float_input("Enter the time period (in years): ")
    rate = get_float_input("Enter the rate of interest (in %): ")

    # Calculate compound interest
    interest = compound_interest(principal, time, rate)
    print("The compound interest is: {:.2f}".format(interest))
