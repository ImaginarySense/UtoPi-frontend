// Copyright 2018 Imaginary Sense <support@imaginary.tech>
// Copyright 2018 María A. Cordero Pérez <maria@imaginary.tech>
// Copyright 2018 Javier O. Cordero Pérez <javier@imaginary.tech>
// Copyright 2018 Victor A. Ortiz Alvarado <va2ron1@imaginary.tech>
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
                  headerText = "Utopi: Generate Report"
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
                headerText = "Utopi: Find Nearby..."
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
                currentAction = possibleAction.config
                headerText = "Utopi: Settings"
            }
        }
    }


}
