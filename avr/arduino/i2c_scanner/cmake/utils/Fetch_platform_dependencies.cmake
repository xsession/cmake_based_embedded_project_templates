include(FetchContent)

message("Hello from Fetch_platform_dependencies!")
#----------------- PLATFORM ------------------------

FetchContent_Declare(
  Avr
  GIT_REPOSITORY https://github.com/xsession/ArduinoCore-avr.git
  GIT_TAG        origin/master
  SOURCE_DIR     ${PROJECT_SOURCE_DIR}/deps/ArduinoCore-avr
  )


set(FETCHCONTENT_QUIET OFF)
set(FETCHCONTENT_UPDATES_DISCONNECTED ON)

FetchContent_MakeAvailable( Avr 
                  # chsm 
                  )