# Define the source files
set(FSTRING_TEST_SOURCES
    string_tests.f90
    fstring_test.f90
)

# Build the test
add_executable(fstring_test ${FSTRING_TEST_SOURCES})
target_link_libraries(fstring_test ${PROJECT_NAME})
add_test(
    NAME fstring_test
    WORKING_DIRECTORY ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}
    COMMAND $<TARGET_FILE:fstring_test>
)

if (${BUILD_SHARED_LIBS})
    add_custom_command(
        TARGET fstring_test
        POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy
        $<TARGET_FILE:fstring>
        ${CMAKE_BINARY_DIR}/test
    )
endif()
