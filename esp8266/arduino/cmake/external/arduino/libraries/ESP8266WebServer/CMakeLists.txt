set(ESP8266WEBSERVER_LOCATION "${ARDUINO_DIR}/libraries/ESP8266WebServer/src")

add_library(esp8266webserver STATIC
    ${ESP8266WEBSERVER_LOCATION}/ESP8266WebServer.h
    ${ESP8266WEBSERVER_LOCATION}/ESP8266WebServer-impl.h
    ${ESP8266WEBSERVER_LOCATION}/ESP8266WebServerSecure.h
    ${ESP8266WEBSERVER_LOCATION}/Parsing-impl.h
    ${ESP8266WEBSERVER_LOCATION}/Uri.h
    ${ESP8266WEBSERVER_LOCATION}/uri/UriBraces.h
    ${ESP8266WEBSERVER_LOCATION}/uri/UriGlob.h
    ${ESP8266WEBSERVER_LOCATION}/uri/UriRegex.h
    ${ESP8266WEBSERVER_LOCATION}/detail/mimetable.h
    ${ESP8266WEBSERVER_LOCATION}/detail/RequestHandler.h
    ${ESP8266WEBSERVER_LOCATION}/detail/RequestHandlersImpl.h

    ${ESP8266WEBSERVER_LOCATION}/detail/mimetable.cpp
)

target_include_directories(esp8266webserver PUBLIC
    ${ESP8266WEBSERVER_LOCATION}
    ${ESP8266WEBSERVER_LOCATION}/detail
    ${ESP8266WEBSERVER_LOCATION}/uri
)

target_link_libraries(esp8266webserver PUBLIC
    arduino
    esp8266wifi
)

include(diagnostic)
target_diagnostic(esp8266webserver)