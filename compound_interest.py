

def compound_interest(p, t, r):
    return p * (pow((1 + r / 100), t))


if __name__ == "__main__":
    p = float(input("Enter the principal amount: "))
    t = float(input("Enter the time period: "))
    r = float(input("Enter the rate of interest: "))

    print("The compound interest is {:.2f}".format(compound_interest(p, t, r)))
