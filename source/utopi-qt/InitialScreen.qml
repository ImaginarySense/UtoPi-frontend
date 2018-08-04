import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
//import QtQuick.Layouts 1.3

Item {
    Grid {
        x: 15
        y: 34
        width: Window.width
        height: Window.height-31
        columns: 3
        columnSpacing: 13

        Button {    //Menus
            id: statusReport
            width: iconW
            height: iconH
            Image {
                anchors.fill: parent
                source: "images/Status.png"
                fillMode: Image.PreserveAspectFit
            }
            onClicked:  {
                  currentScreen = 1
                  currentAction = possibleAction.status
                  headerText = "Utopi: Report..."
            }
        }

        Button {    //User Input
            id: inputReport
            width: iconW
            height: iconH
            Image {
                anchors.fill: parent
                source: "images/Report.png"
                fillMode: Image.PreserveAspectFit
            }
            onClicked:  {
                currentScreen = 1
                currentAction = possibleAction.report
                headerText = "Utopi: Status Report"
            }
        }

        Button {    //Device Configuration
            id: deviceConfig
            width: iconW
            height: iconH
            Image {
                anchors.fill: parent
                source: "images/Configure.png"
                fillMode: Image.PreserveAspectFit
            }
            onClicked:  {
                currentScreen = 3
                headerText = "Utopi: Settings"
            }
        }
    }


}
