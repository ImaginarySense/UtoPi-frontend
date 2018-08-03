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
    property int screen:  0
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
            Button {
                id: fast
                x: 0
                text: "Fast"
                onClicked: {
                    fastRefresh();
                }
            }
            Button {
                id: partial
                x: 100
                text: "Partial"
                onClicked: {
                    partialRefresh();
                }
            }
            Button {
                id: full
                x: 200
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
            height: Window.height-31
            Report {
                id: report
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
        screen = 0;
        console.log('Fast Refresh');
        view.grabToImage(function (frame) {
            epd.fastRefresh(frame.image);
        });
    }
    function partialRefresh() {
        screen = 1;
        console.log('Partial Refresh');
        view.grabToImage(function (frame) {
            epd.partialRefresh(frame.image);
        });
    }
    function fullRefresh() {
        screen = 2;
        console.log('Full Refresh');
        view.grabToImage(function (frame) {
            epd.fullRefresh(frame.image);
        });
    }
}

//https://doc.qt.io/qt-5/qtqml-javascript-expressions.html
//http://doc.qt.io/qt-5/qquickitemgrabresult.html
