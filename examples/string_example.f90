! MIT License
! 
! Copyright (c) 2024 Jason Christopherson
! 
! Permission is hereby granted, free of charge, to any person obtaining a copy
! of this software and associated documentation files (the "Software"), to deal
! in the Software without restriction, including without limitation the rights
! to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
! copies of the Software, and to permit persons to whom the Software is
! furnished to do so, subject to the following conditions:
! 
! The above copyright notice and this permission notice shall be included in all
! copies or substantial portions of the Software.
! 
! THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
! IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
! SOFTWARE.

program example
    use strings
    use iso_fortran_env, only : int32
    implicit none

    ! Variables
    character(len = *), parameter :: str = "This is an example string of type character."
    type(string) :: str1
    integer(int32), allocatable, dimension(:) :: indices

    ! Replace character with type(string)
    str1 = replace(str, "character", "type(string)")
    print "(A)", char(str1) ! char is required as print doesn't recognize type(string)

    ! Print the original string
    print "(A)", str

    ! Ensure they are not equal
    print "(AL)", "str /= str1: ", str /= str1

    ! Find all locations of the substring "string"
    indices = find(str1, "string")  ! notice the use of mixed types (type(string) & character)
    print "(AI0AI0)", "Index 1: ", indices(1), ", Index 2: ", indices(2)

    ! Convert a numeric value to a string
    print "(A)", char(to_string(1.234d0)) ! char is required as print doesn't recognize type(string)
    print "(A)", char(to_string(1.234d0, "(F5.3)")) ! specifying the format

    ! Convert a string to a number
    print "(F5.3)", string_to_real("1.234")
end program