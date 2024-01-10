program example
    use strings
    implicit none

    ! Variables
    character(len = *), parameter :: str1 = "This is the first string."
    character(len = *), parameter :: str2 = "This is the second string."
    character(len = :), allocatable :: str
    type(string_builder) :: sb

    ! Use typical string concatenation to build up the string
    str = str1 // " " // str2
    print "(A)", str

    ! Using string_builder
    call sb%append(str1)
    call sb%append(" ")
    call sb%append(str2)
    print "(A)", char(sb%to_string()) ! to_string returns a type(string) which needs to be converted to character by char for the print statement
end program