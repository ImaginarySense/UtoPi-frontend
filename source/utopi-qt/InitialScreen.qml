import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
//import QtQuick.Layouts 1.3

Item {
    Grid {
        x: 10
        y: 14
        width: Window.width
        height: Window.height-31
        columns: 3
        columnSpacing: 10

        Button {    //Menus
            id: statusReport
            width: Window.width/3-15
            height: 117
            text: "Status"
            onClicked:  {
                  screen = 1
            }
        }

        Button {    //User Input
            id: inputReport
            width: Window.width/3-15
            height: 117
            text: "Input"
            onClicked:  {
                screen = 2
            }
        }

        Button {    //Device Configuration
            id: deviceConfig
            width: Window.width/3-15
            height: 117
            text: "Configuration"
            onClicked:  {
                screen = 3
            }
        }
    }


}
