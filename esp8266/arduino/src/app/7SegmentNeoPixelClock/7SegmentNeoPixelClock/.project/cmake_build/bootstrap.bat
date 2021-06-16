@echo off

set CROSS_COMPILE=xtensa
set GENERATOR="Unix Makefiles"
set CMAKE_TOOLCHAIN_FILE="CMAKE_TOOLCHAIN_FILE=..\..\..\..\..\..\cmake\compilers\toolchain-esp8266-xtensa.cmake"

mkdir build-%CROSS_COMPILE%
cd build-%CROSS_COMPILE%
cmake -G%GENERATOR% -D%CMAKE_TOOLCHAIN_FILE% ..\..\..\..\..\..\
echo "'build-%CROSS_COMPILE%' directory created!"
