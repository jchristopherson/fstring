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