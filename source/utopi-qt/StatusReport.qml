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
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {

    property var textData: []

    ColumnLayout {
        x:13
        y:0
        width: Window.width
        height: Window.height-31

        Label {
            x:14
            y:33
            height: 15
            text: "Which status best describes the situation?"
            font.pixelSize: 12

        }

        GroupBox {
            x: 14
            y: 46
            ColumnLayout {

                ExclusiveGroup { id:roadPosGroup }

                Repeater {
                    id: radioLayout
                    model: textData.length
                    delegate: RadioButton {
                            text: textData[index].textMsg
                            checked: false
                            exclusiveGroup: roadPosGroup

                        onClicked: {
                            menuItemClicked(index)
                        }
                    }
                }
            }
        }
    }
}
