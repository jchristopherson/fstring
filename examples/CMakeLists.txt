# string_example
add_executable(string_example string_example.f90)
target_link_libraries(string_example ${PROJECT_NAME})

# string_builder_example
add_executable(string_builder_example string_builder_example.f90)
target_link_libraries(string_builder_example ${PROJECT_NAME})

if (${BUILD_SHARED_LIBS})
    add_custom_command(
        TARGET string_example
        POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy
        $<TARGET_FILE:fstring>
        ${CMAKE_BINARY_DIR}/examples
    )
endif()