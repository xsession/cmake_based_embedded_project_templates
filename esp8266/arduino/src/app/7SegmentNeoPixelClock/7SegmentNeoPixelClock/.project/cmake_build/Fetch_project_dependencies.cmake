include(FetchContent)

#----------------- LIBS ------------------------
FetchContent_Declare(
  adafruit_neopixel
  GIT_REPOSITORY https://github.com/adafruit/Adafruit_NeoPixel.git
  GIT_TAG        origin/master
  SOURCE_DIR     ${PROJECT_SOURCE_DIR}/src/libs/Adafruit_NeoPixel
  )

FetchContent_Declare(
  adafruit_sensors
  GIT_REPOSITORY https://github.com/adafruit/Adafruit_Sensor.git
  GIT_TAG        origin/master
  SOURCE_DIR     ${PROJECT_SOURCE_DIR}/src/libs/Adafruit_Sensors
  )

FetchContent_Declare(
  dht_sensor_lib
  GIT_REPOSITORY https://github.com/adafruit/DHT-sensor-library.git
  GIT_TAG        origin/master
  SOURCE_DIR     ${PROJECT_SOURCE_DIR}/src/libs/DHT-sensor-librar
  )

FetchContent_Declare(
  ntp_client
  GIT_REPOSITORY https://github.com/arduino-libraries/NTPClient.git
  GIT_TAG        origin/master
  SOURCE_DIR     ${PROJECT_SOURCE_DIR}/src/libs/NTPClient
  )

FetchContent_Declare(
  time
  GIT_REPOSITORY https://github.com/PaulStoffregen/Time.git
  GIT_TAG        origin/master
  SOURCE_DIR     ${PROJECT_SOURCE_DIR}/src/libs/Time
  )

set(FETCHCONTENT_QUIET OFF)

FetchContent_MakeAvailable(adafruit_neopixel
                            adafruit_sensors
                            dht_sensor_lib
                            ntp_client
                            time)
