import QtQuick
import kevytkojelauta

Item {
    id: root

    property string mapSource: "images/kisspng-line-point-map-street-map.png" //("kisspng-line-point-map-street-map.png" from: <https://www.subpng.com/png-egtfxq/>. License: This file was uploaded by Dbrij11 and Free for personal use only)
    property int direction: 90
    property int mapWidth: 1218
    property int mapHeight: 1018
    property int xPosition: setMapPosition(Backend.carPosition[0]) * mapWidth
    property int yPosition: setMapPosition(Backend.carPosition[1]) * mapHeight

    Image {
        id: naviMap
        source: mapSource
        width: mapHeight * 0.5
        height: mapHeight * 0.5

        asynchronous: true

        Image {
            id: carPosition
            source: "images/CarInfoIcon.png"
            x: xPosition
            y: yPosition
            asynchronous: true
            scale: 0.25
            rotation: direction

        }
    }

    function setMapPosition (valueIn) {
        /*simulate position calculation from float to int*/
        /*simply take the fraction part*/
        var valueOut = Math.round(valueIn)
        if (valueOut <= valueIn) {
            return valueIn - valueOut //
        } else if (valueOut >= valueIn) {
            return valueIn - valueOut + 1
        } else return valueOut
    }


}


