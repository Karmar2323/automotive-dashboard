import QtQuick

Item {
    id: root
    width: 48
    height: 48

    property bool turnOnVisible: false
    property bool blinkOn: true
    property string imageOff: "images/Icon_TurnLeft_OFF.png"
    property string imageOn: "images/Icon_TurnLeft_ON.png"
    property bool turnTimerRunning: true


    Timer{
        id: turnTimer
        interval: 500
        repeat: true
        running: turnTimerRunning
        onTriggered: {
            root.turnOnVisible = !root.turnOnVisible
        }
    }

    Image {
        id: turnImage
        source:
            root.blinkOn && root.turnOnVisible ? imageOn : imageOff
        //Backend.blinkOn  && Backend.turnOnVisible ? imageOn : imageOff //Backend version

    }
}
