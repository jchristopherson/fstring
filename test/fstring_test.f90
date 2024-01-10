program main
    use string_tests
    implicit none

    if (.not.test_string_equality()) stop 1
    if (.not.test_split_string()) stop 2
    if (.not.test_to_string()) stop 3
    if (.not.test_to_c_string()) stop 4
    if (.not.test_string_to_int()) stop 5
    if (.not.test_string_to_real()) stop 6
    if (.not.test_string_builder()) stop 7
    if (.not.test_remove()) stop 8
    if (.not.test_insert()) stop 9
    if (.not.test_to_upper()) stop 10
    if (.not.test_to_lower()) stop 11
    if (.not.test_replace()) stop 12
    if (.not.test_find()) stop 13
end program