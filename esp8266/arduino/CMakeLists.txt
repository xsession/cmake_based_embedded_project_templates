cmake_minimum_required(VERSION 3.19 FATAL_ERROR)

project("Platform-project" C CXX ASM)

set(PLATFORM_PROJECT_LOCATION ${PROJECT_SOURCE_DIR})

# Generate compile_commands.json to make it easier to work with clang based tools
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/utils")
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/compilers")

include(Fetch_platform_dependencies)

if(NOT EXISTS ${PROJECT_SOURCE_DIR}/platform/ESP8266/Arduino/tools/xtensa-lx106-elf)
    execute_process(
        COMMAND py ${PROJECT_SOURCE_DIR}/src/platform/ESP8266/Arduino/tools/get.py
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/src/platform/ESP8266/Arduino/tools
    )
endif()

add_subdirectory(cmake/external)
add_subdirectory(src/board)
add_subdirectory(src/app/7SegmentNeoPixelClock)

