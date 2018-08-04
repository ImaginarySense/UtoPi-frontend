import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick 2.11

Window {
    visible: true
    color: "#FFFFFF"	//default bkg color is white
    width: 264
    height: 176
    title: headerText

//    KeyHandler {
//        id: handleKeys
//    }
    // Menu UI Properties
    property int iconH: 62
    property int iconW: 68
    // Possible Values
    property var possibleAction: ({status:0, report:1})
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

    // CURRENT VALUES
    property int currentScreen:  0
    property int currentMenu:  0
    property int currentAction:  0
    property int currentStatus:  0
    property string headerText: "Utopi: Emergency Computer"

    // LAYOUT
    // Split Header from screen Bodies
    ColumnLayout {
        id: view
        spacing: 0
        // HEADER
        Rectangle {
            id: header
            Layout.alignment: Qt.AlignCenter
            width: Window.width
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
            currentScreen = 0
            currentMenu = 0
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
