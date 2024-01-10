# Get helper macros and functions
include("${PROJECT_SOURCE_DIR}/cmake/helper.cmake")

# Define the source files
set(FSTRING_TEST_SOURCES
    string_tests.f90
    fstring_test.f90
)

# Build the test
add_executable(fstring_test ${FSTRING_TEST_SOURCES})
link_library(fstring_test ${PROJECT_NAME} ${PROJECT_INCLUDE_DIR})
add_test(
    NAME fstring_test
    WORKING_DIRECTORY ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}
    COMMAND $<TARGET_FILE:fstring_test>
)