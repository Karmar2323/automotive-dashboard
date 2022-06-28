cmake_minimum_required(VERSION 3.16)

project(kevytkojelauta VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appkevytkojelauta

    backend.h

    main.cpp
    backend.cpp


)


qt_add_qml_module(appkevytkojelauta
    URI kevytkojelauta
    VERSION 1.0
    QML_FILES
    main.qml
    CarInfo.qml
    CenterConsole.qml
    Gauges.qml
    IndicatorPanel.qml
    KeyInputHandler.qml
    Navigator.qml
    SpeedFuelGauge.qml
    TurnIndicator.qml




    RESOURCES
    images/CarInfoIcon.png
    images/Icon_Fuel_ON_small.png
    images/Gauge_RPM.png
    images/Gauge_Speed.png
    images/Gauge_Speed_ring.png
    images/gaugeNeedleSmall.png
    images/heatNeedle.png
    images/Icon_TurnLeft_ON.png
    images/Icon_TurnLeft_OFF.png
    images/Icon_ParkingBrake_OFF.png
    images/Icon_ParkingBrake_ON.png

    images/kisspng-line-point-map-street-map.png
    images/turnright_on.png
    images/turnright_off.png

)

set_target_properties(appkevytkojelauta PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(appkevytkojelauta
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(appkevytkojelauta
    PRIVATE Qt6::Quick)
