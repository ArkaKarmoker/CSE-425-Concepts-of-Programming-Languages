program result_details
    implicit none
    integer, parameter :: num_courses = 4
    character(len=10) :: course_codes(num_courses)
    character(len=5) :: sections(num_courses)
    real :: scores(num_courses)
    real :: average_score
    integer :: i
    character(len=100) :: input_buffer

    print *, "Enter details for 4 courses (Course Code, Section, Score):"
    do i = 1, num_courses
        write(*, '(A,I1,A)') "Enter Course Code for course ", i, ": "
        read(*, '(A)') input_buffer
        course_codes(i) = trim(input_buffer)

        write(*, '(A,I1,A)') "Enter Section for course ", i, ": "
        read(*, '(A)') input_buffer
        sections(i) = trim(input_buffer)

        do
            write(*, '(A,I1,A)') "Enter Score for course ", i, " (0-100): "
            read(*, *, err=10) scores(i)
            if (scores(i) >= 0 .and. scores(i) <= 100) exit
            print *, "Score must be between 0 and 100."
10          print *, "Invalid input. Enter a numeric score."
        end do
    end do

    ! Calculate average score
    average_score = sum(scores) / num_courses

    ! Display results
    print *, ""
    print *, "Course Details and Scores:"
    do i = 1, num_courses
        print '(A,I1,A,A,A,A,A,F5.1)', "Course ", i, ": Code=", trim(course_codes(i)), &
            ", Section=", trim(sections(i)), ", Score=", scores(i)
    end do
    print '(A,F6.2)', "Average Score: ", average_score

end program result_details
