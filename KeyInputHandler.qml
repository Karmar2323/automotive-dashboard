import QtQuick
import kevytkojelauta

Item  {
    id: root
    anchors.fill: parent
    focus: true



    Keys.onPressed: (event)=> {

                        switch (event.key) {
                            case Qt.Key_1:
                            Backend.startBlinking(Backend.Left)
                            if (!indicatorPanel.turnLeftTimerRunning) {
                                //Stop blinking to show off-image
                                indicatorPanelLeftVisible = !indicatorPanelLeftVisible

                            }
                            break

                            case Qt.Key_2:
                            //indicatorPanel.parkinBrakeVisible = !indicatorPanel.parkinBrakeVisible
                            Backend.parkingBrakeOn = !Backend.parkingBrakeOn
                            console.log("2 - Parking brake")
                            break

                            case Qt.Key_3:
                            console.log("3 - Speed")
                            Backend.startSpeed() // Backend version
                            break

                            case Qt.Key_4:
                            Backend.startBlinking(Backend.Right)
                            if (!indicatorPanel.turnRightTimerRunning) {
                                //Stop blinking to show off-image
                                indicatorPanelRightVisible = !indicatorPanelRightVisible
                            }
                            break

                            case Qt.Key_5:
                            Backend.startBlinking(Backend.All)
                            //Stop blinking to show off-image
                            if (!indicatorPanel.turnRightTimerRunning) {
                                indicatorPanelRightVisible = !indicatorPanelRightVisible
                            }

                            //Stop blinking to show off-image
                            if (!indicatorPanel.turnLeftTimerRunning) {
                                indicatorPanelLeftVisible = !indicatorPanelLeftVisible
                            }
                            break

                            case Qt.Key_6:
                            Backend.startFuel()
                            console.log("Backend.fuel: ", Backend.fuel)
                            break

                            default:
                            console.log("any key pressed")

                        }
                        //event.accepted = true; //not required
                    }


}
