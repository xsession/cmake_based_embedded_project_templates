cmake_minimum_required(VERSION 3.14...3.18 FATAL_ERROR)

set(ntp_client_dir "${PROJECT_SOURCE_DIR}/src/libs/NTPClient")

add_library(ntp_client STATIC
${ntp_client_dir}/NTPClient.h 
${ntp_client_dir}/NTPClient.cpp )

target_compile_definitions(ntp_client PUBLIC )
target_include_directories(ntp_client PUBLIC )

target_link_libraries(ntp_client PRIVATE
)

include(diagnostic)
target_diagnostic(ntp_client)
