cmake_minimum_required(VERSION 3.16)

project(RegistroJugadores VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Widgets)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Widgets)

# Se han agregado los prefijos src/ y ui/ para que coincidan con tu estructura de carpetas
set(PROJECT_SOURCES
        src/login.cpp
        src/login.h
        src/main.cpp
        src/mainwindow.cpp
        src/mainwindow.h
        src/jugador.h
        src/jugador.cpp
        src/jugadorrepository.h
        src/jugadorrepository.cpp

        ui/mainwindow.ui
        ui/login.ui
)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(RegistroJugadores
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES}
        src/login.h src/login.cpp src/login.ui
    )
else()
    if(ANDROID)
        add_library(RegistroJugadores SHARED
            ${PROJECT_SOURCES}
        )
    else()
        add_executable(RegistroJugadores
            ${PROJECT_SOURCES}
        )
    endif()
endif()

target_link_libraries(RegistroJugadores PRIVATE Qt${QT_VERSION_MAJOR}::Widgets)

if(${QT_VERSION} VERSION_LESS 6.1.0)
  set(BUNDLE_ID_OPTION MACOSX_BUNDLE_GUI_IDENTIFIER com.example.RegistroJugadores)
endif()

set_target_properties(RegistroJugadores PROPERTIES
    ${BUNDLE_ID_OPTION}
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

include(GNUInstallDirs)
install(TARGETS RegistroJugadores
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

if(QT_VERSION_MAJOR EQUAL 6)
    qt_finalize_executable(RegistroJugadores)
endif()
