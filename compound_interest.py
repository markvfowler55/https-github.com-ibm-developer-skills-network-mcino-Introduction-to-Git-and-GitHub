# This script calculates yearly compound interest given principal, annual rate of interest and time period in years.
# Do not use this in production. Sample purpose only.

# Author: Upkar Lidder (IBM)
# Updated by HamzaIDM

# Input:
# p, principal amount
# t, time period in years
# r, annual rate of interest

# Output:
# compound interest = p * (1 + r/100)^t
import sys

def compound_interest(p, t, r):
    return p * (pow((1 + r / 100), t))

def main():

    # for speed
    read = sys.stdin.readline
    write = sys.stdout.write

    write("Enter the principal amount: ")
    p = float(read())
    write("Enter the time period: ")
    t = float(read())
    write("Enter the interest rate: ")
    r = float(read())

    print(f"The compound interest is {compound_interest(p, t, r):.2f}")


if __name__ == "__main__":
    main()