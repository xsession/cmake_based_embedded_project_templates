include(FetchContent)

#----------------- PLATFORM ------------------------

FetchContent_Declare(
  Arduino
  GIT_REPOSITORY https://github.com/esp8266/Arduino.git
  GIT_TAG        origin/master
  SOURCE_DIR     ${PROJECT_SOURCE_DIR}/src/platform/ESP8266/Arduino
  )

# FetchContent_Declare(
#   ESP8266_RTOS_SDK
#   GIT_REPOSITORY https://github.com/espressif/ESP8266_RTOS_SDK.git
#   GIT_TAG        origin/master
#   SOURCE_DIR     ${PROJECT_SOURCE_DIR}/src/platform/ESP8266_RTOS_SDK
#   )
#
# FetchContent_Declare(
#   ESP8266_NONOS_SDK
#   GIT_REPOSITORY https://github.com/espressif/ESP8266_NONOS_SDK.git
#   GIT_TAG        origin/master
#   SOURCE_DIR     ${PROJECT_SOURCE_DIR}/src/platform/ESP8266_NONOS_SDK
#   )



set(FETCHCONTENT_QUIET OFF)

FetchContent_MakeAvailable(Arduino
                            # ESP8266_RTOS_SDK
                            # ESP8266_NONOS_SDK
  )