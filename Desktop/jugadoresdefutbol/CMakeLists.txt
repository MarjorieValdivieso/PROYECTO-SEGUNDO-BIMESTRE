cmake_minimum_required(VERSION 3.16)

project(RegistroJugadores VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Widgets)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Widgets)

set(PROJECT_SOURCES
    src/main.cpp
    src/mainwindow.cpp
    src/mainwindow.h
    ui/mainwindow.ui
    src/jugador.h
    src/jugador.cpp
    src/jugadorrepository.h
    src/jugadorrepository.cpp
)

qt_add_executable(RegistroJugadores
    ${PROJECT_SOURCES}
    ui/login.h ui/login.cpp ui/login.ui
)

target_link_libraries(RegistroJugadores PRIVATE Qt${QT_VERSION_MAJOR}::Widgets)

