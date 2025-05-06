import math

def solve_quadratic():
    # Input coefficients
    try:
        a = float(input("Enter coefficient a: "))
        b = float(input("Enter coefficient b: "))
        c = float(input("Enter coefficient c: "))
    except ValueError:
        print("Invalid input. Coefficients must be numeric.")
        return

    # Check if it's a quadratic equation
    if a == 0:
        print("Error: 'a' cannot be zero for a quadratic equation.")
        return

    # Calculate discriminant
    discriminant = b**2 - 4*a*c

    # Check for complex or real roots
    if discriminant < 0:
        print("Roots are complex.")
        real_part = -b / (2*a)
        imag_part = math.sqrt(-discriminant) / (2*a)
        print(f"Root 1: {real_part:.2f} + {imag_part:.2f}i")
        print(f"Root 2: {real_part:.2f} - {imag_part:.2f}i")
    else:
        root1 = (-b + math.sqrt(discriminant)) / (2*a)
        root2 = (-b - math.sqrt(discriminant)) / (2*a)
        print(f"Root 1: {root1:.2f}")
        print(f"Root 2: {root2:.2f}")

# Run the function
if __name__ == "__main__":
    solve_quadratic()