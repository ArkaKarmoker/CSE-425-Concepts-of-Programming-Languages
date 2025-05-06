program filter_sort_integers
    implicit none
    integer, parameter :: n = 9
    integer :: i, j, temp, int_count
    real :: mixed_list(n) = [3.14, 5.0, 2.7, 10.0, 1.0, 8.9, 4.0, 6.0, 7.5]
    integer, allocatable :: integers(:)

    ! Print input list
    print *, "Input List:"
    print '(9F6.2)', mixed_list

    ! Count integers (numbers with no decimal part)
    int_count = 0
    do i = 1, n
        if (mixed_list(i) == floor(mixed_list(i))) then
            int_count = int_count + 1
        end if
    end do

    ! Allocate array for integers
    allocate(integers(int_count))

    ! Extract integers
    j = 1
    do i = 1, n
        if (mixed_list(i) == floor(mixed_list(i))) then
            integers(j) = int(mixed_list(i))
            j = j + 1
        end if
    end do

    ! Sort integers (Bubble Sort)
    do i = 1, int_count-1
        do j = 1, int_count-i
            if (integers(j) > integers(j+1)) then
                temp = integers(j)
                integers(j) = integers(j+1)
                integers(j+1) = temp
            end if
        end do
    end do

    ! Print sorted integers
    print *, "Sorted Integers:"
    print '(10I5)', integers

    deallocate(integers)
end program filter_sort_integers
