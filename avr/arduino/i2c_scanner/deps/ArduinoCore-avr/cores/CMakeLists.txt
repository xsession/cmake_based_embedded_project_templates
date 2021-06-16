cmake_minimum_required(VERSION 3.19)

add_library(arduino-core  
        arduino/Arduino.h               
        arduino/binary.h                
        arduino/Client.h                
        arduino/HardwareSerial.h        
        arduino/HardwareSerial_private.h
        arduino/IPAddress.h             
        arduino/new.h                   
        arduino/PluggableUSB.h          
        arduino/Print.h                 
        arduino/Printable.h             
        arduino/Server.h                
        arduino/Stream.h                
        arduino/Udp.h                   
        arduino/USBAPI.h                
        arduino/USBCore.h               
        arduino/USBDesc.h               
        arduino/WCharacter.h            
        arduino/wiring_private.h        
        arduino/WString.h  

        arduino/abi.cpp                 
        arduino/CDC.cpp                 
        arduino/HardwareSerial.cpp      
        arduino/HardwareSerial0.cpp     
        arduino/HardwareSerial1.cpp     
        arduino/HardwareSerial2.cpp     
        arduino/HardwareSerial3.cpp     
        arduino/hooks.c                 
        arduino/IPAddress.cpp           
        arduino/main.cpp                
        arduino/new.cpp                 
        arduino/PluggableUSB.cpp        
        arduino/Print.cpp               
        arduino/Stream.cpp              
        arduino/Tone.cpp                
        arduino/USBCore.cpp             
        arduino/WInterrupts.c           
        arduino/wiring.c                
        arduino/wiring_analog.c         
        arduino/wiring_digital.c        
        arduino/wiring_pulse.c          
        arduino/wiring_shift.c          
        arduino/WMath.cpp               
        arduino/WString.cpp             
        arduino/wiring_pulse.S          
                )


target_compile_definitions(arduino-core  PRIVATE 
)

# Includes ---------------------------------------------------------------------


target_include_directories(arduino-core 
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/arduino>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}>
)

set(${PROJECT_NAME}_PUBLIC_HEADERS
        crf/inc/atomic_ops.h 
        crf/inc/cbits.h      
        crf/inc/cevent.h     
        crf/inc/chsm.h       
        crf/inc/cpool.h      
        crf/inc/cqueue.h     
        crf/inc/crf.h        
        crf/inc/cvalue.h     
    
)

set_target_properties(${PROJECT_NAME}
    PROPERTIES 
        C_STANDARD          99
        C_STANDARD_REQUIRED ON
        C_EXTENSIONS        OFF
        PUBLIC_HEADER       "${${PROJECT_NAME}_PUBLIC_HEADERS}"
        EXPORT_NAME         framework
)

# Install ------------------------------------------------------------------------

write_basic_package_version_file(${PROJECT_NAME}ConfigVersion.cmake
    VERSION       ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion 
)

## Target installation
install(TARGETS   ${PROJECT_NAME}
    EXPORT        ${PROJECT_NAME}Targets
    ARCHIVE       DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY       DESTINATION ${CMAKE_INSTALL_LIBDIR}
    PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}
    COMPONENT     library
)

## Target's cmake files: targets export
install(EXPORT  ${PROJECT_NAME}Targets
    NAMESPACE   ${PROJECT_NAME}::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
)

## Target's cmake files: config and version config for find_package()
install(FILES   ${PROJECT_NAME}Config.cmake
                ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
)

include(diagnostic)
set(debug on)
# set(autodetect_toolchain on)
diagnostic(crf)



          