cmake_minimum_required(VERSION 3.14...3.18 FATAL_ERROR)


add_executable(seven_segment_clock
    src/NeoPixel_7_Segment_Clock.cpp
)

target_include_directories(seven_segment_clock PUBLIC
    inc
)

set_target_properties(seven_segment_clock PROPERTIES SUFFIX ".elf")

target_compile_definitions(seven_segment_clock PRIVATE
    -DVTABLES_IN_FLASH
)
target_compile_options(seven_segment_clock PRIVATE
    -CC -E -P 
    "${PLATFORM_PROJECT_LOCATION}/platform/ESP8266/Arduino/tools/sdk/ld/eagle.app.v6.common.ld.h" 
    -o "${CMAKE_BINARY_DIR}/local.eagle.app.v6.common.ld"
    "${PLATFORM_PROJECT_LOCATION}/platform/ESP8266/Arduino/tools/xtensa-lx106-elf-gcc\\2.5.0-4-b40a506/bin/xtensa-lx106-elf-gcc" 
    -fno-exceptions -Wl,-Map "-Wl,C:\\Users\\Riko\\AppData\\Local\\Temp\\arduino_build_652563/NeoPixel_7_Segment_Clock.ino.map" 
    -g 
    -w 
    -Os 
    -nostdlib 
    -Wl,--no-check-sections 
    -u app_entry 
    -u _printf_float 
    -u _scanf_float 


    -Teagle.flash.4m2m.ld 
    -Wl,--gc-sections 
    -Wl,-wrap,system_restart_local 
    -Wl,-wrap,spi_flash_read -o "C:\\Users\\Riko\\AppData\\Local\\Temp\\arduino_build_652563/NeoPixel_7_Segment_Clock.ino.elf" 

    -Wl,--start-group "C:\\Users\\Riko\\AppData\\Local\\Temp\\arduino_build_652563\\sketch\\NeoPixel_7_Segment_Clock.ino.cpp.o" 
    "C:\\Users\\Riko\\AppData\\Local\\Temp\\arduino_build_652563\\libraries\\ESP8266WiFi\\ESP8266WiFi.a" 
    "C:\\Users\\Riko\\AppData\\Local\\Temp\\arduino_build_652563\\libraries\\Adafruit_NeoPixel\\esp.c.o" 
    "C:\\Users\\Riko\\AppData\\Local\\Temp\\arduino_build_652563\\libraries\\Adafruit_NeoPixel\\esp8266.c.o" 
    "C:\\Users\\Riko\\AppData\\Local\\Temp\\arduino_build_652563\\libraries\\Adafruit_NeoPixel\\kendyte_k210.c.o" 
    "C:\\Users\\Riko\\AppData\\Local\\Temp\\arduino_build_652563\\libraries\\Adafruit_NeoPixel\\Adafruit_NeoPixel.cpp.o" 
    "C:\\Users\\Riko\\AppData\\Local\\Temp\\arduino_build_652563\\libraries\\NTPClient\\NTPClient.cpp.o" 
    "C:\\Users\\Riko\\AppData\\Local\\Temp\\arduino_build_652563\\libraries\\Time\\DateStrings.cpp.o" 
    "C:\\Users\\Riko\\AppData\\Local\\Temp\\arduino_build_652563\\libraries\\Time\\Time.cpp.o" 
    "C:\\Users\\Riko\\AppData\\Local\\Temp\\arduino_build_652563\\libraries\\DHT_sensor_library\\DHT.cpp.o" 
    "C:\\Users\\Riko\\AppData\\Local\\Temp\\arduino_build_652563\\libraries\\DHT_sensor_library\\DHT_U.cpp.o" 
    "C:\\Users\\Riko\\AppData\\Local\\Temp\\arduino_build_652563\\libraries\\Adafruit_Unified_Sensor\\Adafruit_Sensor.cpp.o" 
    "C:\\Users\\Riko\\AppData\\Local\\Temp\\arduino_cache_26463\\core\\core_883d3435033ae4c526c0b1ee53eb8033.a" 
    -lhal 
    -lphy 
    -lpp 
    -lnet80211 
    -llwip2-536-feat 
    -lwpa 
    -lcrypto 
    -lmain 
    -lwps 
    -lbearssl 
    -laxtls 
    -lespnow 
    -lsmartconfig 
    -lairkiss 
    -lwpa2 
    -lstdc++ 
    -lm 
    -lc 
    -lgcc 
    -Wl,--end-group "-LC:\\Users\\Riko\\AppData\\Local\\Temp\\arduino_build_652563"
)
target_link_options(seven_segment_clock PRIVATE

)
target_link_directories(seven_segment_clock PRIVATE
    
"-LC:\\Users\\Riko\\AppData\\Local\\Arduino15\\packages\\esp8266\\hardware\\esp8266\\2.7.4/tools/sdk/lib" 
"-LC:\\Users\\Riko\\AppData\\Local\\Arduino15\\packages\\esp8266\\hardware\\esp8266\\2.7.4/tools/sdk/lib/NONOSDK22x_190703" 
"-LC:\\Users\\Riko\\AppData\\Local\\Arduino15\\packages\\esp8266\\hardware\\esp8266\\2.7.4/tools/sdk/ld" 
"-LC:\\Users\\Riko\\AppData\\Local\\Arduino15\\packages\\esp8266\\hardware\\esp8266\\2.7.4/tools/sdk/libc/xtensa-lx106-elf/lib" 
)

target_link_libraries(seven_segment_clock PUBLIC
    adafruit_neopixel
    adafruit_sensors
    dht_sensor_lib
    ntp_client
    time

    hal 
    phy 
    pp 
    net80211 
    lwip2-536-feat 
    wpa 
    crypto 
    main 
    wps 
    bearssl 
    axtls 
    espnow 
    smartconfig 
    airkiss 
    wpa2 
    stdc++ 
    m 
    c 
    gcc 
)

include(output_generation)
# esp_bin2hex(seven_segment_clock)

include(diagnostic)
target_diagnostic(seven_segment_clock)
