program cumulative_sum_and_circle_area
    implicit none
    integer, parameter :: n = 10
    real :: random_list(n), cumulative_list(n)
    real :: pi = 3.14159265359
    integer :: i, count
    logical :: found

    ! Seed for reproducibility
    call random_seed()

    ! Generate random numbers (1 to 20)
    do i = 1, n
        call random_number(random_list(i))
        random_list(i) = 1 + floor(20 * random_list(i))
    end do

    ! Print random list
    print *, "Random List:"
    print '(10I5)', int(random_list)

    ! Compute cumulative sum
    cumulative_list(1) = random_list(1)
    do i = 2, n
        cumulative_list(i) = cumulative_list(i-1) + random_list(i)
    end do

    ! Print cumulative sum list
    print *, "Cumulative Sum List:"
    print '(10I5)', int(cumulative_list)

    ! Calculate circle areas for numbers divisible by 3
    found = .false.
    print *, "Areas of circles (radius divisible by 3):"
    count = 0
    do i = 1, n
        if (mod(int(cumulative_list(i)), 3) == 0) then
            found = .true.
            count = count + 1
            print '(A,I2,A,F10.2)', "Area ", count, ": ", pi * (cumulative_list(i) ** 2)
        end if
    end do

    if (.not. found) then
        print *, "radius not found"
    end if

end program cumulative_sum_and_circle_area
