# fstring
A modern Fortran string library.

## Status
[![CMake](https://github.com/jchristopherson/fstring/actions/workflows/cmake.yml/badge.svg)](https://github.com/jchristopherson/fstring/actions/workflows/cmake.yml)
[![Actions Status](https://github.com/jchristopherson/fstring/workflows/fpm/badge.svg)](https://github.com/jchristopherson/fstring/actions)

## Building fstring
[CMake](https://cmake.org/)This library can be built using CMake.  Use -DBUILD_TESTING=TRUE only if tests are desired.  If tests are not to be built, then simply omit -DBUILD_TESTING.  The default is a release build static library.
```txt
cd build
cmake ../build -DBUILD_TESTING=TRUE
make
```
For more detailed instructions see [Running CMake](https://cmake.org/runningcmake/).

[FPM](https://github.com/fortran-lang/fpm) can also be used to build this library using the provided fpm.toml.
```txt
fpm build
```
The fstring library can be used within your FPM project by adding the following to your fpm.toml file.
```toml
[dependencies]
fstring = { git = "https://github.com/jchristopherson/fstring" }
```

## Documentation
Documentation can be found [here](https://jchristopherson.github.io/fstring/).

## Example 1
The following example illustrates the a subset of the functionallity of the library along with the string type and its interoperability with the traditional character type.
```fortran
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
```
The output from the above program is as follows.
```text
This is an example string of type type(string)
This is an example string of type character.
str /= str1: T
Index 1: 20, Index 2: 40
1.23400
1.234
1.234
```

## Example 2
The following example illustrates building up a string via concatenation vs. using the string_builder type.  For situations where relatively few strings need to be brought together into one, the built-in concatenation operator is the way to go; however, as the number of strings increases, the string_builder type begins to make much more sense.  This is partially due to the design of the string_builder type, which uses an internal buffer.  This internal buffer can allow for simple copying options vs. additional allocations.  In certain instances this feature can be advantageous.  The example below does not illustrate such a case.  Instead, it merely shows the basics of operation.  Regardless, as can be seen, the string_builder type is simple to use and can be easily extended to more complex scenarios.
```fortran
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
```
The output from the above program is as follows.
```text
This is the first string. This is the second string.
This is the first string. This is the second string.
```