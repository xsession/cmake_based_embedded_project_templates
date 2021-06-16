cmake_minimum_required(VERSION 3.14...3.18 FATAL_ERROR)

set(dht_sensor_lib_dir "${PROJECT_SOURCE_DIR}/src/libs/DHT-sensor-librar")

add_library(dht_sensor_lib STATIC
${dht_sensor_lib_dir}/DHT.h
${dht_sensor_lib_dir}/DHT_U.h

${dht_sensor_lib_dir}/DHT.cpp
${dht_sensor_lib_dir}/DHT_U.cpp )

target_compile_definitions(dht_sensor_lib PUBLIC )
target_include_directories(dht_sensor_lib PUBLIC )

target_link_libraries(dht_sensor_lib PRIVATE
)

include(diagnostic)
target_diagnostic(dht_sensor_lib)
