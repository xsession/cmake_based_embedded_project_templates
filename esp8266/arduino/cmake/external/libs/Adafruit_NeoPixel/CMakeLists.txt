
cmake_minimum_required(VERSION 3.14...3.18 FATAL_ERROR)

set(adafruit_neopixel_dir "${PROJECT_SOURCE_DIR}/src/libs/Adafruit_NeoPixel")

add_library(adafruit_neopixel STATIC
${adafruit_neopixel_dir}/Adafruit_NeoPixel.h
${adafruit_neopixel_dir}/Adafruit_NeoPixel.cpp

${adafruit_neopixel_dir}/esp.c
${adafruit_neopixel_dir}/esp8266.c
${adafruit_neopixel_dir}/kendyte_k210.c )

target_compile_definitions(adafruit_neopixel PUBLIC )
target_include_directories(adafruit_neopixel PUBLIC
    )

target_link_libraries(adafruit_neopixel PRIVATE
)

include(diagnostic)
target_diagnostic(adafruit_neopixel)
