program solve_quadratic
    implicit none
    real :: a, b, c, discriminant, root1, root2, real_part, imag_part

    ! Input coefficients
    print *, "Enter coefficient a: "
    read(*, *, err=10) a
    print *, "Enter coefficient b: "
    read(*, *, err=10) b
    print *, "Enter coefficient c: "
    read(*, *, err=10) c

    ! Check if it's a quadratic equation
    if (a == 0) then
        print *, "Error: 'a' cannot be zero for a quadratic equation."
        stop
    end if

    ! Calculate discriminant
    discriminant = b**2 - 4*a*c

    ! Check for complex or real roots
    if (discriminant < 0) then
        print *, "Roots are complex."
        real_part = -b / (2*a)
        imag_part = sqrt(-discriminant) / (2*a)
        print '(A,F6.2,A,F6.2,A)', "Root 1: ", real_part, " + ", imag_part, "i"
        print '(A,F6.2,A,F6.2,A)', "Root 2: ", real_part, " - ", imag_part, "i"
    else
        root1 = (-b + sqrt(discriminant)) / (2*a)
        root2 = (-b - sqrt(discriminant)) / (2*a)
        print '(A,F6.2)', "Root 1: ", root1
        print '(A,F6.2)', "Root 2: ", root2
    end if
    stop

10  print *, "Invalid input. Coefficients must be numeric."
end program solve_quadratic
