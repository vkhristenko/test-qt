import QtQuick 2.15

Rectangle {
    id: root

    property alias text: label.text
    Text {
        id: label
        anchors.centerIn: parent
        text: ""
    }
}
