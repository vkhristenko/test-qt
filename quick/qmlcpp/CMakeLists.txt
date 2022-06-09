cmake_minimum_required(VERSION 3.16)
project(qmlcpp LANGUAGES C CXX)

include(${CMAKE_BINARY_DIR}/conan_paths.cmake)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON) 
set(CMAKE_CXX_STANDARD 17) 
set(CMAKE_CXX_STANDARD_REQUIRED True)

# for qt autogeneration
SET(CMAKE_AUTOMOC ON)
SET(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt5 REQUIRED)

add_executable(${CMAKE_PROJECT_NAME} 
    src/main.cpp
    src/data_entry_model.cpp src/data_entry_model.h
    src/qml.qrc
)
target_link_libraries(${CMAKE_PROJECT_NAME} Qt5::Qt5)
