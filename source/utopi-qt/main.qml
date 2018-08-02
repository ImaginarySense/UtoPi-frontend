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
                id: test
                text: "Test"
                onClicked: {
                    screen.test();
                }
            }
            Button {
                id: changeView
                x: 100
                text: "Switch"
                onClicked: {
//                    fastRefresh();
                    fullRefresh();
                }
            }
        }
        // BODY
        StackLayout {
            id: views
            currentIndex: 0
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
        console.log('Fast Refresh');
        console.log('Grabbing image');
        view.grabToImage(function (frame) {
            console.log('Image grabed');
            console.log(frame.image);
            screen.test(frame.image);
//            frame.save('test.bmp', 'BMP');
            console.log('Image saved');
        });
    }
    function partialRefresh() {
        console.log('Partial Refresh');
    }
    function fullRefresh() {
        console.log('Full Refresh');
        screenGrab(function(frame) {
            console.log('Saving Image');
            console.log(frame);
            screen.test(frame);
//            frame.save('test.bmp', 'BMP');
            console.log('Image Saved');
        });
    }

    //
    function screenGrab(cb) {
        console.log('Grabbing image');
        view.grabToImage(function (result) {
            console.log('Image grabbed');
            cb(result.image);
//             result.saveToFile('file.bmp');
        });
    }
}

//https://doc.qt.io/qt-5/qtqml-javascript-expressions.html
//http://doc.qt.io/qt-5/qquickitemgrabresult.html
