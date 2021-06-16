

########################## ARDUINO LIB ########################################

# file(GLOB_RECURSE ARDUINO_SRC
#     ${ARDUINO_ESP8266_DIR}/cores/esp8266/*.c
#     ${ARDUINO_ESP8266_DIR}/cores/esp8266/spiffs/*.c
#     ${ARDUINO_ESP8266_DIR}/cores/esp8266/*.cpp
# )
#
# file(GLOB ARDUINO_ASM_SRC
#     ${ARDUINO_ESP8266_DIR}/cores/esp8266/*.S
# )
#
# set_source_files_properties(${ARDUINO_ASM_SRC} PROPERTIES
#     LANGUAGE ASM
# )
set(ARDUINO_SRC "${ARDUINO_DIR}/cores/esp8266")

add_library(arduino STATIC
    ${ARDUINO_SRC}/avr/dtostrf.h
    ${ARDUINO_SRC}/avr/pgmspace.h

    ${ARDUINO_SRC}/libb64/cencode.h
    ${ARDUINO_SRC}/libb64/cdecode.h
    ${ARDUINO_SRC}/libb64/cdecode.cpp
    ${ARDUINO_SRC}/libb64/cencode.cpp

    ${ARDUINO_SRC}/umm_malloc/dbglog/dbglog.h
    ${ARDUINO_SRC}/umm_malloc/Notes.h
    ${ARDUINO_SRC}/umm_malloc/umm_malloc_cfg.h
    ${ARDUINO_SRC}/umm_malloc/umm_heap_select.h
    ${ARDUINO_SRC}/umm_malloc/umm_local.h
    ${ARDUINO_SRC}/umm_malloc/umm_malloc.h
    ${ARDUINO_SRC}/umm_malloc/umm_info.c
    ${ARDUINO_SRC}/umm_malloc/umm_integrity.c
    ${ARDUINO_SRC}/umm_malloc/umm_local.c
    ${ARDUINO_SRC}/umm_malloc/umm_malloc.cpp
    ${ARDUINO_SRC}/umm_malloc/umm_poison.c

    ${ARDUINO_SRC}/spiffs/spiffs.h
    ${ARDUINO_SRC}/spiffs/spiffs_config.h
    ${ARDUINO_SRC}/spiffs/spiffs_nucleus.h
    ${ARDUINO_SRC}/spiffs/spiffs_cache.cpp
    ${ARDUINO_SRC}/spiffs/spiffs_check.cpp
    ${ARDUINO_SRC}/spiffs/spiffs_gc.cpp
    ${ARDUINO_SRC}/spiffs/spiffs_hydrogen.cpp
    ${ARDUINO_SRC}/spiffs/spiffs_nucleus.cpp

    ${ARDUINO_SRC}/Arduino.h
    ${ARDUINO_SRC}/AddrList.h
    ${ARDUINO_SRC}/base64.h
    ${ARDUINO_SRC}/binary.h
    ${ARDUINO_SRC}/CallBackList.h
    ${ARDUINO_SRC}/cbuf.h
    ${ARDUINO_SRC}/Client.h
    ${ARDUINO_SRC}/cont.h
    ${ARDUINO_SRC}/xtruntime-frames.h
    ${ARDUINO_SRC}/core_esp8266_features.h
    ${ARDUINO_SRC}/core_esp8266_non32xfer.h
    ${ARDUINO_SRC}/core_esp8266_version.h
    ${ARDUINO_SRC}/core_esp8266_waveform.h
    ${ARDUINO_SRC}/core_esp8266_waveform_phase.h
    ${ARDUINO_SRC}/core_esp8266_waveform_pwm.h
    ${ARDUINO_SRC}/core_version.h
    ${ARDUINO_SRC}/coredecls.h
    ${ARDUINO_SRC}/Crypto.h
    ${ARDUINO_SRC}/debug.h
    ${ARDUINO_SRC}/eboot_command.h
    ${ARDUINO_SRC}/Esp.h
    ${ARDUINO_SRC}/esp8266_peri.h
    ${ARDUINO_SRC}/esp8266_undocumented.h
    ${ARDUINO_SRC}/flash_hal.h
    ${ARDUINO_SRC}/flash_quirks.h
    ${ARDUINO_SRC}/HardwareSerial.h
    ${ARDUINO_SRC}/gdb_hooks.h
    ${ARDUINO_SRC}/FSImpl.h
    ${ARDUINO_SRC}/FunctionalInterrupt.h
    ${ARDUINO_SRC}/flash_utils.h
    ${ARDUINO_SRC}/twi.h
    ${ARDUINO_SRC}/twi_util.h
    ${ARDUINO_SRC}/TZ.h
    ${ARDUINO_SRC}/TypeConversion.h
    ${ARDUINO_SRC}/uart.h
    ${ARDUINO_SRC}/Udp.h
    ${ARDUINO_SRC}/Updater.h
    ${ARDUINO_SRC}/Updater_Signing.h
    ${ARDUINO_SRC}/user_config.h
    ${ARDUINO_SRC}/WCharacter.h
    ${ARDUINO_SRC}/wiring_private.h
    ${ARDUINO_SRC}/wl_definitions.h
    ${ARDUINO_SRC}/WString.h
    ${ARDUINO_SRC}/FS.h
    ${ARDUINO_SRC}/i2s.h
    ${ARDUINO_SRC}/interrupts.h
    ${ARDUINO_SRC}/IPAddress.h
    ${ARDUINO_SRC}/LwipDhcpServer.h
    ${ARDUINO_SRC}/LwipIntf.h
    ${ARDUINO_SRC}/LwipIntfDev.h
    ${ARDUINO_SRC}/pgmspace.h
    ${ARDUINO_SRC}/PolledTimeout.h
    ${ARDUINO_SRC}/Print.h
    ${ARDUINO_SRC}/Server.h
    ${ARDUINO_SRC}/spi_flash_defs.h
    ${ARDUINO_SRC}/mmu_iram.h
    ${ARDUINO_SRC}/Schedule.h
    ${ARDUINO_SRC}/sigma_delta.h
    ${ARDUINO_SRC}/spi_vendors.h
    ${ARDUINO_SRC}/Printable.h
    ${ARDUINO_SRC}/spi_utils.h
    ${ARDUINO_SRC}/Stream.h
    ${ARDUINO_SRC}/spiffs_api.h
    ${ARDUINO_SRC}/stdlib_noniso.h
    ${ARDUINO_SRC}/StackThunk.h
    ${ARDUINO_SRC}/StreamString.h
    ${ARDUINO_SRC}/md5.h
    ${ARDUINO_SRC}/MD5Builder.h

    ${ARDUINO_SRC}/abi.cpp
    ${ARDUINO_SRC}/base64.cpp
    ${ARDUINO_SRC}/cbuf.cpp
    ${ARDUINO_SRC}/cont_util.cpp
    ${ARDUINO_SRC}/core_esp8266_app_entry_noextra4k.cpp
    ${ARDUINO_SRC}/core_esp8266_eboot_command.cpp
    ${ARDUINO_SRC}/core_esp8266_features.cpp
    ${ARDUINO_SRC}/core_esp8266_flash_quirks.cpp
    ${ARDUINO_SRC}/core_esp8266_flash_utils.cpp
    ${ARDUINO_SRC}/core_esp8266_i2s.cpp
    ${ARDUINO_SRC}/core_esp8266_main.cpp
    ${ARDUINO_SRC}/core_esp8266_non32xfer.cpp
    ${ARDUINO_SRC}/core_esp8266_noniso.cpp
    ${ARDUINO_SRC}/core_esp8266_phy.cpp
    ${ARDUINO_SRC}/core_esp8266_postmortem.cpp
    ${ARDUINO_SRC}/core_esp8266_si2c.cpp
    ${ARDUINO_SRC}/core_esp8266_sigma_delta.cpp
    ${ARDUINO_SRC}/core_esp8266_spi_utils.cpp
    ${ARDUINO_SRC}/core_esp8266_timer.cpp
    ${ARDUINO_SRC}/core_esp8266_waveform_phase.cpp
    ${ARDUINO_SRC}/core_esp8266_waveform_pwm.cpp
    ${ARDUINO_SRC}/core_esp8266_wiring.cpp
    ${ARDUINO_SRC}/core_esp8266_wiring_analog.cpp
    ${ARDUINO_SRC}/core_esp8266_wiring_digital.cpp
    ${ARDUINO_SRC}/core_esp8266_wiring_pulse.cpp
    ${ARDUINO_SRC}/core_esp8266_wiring_pwm.cpp
    ${ARDUINO_SRC}/core_esp8266_wiring_shift.cpp
    ${ARDUINO_SRC}/crc32.cpp
    ${ARDUINO_SRC}/Crypto.cpp
    ${ARDUINO_SRC}/debug.cpp
    ${ARDUINO_SRC}/Esp.cpp
    ${ARDUINO_SRC}/Esp-frag.cpp
    ${ARDUINO_SRC}/Esp-version.cpp
    ${ARDUINO_SRC}/flash_hal.cpp
    ${ARDUINO_SRC}/FS.cpp
    ${ARDUINO_SRC}/FSnoop.cpp
    ${ARDUINO_SRC}/FunctionalInterrupt.cpp
    ${ARDUINO_SRC}/gdb_hooks.cpp
    ${ARDUINO_SRC}/HardwareSerial.cpp
    ${ARDUINO_SRC}/heap.cpp
    ${ARDUINO_SRC}/IPAddress.cpp
    ${ARDUINO_SRC}/libc_replacements.cpp
    ${ARDUINO_SRC}/LwipDhcpServer.cpp
    ${ARDUINO_SRC}/LwipDhcpServer-NonOS.cpp
    ${ARDUINO_SRC}/LwipIntf.cpp
    ${ARDUINO_SRC}/LwipIntfCB.cpp
    ${ARDUINO_SRC}/MD5Builder.cpp
    ${ARDUINO_SRC}/mmu_iram.cpp
    ${ARDUINO_SRC}/Print.cpp
    ${ARDUINO_SRC}/Schedule.cpp
    ${ARDUINO_SRC}/spiffs_api.cpp
    ${ARDUINO_SRC}/sqrt32.cpp
    ${ARDUINO_SRC}/StackThunk.cpp
    ${ARDUINO_SRC}/Stream.cpp
    ${ARDUINO_SRC}/StreamString.cpp
    ${ARDUINO_SRC}/time.cpp
    ${ARDUINO_SRC}/Tone.cpp
    ${ARDUINO_SRC}/TypeConversion.cpp
    ${ARDUINO_SRC}/uart.cpp
    ${ARDUINO_SRC}/Updater.cpp
    ${ARDUINO_SRC}/WMath.cpp
    ${ARDUINO_SRC}/WString.cpp

    ${ARDUINO_SRC}/exc-c-wrapper-handler.S
    ${ARDUINO_SRC}/cont.S
)

target_include_directories(arduino PUBLIC
    ${ARDUINO_ESP8266_DIR}/tools/sdk/include
    ${ARDUINO_ESP8266_DIR}/tools/sdk
    ${ARDUINO_ESP8266_DIR}/cores/esp8266
    ${ARDUINO_ESP8266_DIR}/variants/generic
)

target_compile_definitions(arduino PUBLIC
    -DF_CPU=80000000L
    -DARDUINO=10606
    -DARDUINO_ESP8266_ESP01
    -DARDUINO_ARCH_ESP8266
    -DESP8266
    -DLWIP_OPEN_SRC
)

target_compile_options(arduino PUBLIC
    -U__STRICT_ANSI__
)

target_link_libraries(arduino PUBLIC
    ESP8266_SDK
)

# add_subdirectory(libraries)

set_target_properties(firmware PROPERTIES
    LINK_FLAGS "-L${ARDUINO_ESP8266_DIR}/tools/sdk/ld -Teagle.flash.512k0.ld -u call_user_start -Wl,-wrap,system_restart_local -Wl,-wrap,register_chipv6_phy"
)

add_custom_target(
    firmware_binary ALL
    COMMAND ${ESP8266_ESPTOOL} -eo ${ARDUINO_ESP8266_DIR}/bootloaders/eboot/eboot.elf -bo firmware.bin -bf 40 -bz ${ESP8266_FLASH_SIZE} -bs .text -bp 4096 -ec -eo $<TARGET_FILE:firmware> -bs .irom0.text -bs .text -bs .data -bs .rodata -bc -ec
)
set_directory_properties(PROPERTIES ADDITIONAL_MAKE_CLEAN_FILES firmware.bin)

add_dependencies(firmware_binary firmware)

add_custom_target(flash COMMAND ${ESP8266_ESPTOOL} -vv -cd ck -cb 115200 -cp ${ESP8266_ESPTOOL_COM_PORT} -ca 0x00000 -cf firmware.bin)

add_dependencies(flash firmware_binary)
