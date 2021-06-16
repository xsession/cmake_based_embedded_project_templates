cmake_minimum_required(VERSION 3.18 FATAL_ERROR)

set(CMAKE_SYSTEM_NAME ESP8266)
set(CMAKE_SYSTEM_VERSION 1)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

message("From toolchain!")

# set(UNIX 1)
set(CMAKE_C_OUTPUT_EXTENSION .o)
set(CMAKE_CXX_OUTPUT_EXTENSION .o)
set(CMAKE_ASM_OUTPUT_EXTENSION .o)
set(CMAKE_STATIC_LIBRARY_PREFIX lib)
set(CMAKE_STATIC_LIBRARY_SUFFIX .a)
set(CMAKE_SHARED_LIBRARY_PREFIX lib)
set(CMAKE_SHARED_LIBRARY_SUFFIX .a)
set(CMAKE_EXECUTABLE_SUFFIX .elf)



if(CMAKE_HOST_SYSTEM_NAME MATCHES "Linux")
    set(USER_HOME $ENV{HOME})
    set(HOST_EXECUTABLE_PREFIX "")
    set(ESP8266_ESPTOOL_COM_PORT /dev/ttyUSB${PORT_NUMBER} CACHE STRING "COM port to be used by esptool")
elseif(CMAKE_HOST_SYSTEM_NAME MATCHES "Windows")
    set(USER_HOME $ENV{USERPROFILE})
    set(HOST_EXECUTABLE_SUFFIX ".exe")
    set(ESP8266_ESPTOOL_COM_PORT COM${PORT_NUMBER} CACHE STRING "COM port to be used by esptool")
else()
    message(FATAL_ERROR Unsupported build platform.)
endif()


set(ARDUINO_DIR "${PROJECT_SOURCE_DIR}/platform/ESP8266/Arduino" CACHE PATH "Path to the directory containing the Arduino package files")

set(TOOLCHAIN_DIR "${ARDUINO_DIR}/tools/xtensa-lx106-elf")
set(ESP8266_ESPTOOL "${ARDUINO_DIR}/tools/esptool/esptool.py")

set(CMAKE_FIND_ROOT_PATH "${TOOLCHAIN_DIR}")
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# toolchain paths
find_program(XTENSA_GCC             NAMES  xtensa-lx106-elf-gcc        PATHS  ${TOOLCHAIN_DIR}/bin    NO_DEFAULT_PATH)
find_program(XTENSA_CXX             NAMES  xtensa-lx106-elf-g++        PATHS  ${TOOLCHAIN_DIR}/bin    NO_DEFAULT_PATH)
find_program(XTENSA_AS              NAMES  xtensa-lx106-elf-as         PATHS  ${TOOLCHAIN_DIR}/bin    NO_DEFAULT_PATH)
find_program(XTENSA_AR              NAMES  xtensa-lx106-elf-ar         PATHS  ${TOOLCHAIN_DIR}/bin    NO_DEFAULT_PATH)
find_program(XTENSA_OBJCOPY         NAMES  xtensa-lx106-elf-objcopy    PATHS  ${TOOLCHAIN_DIR}/bin    NO_DEFAULT_PATH)
find_program(XTENSA_OBJDUMP         NAMES  xtensa-lx106-elf-objdump    PATHS  ${TOOLCHAIN_DIR}/bin    NO_DEFAULT_PATH)
find_program(XTENSA_SIZE            NAMES  xtensa-lx106-elf-size       PATHS  ${TOOLCHAIN_DIR}/bin    NO_DEFAULT_PATH)
find_program(XTENSA_LD              NAMES  xtensa-lx106-elf-ld         PATHS  ${TOOLCHAIN_DIR}/bin    NO_DEFAULT_PATH)

# set executables settings
set(CMAKE_C_COMPILER    ${XTENSA_GCC})
set(CMAKE_CXX_COMPILER  ${XTENSA_CXX})
set(AS                  ${XTENSA_AS})
set(AR                  ${XTENSA_AR})
set(OBJCOPY             ${XTENSA_OBJCOPY})
set(OBJDUMP             ${XTENSA_OBJDUMP})
set(SIZE                ${XTENSA_SIZE})
set(LD                  ${XTENSA_LD})

set(CMAKE_C_FLAGS "-Os -g -std=gnu99 -Wpointer-arith -Wno-implicit-function-declaration -Wundef -pipe -D__ets__ -DICACHE_FLASH -fno-inline-functions -ffunction-sections -nostdlib -mlongcalls -mtext-section-literals -falign-functions=4 -fdata-sections")
set(CMAKE_CXX_FLAGS "-Os -g -D__ets__ -DICACHE_FLASH -mlongcalls -mtext-section-literals -fno-exceptions -fno-rtti -falign-functions=4 -std=c++11 -MMD -ffunction-sections -fdata-sections")
set(CMAKE_EXE_LINKER_FLAGS "-nostdlib -Wl,--no-check-sections -Wl,-static -Wl,--gc-sections")

set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_C_COMPILER> <FLAGS> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> -o <TARGET> -Wl,--start-group <OBJECTS> <LINK_LIBRARIES> -Wl,--end-group")
set(CMAKE_CXX_LINK_EXECUTABLE "<CMAKE_CXX_COMPILER> <FLAGS> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS> -o <TARGET> -Wl,--start-group <OBJECTS> <LINK_LIBRARIES> -Wl,--end-group")
