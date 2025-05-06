def filter_sort_integers():
    # Sample mixed list
    mixed_list = [3.14, "hello", 5, 2.7, 10, "world", 1, 8.9, 4]
    print("Input List:", mixed_list)

    # Filter integers and sort
    integers = sorted([x for x in mixed_list if isinstance(x, int)])
    print("Sorted Integers:", integers)

# Run the function
if __name__ == "__main__":
    filter_sort_integers()