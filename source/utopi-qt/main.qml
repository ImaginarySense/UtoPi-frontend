import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Window {
    visible: true
    color: "#FFFFFF"	//default bkg color is white
    width: 264
    height: 176
    title: qsTr("Utopi: Emergency Computer")

    //constantVar
    property int iconH:62
    property int iconW: 68

    property int screen:  0
    property int currentMenu:  0
//    property int currentSubMenu: 0
    property int currentStatus: 0
    property string titles: "Utopi: Emergency Computer"
    property string headerText: ""

    property var statusProperties: [
        //Status subMenu Road Index 0
        [{
             "textMsg" : "Collapsed"
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
        [{
             "textMsg" : "Opened for business"
         },
         {
             "textMsg" : "Out of service"
         }
        ],

        //Status subMenu Gas Index 3
        [{
             "textMsg" : "Opened for business"
         },
         {
             "textMsg" : "Out of Gas"
         },
         {
             "textMsg" : "Out of Service"
         }
        ],

        //Status subMenu _____ Services Index 4
        [{
             "textMsg" : "Services are online"
         },
         {
             "textMsg" : "Unstable Service"
         },
         {
             "textMsg" : "Ther is an outage"
         }
        ]

    ]

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

//    property var subMenuProperties: [

    //]


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
                x:8
                y:8
                id: headerTxt
                text: qsTr(headerText)
            }


            Button {
                id: fast
                x: 0
                y: 176
                text: "Fast"
                onClicked: {
                    fastRefresh();
                    screen = 0
                    currentMenu = 0
                    currentStatus = 0
//                    currentSubMenu = 0
                }
            }
            Button {
                id: partial
                x: 100
                y: 176
                text: "Partial"
                onClicked: {
                    partialRefresh();
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

        }
        // BODY
        StackLayout {
            id: views
            currentIndex: screen
            width: Window.width
            height: 176-31 // Window.height-31


            InitialScreen {
                id: initialScreen
            }

            Menus {
                id: menus
                sourceData: menuProperties[currentMenu]
            }
            StatusReport {
                id: statusReport
                textData: statusProperties[currentStatus]
            }
            Find {
                id: find
            }
            Settings {
                id: settings
            }
        }
    }



    // Call to Refresh
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
