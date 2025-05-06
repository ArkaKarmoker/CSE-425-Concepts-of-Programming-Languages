import random
import math


def cumulative_sum_and_circle_area():
    # Generate list of 10 random numbers (integers for simplicity)
    random_list = [random.randint(1, 20) for _ in range(10)]
    print("Random List:", random_list)

    # Compute cumulative sum
    cumulative_list = [sum(random_list[:i + 1]) for i in range(len(random_list))]
    print("Cumulative Sum List:", cumulative_list)

    # Find numbers divisible by 3 and calculate circle area
    areas = [math.pi * (x ** 2) for x in cumulative_list if x % 3 == 0]

    if areas:
        print("Areas of circles (radius divisible by 3):")
        for i, area in enumerate(areas, 1):
            print(f"Area {i}: {area:.2f}")
    else:
        print("radius not found")


# Run the function
if __name__ == "__main__":
    # random.seed(42)  # For reproducibility
    cumulative_sum_and_circle_area()