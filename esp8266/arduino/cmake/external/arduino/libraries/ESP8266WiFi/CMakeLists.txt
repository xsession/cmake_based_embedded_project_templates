set(ESP8266WIFI_LOCATION "${ARDUINO_DIR}/libraries/ESP8266WiFi/src")

add_library(esp8266wifi STATIC
  ${ESP8266WIFI_LOCATION}/BearSSLHelpers.h
  ${ESP8266WIFI_LOCATION}/CertStoreBearSSL.h
  ${ESP8266WIFI_LOCATION}/ESP8266WiFi.h
  ${ESP8266WIFI_LOCATION}/ESP8266WiFiAP.h
  ${ESP8266WIFI_LOCATION}/ESP8266WiFiGeneric.h
  ${ESP8266WIFI_LOCATION}/ESP8266WiFiGratuitous.h
  ${ESP8266WIFI_LOCATION}/ESP8266WiFiMulti.h
  ${ESP8266WIFI_LOCATION}/ESP8266WiFiScan.h
  ${ESP8266WIFI_LOCATION}/ESP8266WiFiSTA.h
  ${ESP8266WIFI_LOCATION}/ESP8266WiFiType.h
  ${ESP8266WIFI_LOCATION}/WiFiClient.h
  ${ESP8266WIFI_LOCATION}/WiFiServer.h
  ${ESP8266WIFI_LOCATION}/WiFiClientSecure.h
  ${ESP8266WIFI_LOCATION}/WiFiServerSecure.h
  ${ESP8266WIFI_LOCATION}/WiFiClientSecureBearSSL.h
  ${ESP8266WIFI_LOCATION}/WiFiServerSecureBearSSL.h
  ${ESP8266WIFI_LOCATION}/WiFiUdp.h
  ${ESP8266WIFI_LOCATION}/include/ClientContext.h
  ${ESP8266WIFI_LOCATION}/include/DataSource.h
  ${ESP8266WIFI_LOCATION}/include/slist.h
  ${ESP8266WIFI_LOCATION}/include/UdpContext.h
  ${ESP8266WIFI_LOCATION}/include/WiFiState.h
  
  ${ESP8266WIFI_LOCATION}/BearSSLHelpers.cpp
  ${ESP8266WIFI_LOCATION}/CertStoreBearSSL.cpp
  ${ESP8266WIFI_LOCATION}/ESP8266WiFi.cpp
  ${ESP8266WIFI_LOCATION}/ESP8266WiFiAP.cpp
  ${ESP8266WIFI_LOCATION}/ESP8266WiFiGeneric.cpp
  ${ESP8266WIFI_LOCATION}/ESP8266WiFiGratuitous.cpp
  ${ESP8266WIFI_LOCATION}/ESP8266WiFiMulti.cpp
  ${ESP8266WIFI_LOCATION}/ESP8266WiFiScan.cpp
  ${ESP8266WIFI_LOCATION}/ESP8266WiFiSTA.cpp
  ${ESP8266WIFI_LOCATION}/ESP8266WiFiSTA-WPS.cpp
  ${ESP8266WIFI_LOCATION}/WiFiClient.cpp
  ${ESP8266WIFI_LOCATION}/WiFiClientSecureBearSSL.cpp
  ${ESP8266WIFI_LOCATION}/WiFiServer.cpp
  ${ESP8266WIFI_LOCATION}/WiFiServerSecureBearSSL.cpp
  ${ESP8266WIFI_LOCATION}/WiFiUdp.cpp
)

target_include_directories(esp8266wifi PUBLIC
    ${ESP8266WIFI_LOCATION}/include
    ${ESP8266WIFI_LOCATION}
)

target_link_libraries(esp8266wifi PUBLIC
    arduino
)

target_compile_options(esp8266wifi PRIVATE
-D__ets__ 
-DICACHE_FLASH 
-U__STRICT_ANSI__ 
"-IC:\\Users\\Riko\\AppData\\Local\\Arduino15\\packages\\esp8266\\hardware\\esp8266\\2.7.4/tools/sdk/include" 
"-IC:\\Users\\Riko\\AppData\\Local\\Arduino15\\packages\\esp8266\\hardware\\esp8266\\2.7.4/tools/sdk/lwip2/include" 
"-IC:\\Users\\Riko\\AppData\\Local\\Arduino15\\packages\\esp8266\\hardware\\esp8266\\2.7.4/tools/sdk/libc/xtensa-lx106-elf/include" 
"-IC:\\Users\\Riko\\AppData\\Local\\Temp\\arduino_build_652563/core" 
-c 
-w 
-Os 
-g 
-mlongcalls 
-mtext-section-literals 
-fno-rtti 
-falign-functions=4 
-std=gnu++11 
-ffunction-sections 
-fdata-sections 
-fno-exceptions 
-w 
-x c++ 
-E 
-CC 
-DNONOSDK22x_190703=1 
-DF_CPU=80000000L 
-DLWIP_OPEN_SRC 
-DTCP_MSS=536 
-DLWIP_FEATURES=1 
-DLWIP_IPV6=0 
-DARDUINO=10813 
-DARDUINO_ESP8266_WEMOS_D1R1 
-DARDUINO_ARCH_ESP8266 
"-DARDUINO_BOARD=\"ESP8266_WEMOS_D1R1\"" 
-DFLASHMODE_DIO -DESP8266 
"-IC:\\Users\\Riko\\AppData\\Local\\Arduino15\\packages\\esp8266\\hardware\\esp8266\\2.7.4\\cores\\esp8266" 
"-IC:\\Users\\Riko\\AppData\\Local\\Arduino15\\packages\\esp8266\\hardware\\esp8266\\2.7.4\\variants\\d1" 
"C:\\Users\\Riko\\AppData\\Local\\Temp\\arduino_build_652563\\sketch\\NeoPixel_7_Segment_Clock.ino.cpp" 
-o nul 
-DARDUINO_LIB_DISCOVERY_PHASE

)

include(diagnostic)
target_diagnostic(esp8266wifi)