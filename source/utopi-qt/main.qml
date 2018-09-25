// Copyright 2018 Imaginary Sense <support@imaginary.tech>
// Copyright 2018 Javier O. Cordero Pérez <javier@imaginary.tech>
// Copyright 2018 María A. Cordero Pérez <maria@imaginary.tech>
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

import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick 2.11

Window {
    visible: true
    color: "#FFFFFF"	//default bkg color is white
    width: 360 // width: 264
    height: 215 // height: 176
    title: headerText

//    KeyHandler {
//        id: handleKeys
//    }
    // Menu UI Properties
    property int iconH: 62
    property int iconW: 68
    // BEGIN FINITE STATE MACHINE STATES
    // 1st menu layer, select action to perform
    property var possibleAction: ({status: 1, report: 2, config: 3})
    // 2nd menu layer, select type of report
    property var possibleReport: ({
        "roadblock": {
            "id": 0,
            "statuses": validStatus.road
        },
        "landfall": {
            "id": 1,
            "statuses": validStatus.road
        },
        "flood": {
            "id": 2,
            "statuses": validStatus.road
        },
        "foodPlace": {
            id: 10,
            "statuses": validStatus.place
        },
        "foodAid": {
            "id": 11,
            "statuses": validStatus.place
        },
        "waterService": {
            "id": 20,
            "statuses": validStatus.services
        },
        "waterOasis": {
            "id": 21,
            "statuses": validStatus.place
        },
        "powerService": {
            "id": 30,
            "statuses": validStatus.services
        },
        "gasStation": {
            "id": 31,
            "statuses": validStatus.place
        },
        "hospital": {
            "id": 40,
            "statuses": validStatus.place
        },
        "doctor": {
            "id": 41,
            "statuses": validStatus.place
        },
        "pharmacy": {
            "id": 42,
            "statuses": validStatus.place
        },
        "dyalisis": {
            "id": 43,
            "statuses": validStatus.place
        },
        "shelter": {
            "id": 50,
            "statuses": validStatus.place
        }
    })
    // 3rd menu layer, select among possible statuses
    property var validStatus: ({
        //Status subMenu Road Index 1
        roads: [
            {
                "textMsg" : "Collapsed",
            },
            {
                "textMsg" : "Blocked"
            },
            {
                "textMsg" : "Partially blocked"
            },
            {
                "textMsg" : "Clear"
            }
        ],
        //Status subMenu ____ Buisiness Index 2
        business: [
            {
                "textMsg" : "Opened for business",
            },
            {
                "textMsg" : "Out of service"
            }
            ],
                //Status subMenu Gas Index 3
        gas: [
            {
                "textMsg" : "Opened for business",
            },
            {
                "textMsg" : "Out of Gas"
            },
            {
                "textMsg" : "Out of Service"
            }
        ],
        //Status subMenu _____ Services Index 4
        services: [
            {
                "textMsg" : "Services are online",
            },
            {
                "textMsg" : "Unstable Service"
            },
            {
                "textMsg" : "Ther is an outage"
            }
        ]
    })
    // END FINITE STATE MACHINE STATES
    // BEGIN MENU UI DEFINITIONS
    property var menuProperties: [
        //Menus index 0
        [{
             "imageUrl": "qrc:/images/Roads.png",
             "screen": 1 //roads

         },
         {
             "imageUrl": "qrc:/images/Food.png",
             "screen": 2

         },
         {
             "imageUrl": "qrc:/images/Water.png",
             "screen" : 3,
             "serviceType" : "Water"

         },
         {
             "imageUrl": "qrc:/images/Power.png",
             "screen" : 4,
             "serviceType" : "Power"
         },
         {
             "imageUrl": "qrc:/images/Health.png",
             "screen" : 5
         },
         {
             "imageUrl": "qrc:/images/Shelter.png",
             "screen" : 6,
             "serviceType" : "Shelter"
         }
        ],

        //SubMenu Road  Index 1
        [{
            "imageUrl": "qrc:/images/BlockedRoad.png"
         },
         {
             "imageUrl": "qrc:/images/Landfall.png"
         },
         {
             "imageUrl": "qrc:/images/Flood.png"
         }
        ],
        //SubMenu Food Index 2
        [{
             "imageUrl": "qrc:/images/Place.png",
             "businessType" : "Food"

         },
         {
             "imageUrl": "qrc:/images/FoodAid.png",
             "serviceType" : "Food"
         }
        ],

        //SubMenu Water  Index 3
        [{
             "imageUrl": "qrc:/images/Oasis.png",
             "serviceType" : "Water"

         },
         {
             "imageUrl": "qrc:/images/SvcProviders.png",
             "serviceType" : "Water"
         }
        ],

        //SubMenu  Power  Index 4
        [{
             "imageUrl": "qrc:/images/Gas.png"
         },
         {
             "imageUrl": "qrc:/images/ChrgStation.png"
         },
         {
             "imageUrl": "qrc:/images/SvcProvidersE.png"
         }
        ],

        //SubMenu  Health  Index 5
        [{
             "imageUrl": "qrc:/images/Hospital.png",
             "serviceType" : "Hospital"
         },
         {
             "imageUrl": "qrc:/images/Doctors.png",
             "serviceType" : "Doctors"
         },
         {
             "imageUrl": "qrc:/images/Pharmacies.png",
             "businessType" : "Pharmacies"
         },
         {
             "imageUrl": "qrc:/images/Dialysis.png",
             "serviceType" : "Dialysis"
         }
        ],

        //SubMenu  Health  Index 6
        [{
             "imageUrl": "qrc:/images/ShelterHome.png",
             "serviceType" : "Food"
         }
        ]
    ]

    // CURRENT STATES
    property int currentScreen:  0
    property int currentMenu:  0
    property int currentAction:  0
    property int currentReport:  0
    property int currentStatus:  0
    property string headerText: "UtoPi: Emergency Computer"

    // VIEW LAYOUT
    // Split Header from screen bodies
    ColumnLayout {
        id: view
        spacing: 0
        // HEADER
        Rectangle {
            id: header
            Layout.alignment: Qt.AlignLeft
            width: 264 // Window.width
            height: 31
            border.color: "black"
            border.width: 4
            color: "white"
            Text {
                x: 8
                y: 8
                id: hText
                text: headerText
            }
        }
        // BODY
        StackLayout {
            id: views
            currentIndex: currentScreen
            width: Window.width
            height: 176-31 // Window.height-31
            // SCREEN SELECTION
            InitialScreen {
                id: initialScreen
            }
            Menus {
                id: menus
                sourceData: menuProperties[currentMenu]
            }
            StatusReport {
                id: statusReport
                textData: validStatus[currentStatus]
            }
//            GPS {
//                id: gps
//            }
            Find {
                id: find
            }
            Settings {
                id: settings
            }
        }
    }
    // DEBUGGING UI
    Button {
        id: fast
        x: 0
        y: 176
        text: "Reset"
        onClicked: {
            fullRefresh();
            headerText = 'UtoPi: Emergency Computer'
            currentAction = 0
            currentScreen = 0
            currentMenu = 0
            currentReport = 0
            currentStatus = 0
        }
    }
    Button {
        id: partial
        x: 100
        y: 176
        text: "Fast"
        onClicked: {
            fastRefresh();
        }
    }
    Button {
        id: full
        x: 200
        y: 176
        text: "Full"
        onClicked: {
            fullRefresh();
        }
    }
    Label {
        text: "Current action: " + currentAction
        x: 264
        y: 0+31
        font.pixelSize: 10
    }
    Label {
        text: "Current screen: " + currentScreen
        x: 264
        y: 12+31
        font.pixelSize: 10
    }
    Label {
        text: "Current menu: " + currentMenu
        x: 264
        y: 24+31
        font.pixelSize: 10
    }
    Label {
        text: "Current report: " + currentReport
        x: 264
        y: 36+31
        font.pixelSize: 10
    }
    Label {
        text: "Current status: " + currentStatus
        x: 264
        y: 48+31
        font.pixelSize: 10
    }
    // GLOBAL FUNCTIONS: Screen Refresh
    function fastRefresh() {
        console.log('Fast Refresh');
        view.grabToImage(function (frame) {
            epd.fastRefresh(frame.image);
        });
    }
    function partialRefresh() {
        console.log('Partial Refresh');
        view.grabToImage(function (frame) {
            epd.partialRefresh(frame.image);
        });
    }
    function fullRefresh() {
        console.log('Full Refresh');
        view.grabToImage(function (frame) {
            epd.fullRefresh(frame.image);
        });
    }
}

//https://doc.qt.io/qt-5/qtqml-javascript-expressions.html
//http://doc.qt.io/qt-5/qquickitemgrabresult.html
