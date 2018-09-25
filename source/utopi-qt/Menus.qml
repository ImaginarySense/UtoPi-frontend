// Copyright 2018 Imaginary Sense <support@imaginary.tech>
// Copyright 2018 Victor A. Ortiz Alvarado <va2ron1@imaginary.tech>
// Copyright 2018 María A. Cordero Pérez <maria@imaginary.tech>
// Copyright 2018 Javier O. Cordero Pérez <javier@imaginary.tech>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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

    function menuItemClicked(index) {
        // Determine button action s
        if (currentAction===possibleAction.status && currentMenu>0) {
            currentScreen = 2;
            console.log('INDEX: ' + index)
            currentReport = sourceData[index].screen
        }
        else if (currentAction===possibleAction.report && currentMenu>0) {
            currentScreen = 3;
        }
        else {
            currentMenu = sourceData[index].screen;
        }
        console.log("Loading: sourceData[index].screen", sourceData[index].screen);
    }
}
