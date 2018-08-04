import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4


Item {
    property var sourceData: []
    Grid {
        id: grid
        x: 16
        y: 3
        width: Window.width
        height: Window.height-31
        columns: 3 ; columnSpacing: 14 //10
        rows: 2 ; rowSpacing: 3 //2

        // Buttons
        Repeater {
            id: buttonGrid
            model: sourceData.length
            delegate: Button {
                x: 16
                y: 34
                width: iconW
                height: iconH
                Image {
                    anchors.fill: parent
                    source: sourceData[index].imageUrl
                    fillMode: Image.PreserveAspectFit
                }

                onClicked: {
                    menuItemClicked(index)
                }
            }
        }

        // States
        states: [
            State {
                name: "Hovering" ; when: MouseArea.pressed
                PropertyChanges {
                    target: buttonGrid
                }
            }
        ]

    }

    function menuItemClicked(index){
        // Determine button action s
        if (currentAction===possibleAction.status && currentMenu>0) {
            currentScreen = 2;
//            else if (currentMenu!=1)
//                currentScreen = 2;
        }
        else if (currentAction===possibleAction.report && currentMenu>0) {
            currentScreen = 3;
//            else if (currentMenu==1)
//                currentScreen = 3;
        }
        else
            currentMenu = sourceData[index].screen;
//        console.log("button clicked: ", sourceData[index].screen);
    }
}
