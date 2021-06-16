cmake_minimum_required(VERSION 3.14...3.18 FATAL_ERROR)

set(time_dir "${PROJECT_SOURCE_DIR}/src/libs/Time")

add_library(time STATIC
    ${time_dir}/Time.h
    ${time_dir}/TimeLib.h

    ${time_dir}/Time.cpp
    ${time_dir}/DateStrings.cpp
    )

target_compile_definitions(time PUBLIC )
target_include_directories(time  PUBLIC )

target_link_libraries(time PRIVATE
)

include(diagnostic)
target_diagnostic(time)
