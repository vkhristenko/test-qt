cmake_minimum_required(VERSION 3.16)
project(helloworld LANGUAGES C CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON) 
set(CMAKE_CXX_STANDARD 17) 
set(CMAKE_CXX_STANDARD_REQUIRED True)

include(${CMAKE_BINARY_DIR}/conan_paths.cmake)

find_package(Qt5 REQUIRED)

add_executable(helloworld src/main.cpp)
target_link_libraries(helloworld Qt5::Qt5)
