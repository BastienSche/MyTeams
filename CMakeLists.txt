cmake_minimum_required(VERSION 3.8.2)

project (babel VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 14)
#set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(${CMAKE_SOURCE_DIR}/build/conanbuildinfo.cmake)
conan_basic_setup()

# Turn on automatic invocation of the MOC, UIC & RCC
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

file(GLOB CLIENT_SRC
   client/*.hpp
   client/*.cpp
   client/*.h
)

file(GLOB SERVER_SRC
   server/*.cpp
   server/*.hpp
)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -pthread")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR})
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Make this a GUI application on Windows
if(WIN32)
    set(CMAKE_WIN32_EXECUTABLE ON)
endif()

find_package(Qt6 REQUIRED COMPONENTS Core)
find_package(Qt6 REQUIRED COMPONENTS Widgets)
find_package(Qt6 REQUIRED COMPONENTS Network)

if (APPLE)
   find_package(portaudio)
   find_package(opus)
endif()

add_executable(babel_client ${CLIENT_SRC})
add_executable(babel_server ${SERVER_SRC})

if(UNIX AND NOT APPLE)
   target_link_libraries(babel_client ${CONAN_LIBS})
   target_link_libraries(babel_server ${CONAN_LIBS})
endif()

if(APPLE)
   target_link_libraries(babel_client Qt6::Core Qt6::Network Qt6::Widgets portaudio opus)
   target_link_libraries(babel_server sqlite3)
endif()