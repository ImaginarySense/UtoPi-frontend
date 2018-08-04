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
