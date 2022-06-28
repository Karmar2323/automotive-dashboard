import QtQuick
import kevytkojelauta


Image {
    id: root//speedGaugeImage

    height: parent.height
    fillMode: Image.PreserveAspectFit
    source: "images/Gauge_Speed.png"

    Image {

        id: speedGaugeNeedle
        width: 180
        source: "images/gaugeNeedleSmall.png"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -45

        transform: Rotation {
            id: needleRotation
            origin.x: 134//180 - (180-67-67)//x: 67, y: 16 in original 90x33 image
            origin.y: 16
            angle: -90 + 320 * Backend.speed/270

        }

    }


    Image {
        id: fuelNeedle
        source: "images/heatNeedle.png"
        x: 240 * 1.01 + Backend.fuel * 50  * 0.0101 //fuel F...E equals 295...245 (-50 steps)
        y: 255 - Backend.fuel * 71 * 0.0101//fuel F...E equals 185...256 (+71 steps)
        width: 42

        transform: Rotation {
            origin.x: -5 //39 x 27 image
            origin.y: 13
            angle: 56 - Backend.fuel * 37 * 0.01  // F...E: from 19 to 56 (+37)//
        }

    }

    Image {
        id: outerRing
        source: "images/Gauge_Speed_ring.png"
        width: root.width
        height: root.height
        anchors.verticalCenter: root.verticalCenter
        anchors.horizontalCenter: root.horizontalCenter
    }

    Image {
        id: fuelWarning
        source: "images/Icon_Fuel_ON_small.png"
        x: 220
        y: 188
        opacity: 4.5 / Backend.fuel
    }


}



