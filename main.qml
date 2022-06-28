import QtQuick
import kevytkojelauta


Window {
    id: window
    width: 960
    height: 480
    visible: true
    x: 0
    y: 0


    property bool naviStarted: false
    property string carImageSource: "images/CarInfoIcon.png"
    property string infoText: qsTr("Dashboard control keys: 1 turn left, 2 p-brake, 3 Speed, 4 turn right, 5 blink lights, 6 fuel")
    title: qsTr(infoText)



    KeyInputHandler {
        id: keyInputHandler
    }


    CenterConsole {
        x: window.width + 24//window.x + window.height
        y: 24//window.height + 48

        KeyInputHandler {}


    }

    Rectangle {
        id: backgroundRect
        anchors.fill: parent
        gradient: Gradient{

            GradientStop{position: 0.0; color:   "lightgrey"}
            GradientStop{position: 0.7; color:   "black"}
        }
    }



    Gauges {
        id: rpmBatteryGauge
        width: backgroundRect.height * 0.6
        height: backgroundRect.height  * 0.6

        anchors.verticalCenter: window.contentItem.verticalCenter
        anchors.left: window.contentItem.left

    }


    SpeedFuelGauge {
        id: speedFuelGauge
        height: window.height * 0.7
        width: window.height * 0.7
        anchors.horizontalCenter: window.contentItem.horizontalCenter
        anchors.verticalCenter: window.contentItem.verticalCenter


    }


    Item {
        Loader {
            id: dashNavi
            source: window.naviStarted ? "Navigator.qml" : "CarInfo.qml" //set source from center console

            x: window.naviStarted ? window.width - (window.width * 0.166 + 146 * 0.75) : window.width - (window.width * 0.166 + 146 * 0.5)
            y: window.naviStarted ? window.height * 0.1 : window.height * 0.5 - 48
            scale: 0.8
            opacity: 0.8

            states: [
                State {
                    name: "naviOff"
                    when: !window.naviStarted

                },

                State {
                    name: "naviOn"
                    when: window.naviStarted

                },

                State {
                    name: "tempState"

                }

            ]

            transitions: Transition {
                from: "naviOff"
                to: "naviOn" //"*"

                PropertyAnimation  {
                    target: dashNavi
                    property: "opacity"
                    from: 0
                    to: 0.8
                }

            }


        }
    }

    IndicatorPanel{

        id: indicatorPanel
        anchors.horizontalCenter: window.contentItem.horizontalCenter

    }


}
