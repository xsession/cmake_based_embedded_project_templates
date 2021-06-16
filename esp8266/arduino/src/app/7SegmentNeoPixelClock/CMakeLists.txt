cmake_minimum_required(VERSION 3.18 FATAL_ERROR)

project(
  "7SegmentNeoPixelClock"
  VERSION 1.0.0
  DESCRIPTION
    "It's a 7-segment clock firmware."
    HOMEPAGE_URL ""
  LANGUAGES C CXX ASM)

message(STATUS "CMAKE_GENERATOR: -> ${CMAKE_GENERATOR}")
message(STATUS "CMAKE_TOOLCHAIN_FILE: -> ${CMAKE_TOOLCHAIN_FILE}")

message(STATUS "PROJECT_SOURCE_DIR: -> ${PROJECT_SOURCE_DIR}")

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/${PROJECT_NAME}/.project") # itt van a fetch_dependency.cmake, hogy project specifikus legyen.

option(debug ON)
set(ESP8266_FLASH_SIZE "512K" CACHE STRING "Size of flash")
set(PORT_NUMBER 14)

add_subdirectory(7SegmentNeoPixelClock)
