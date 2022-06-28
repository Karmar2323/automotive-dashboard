import QtQuick

Image {
    id: root
    height: parent.height// * 0.6
    fillMode: Image.PreserveAspectFit

    source: "images/Gauge_RPM.png"


    Image {
        id: gaugeNeedle
        width: 180
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -45
        anchors.verticalCenter: parent.verticalCenter
        source: "images/gaugeNeedleSmall.png"
    }

    Image {
        id: batteryNeedle
        source: "images/heatNeedle.png"
        x: 235
        y: 180
        transform: Rotation {
            origin.x: 39//134
            origin.y: 13//16
            angle: 26
        }

    }

    Image {
        id: heatNeedle
        source: "images/heatNeedle.png"
        x: -8
        y: 212
        transform: Rotation {
            origin.x: 39//134
            origin.y: 13//16
            angle: 145
        }

    }

}


