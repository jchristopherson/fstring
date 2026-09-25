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