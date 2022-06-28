import QtQuick
import kevytkojelauta

Item {
    id: root
    width: row.width
    height: row.height

    property alias indicatorLeftVisible: leftTurnIndicator.turnOnVisible
    property alias indicatorPanelRightVisible: rightTurnIndicator.turnOnVisible
    property alias turnLeftTimerRunning: leftTurnIndicator.turnTimerRunning
    property alias turnRightTimerRunning: rightTurnIndicator.turnTimerRunning

    Row {
        id: row
        width: 380
        height: 48
        spacing: (width - 3*48)/2


        TurnIndicator {
            id: leftTurnIndicator
            blinkOn: Backend.turnLeftOn

        }

        Image {

            id: parkinBrakeItem
            source: Backend.parkingBrakeOn ? "images/Icon_ParkingBrake_ON.png" : "images/Icon_ParkingBrake_OFF.png"
        }

        TurnIndicator {
            id: rightTurnIndicator
            imageOff:  "images/turnright_off.png"
            imageOn: "images/turnright_on.png"
            blinkOn: Backend.turnRightOn

        }


    }


}
