cmake_minimum_required(VERSION 3.6)
project(Laurux_Qt)

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)
# Instruct CMake to run moc automatically when needed.
set(CMAKE_AUTOMOC ON)
# As moc files are generated in the binary dir, tell CMake
# to always look for includes there:
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Widgets finds its own dependencies (QtGui and QtCore).
find_package(Qt5Widgets REQUIRED)
# The Qt5Widgets_INCLUDES also includes the include directories for
# dependencies QtCore and QtGui
include_directories(${Qt5Widgets_INCLUDES})

## We need add -DQT_WIDGETS_LIB when using QtWidgets in Qt 5.
#add_definitions(${Qt5Widgets_DEFINITIONS})
#
## Executables fail to build with Qt 5 in the default configuration
## without -fPIE. We add that here.
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${Qt5Widgets_EXECUTABLE_COMPILE_FLAGS}")
#
find_package(Qt5Qml REQUIRED)
#include_directories(${Qt5Qml_INCLUDES})
#add_definitions(${Qt5Qml_DEFINITIONS})
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${Qt5Qml_EXECUTABLE_COMPILE_FLAGS}")
#
find_package(Qt5Quick)
#find_package(Qt5Quick REQUIRED)
#include_directories(${Qt5Quick_INCLUDES})
#add_definitions(${Qt5Quick_DEFINITIONS})
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${Qt5Quick_EXECUTABLE_COMPILE_FLAGS}")
#
find_package(Qt5Multimedia)
#find_package(Qt5Multimedia REQUIRED)
#include_directories(${Qt5Multimedia_INCLUDES})
#add_definitions(${Qt5Multimedia_DEFINITIONS})
#set(QT_USE_QTMULTIMEDIA TRUE)
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${Qt5Multimedia_EXECUTABLE_COMPILE_FLAGS}")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
#set(CMAKE_CXX_STANDARD 14)

set(SOURCE_FILES
        src/settings.cpp
        main.cpp
        )

qt5_add_resources(UI_RESOURCES qml.qrc)

add_executable(Laurux_Qt ${SOURCE_FILES} ${UI_RESOURCES})
qt5_use_modules(Laurux_Qt Widgets Qml Quick Multimedia)
target_link_libraries(Laurux_Qt Qt5::Widgets Qt5::Qml Qt5::Quick Qt5::Multimedia)
## The Qt5Widgets_LIBRARIES variable also includes QtGui and QtCore
#target_link_libraries(Laurux_Qt ${Qt5Widgets_LIBRARIES})