import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: root
    width: 640
    height: 480
    screen: Qt.application.screens[0]
    visible: true
    title: qsTr("Center console")
    property bool naviStarted: false

    StackView {
        id: centerConsoleStack
        initialItem: centerView
        anchors.fill: parent
    }

    Component {
        id: centerView
        Rectangle {
            id: centerRect
            width: root.width
            height: root.height
            color: "black"//"grey"

            Button {
                id: naviButton
                anchors.bottom: parent.bottom
                width: 160
                height: 50
                text: window.naviStarted ? qsTr("Close Navigator") : qsTr("Open Navigator")
                opacity: 1
                onClicked: {
                    window.naviStarted ? navigatorLoader.source = "" : navigatorLoader.source = "Navigator.qml"
                    window.naviStarted = !window.naviStarted
                    //Backend.updatePosition() //TODO
                }
            }
        }
    }

    Loader {
        id: navigatorLoader

    }

}
