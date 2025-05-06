def result_details():
    # Initialize lists to store course details
    courses = []
    scores = []
    num_courses = 4  # Minimum 4 courses

    # Iterative input collection
    print("Enter details for 4 courses (Course Code, Section, Score):")
    for i in range(num_courses):
        course_code = input(f"Enter Course Code for course {i+1}: ")
        section = input(f"Enter Section for course {i+1}: ")
        while True:
            try:
                score = float(input(f"Enter Score for course {i+1} (0-100): "))
                if 0 <= score <= 100:
                    break
                else:
                    print("Score must be between 0 and 100.")
            except ValueError:
                print("Invalid input. Enter a numeric score.")
        courses.append((course_code, section))
        scores.append(score)

    # Calculate average score
    average_score = sum(scores) / len(scores)

    # Display results
    print("\nCourse Details and Scores:")
    for i, (course, score) in enumerate(zip(courses, scores)):
        print(f"Course {i+1}: Code={course[0]}, Section={course[1]}, Score={score}")
    print(f"Average Score: {average_score:.2f}")

# Run the function
if __name__ == "__main__":
    result_details()