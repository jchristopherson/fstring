cmake_minimum_required(VERSION 3.24)
project(
    fstring
    LANGUAGES Fortran
    VERSION 1.0.3
)
set(CMAKE_Fortran_STANDARD 2018)
set(CMAKE_Fortran_STANDARD_REQUIRED TRUE)

add_subdirectory(configure)
add_subdirectory(src)

install(
  EXPORT ${PROJECT_NAME}-targets
  NAMESPACE ${PROJECT_NAME}::
  DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}"
)

# Testing
option(BUILD_TESTING "Build FSTRING tests")
include(CTest)
message(STATUS "Build FSTRING tests: ${BUILD_TESTING}")
if (BUILD_TESTING)
    enable_testing()
    add_subdirectory(test)
endif()

# Examples
option(BUILD_FSTRING_EXAMPLES "Build FSTRING examples")
message(STATUS "Build FSTRING examples: ${BUILD_FSTRING_EXAMPLES}")
if (BUILD_FSTRING_EXAMPLES)
    add_subdirectory(examples)
endif()