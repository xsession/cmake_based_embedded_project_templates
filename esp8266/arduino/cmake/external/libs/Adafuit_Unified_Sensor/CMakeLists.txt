cmake_minimum_required(VERSION 3.14...3.18 FATAL_ERROR)

set(adafruit_sensors_dir "${PROJECT_SOURCE_DIR}/src/libs/Adafruit_Sensors")

add_library(adafruit_sensors STATIC
${adafruit_sensors_dir}/Adafruit_Sensor.cpp
${adafruit_sensors_dir}/Adafruit_Sensor.h
)

target_compile_definitions(adafruit_sensors PUBLIC )
target_include_directories(adafruit_sensors PUBLIC )

target_link_libraries(adafruit_sensors PRIVATE
)

include(diagnostic)
target_diagnostic(adafruit_sensors)
