import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {

    property var textData: []

    Label {
        x: 14
        y: 2
        text: "Which status best describes the situation?"
        font.pixelSize: 12
        color: 'black'
    }

    ColumnLayout {
        x: 0
        y: 0
        width: Window.width
        height: Window.height-31

        GroupBox {
            ColumnLayout {
                spacing: 2

                ExclusiveGroup { id:roadPosGroup }

                Repeater {
                    id: radioLayout
                    model: textData
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
