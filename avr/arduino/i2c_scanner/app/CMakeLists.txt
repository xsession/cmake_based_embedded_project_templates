cmake_minimum_required(VERSION 3.19 FATAL_ERROR)

project("i2c_scanner-project" )

# Generate compile_commands.json to make it easier to work with clang based tools
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/../cmake/utils")

include(FetchContent)

FetchContent_Declare(
  I2CScanner
  GIT_REPOSITORY https://github.com/luisllamasbinaburo/Arduino-I2CScanner.git
  GIT_TAG        origin/master
  SOURCE_DIR     ${PROJECT_SOURCE_DIR}/../deps/I2CScanner
  )


set(FETCHCONTENT_QUIET OFF)
set(FETCHCONTENT_UPDATES_DISCONNECTED ON)

FetchContent_MakeAvailable( I2CScanner 
                  )

set(i2cScanner_dir ${PROJECT_SOURCE_DIR}/../deps/I2CScanner)
set(wire_dir ${PROJECT_SOURCE_DIR}/../deps/ArduinoCore-avr/libraries/Wire)
set(arduino_core_dir ${PROJECT_SOURCE_DIR}/../deps/ArduinoCore-avr/cores/arduino)

add_executable(i2c_scanner
    src/Scanner.cpp
    ../deps/ArduinoCore-avr/libraries/Wire/src/Wire.cpp
    ../deps/ArduinoCore-avr/libraries/Wire/src/utility/twi.c
)

target_include_directories(i2c_scanner PUBLIC
    ${i2cScanner_dir}/src
    ${wire_dir}/src
    ${wire_dir}/src/utility
    ${arduino_core_dir}
    ${PROJECT_SOURCE_DIR}/../deps/ArduinoCore-avr/variants/circuitplay32u4

)

message("CMAKE_CURRENT_SOURCE_DIR: -> ${CMAKE_CURRENT_SOURCE_DIR}")

# set_target_properties(i2c_scanner PROPERTIES SUFFIX ".hex")

target_compile_definitions(i2c_scanner PUBLIC
    -DF_CPU=16000000L 
    -DARDUINO=10813 
    -DARDUINO_AVR_NANO 
    -DARDUINO_ARCH_AVR 
    -DARDUINO_LIB_DISCOVERY_PHASE
)

target_compile_options(i2c_scanner PRIVATE
    -c 
    -g 
    -Os 
    -w 
    -std=gnu++11 
    -fpermissive 
    -fno-exceptions 
    -ffunction-sections 
    -fdata-sections 
    -fno-threadsafe-statics 
    -Wno-error=narrowing 
    -flto 
    -w 
    -x c++ 
    -E 
    -CC 
    -Wa,-mmcu=atmega328p 
)

target_link_options(i2c_scanner PRIVATE
    -w 
    -Os 
    -g 
    -flto 
    -fuse-linker-plugin 
    -Wl,--gc-sections -mmcu=atmega328p
)

target_link_directories(i2c_scanner PRIVATE
)

target_link_libraries(i2c_scanner PUBLIC
    
)

include(diagnostic)
diagnostic(i2c_scanner)