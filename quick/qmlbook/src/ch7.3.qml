import QtQuick 2.15
import "./" as Common

Rectangle {
    width: 800
    height: 600

    ListView {
        x: 0; y:0
        anchors.fill: parent
        anchors.margins: 20
        clip: true
        model: 100
        delegate: numberDelegate
        spacing: 5
    }

    Component {
        id: numberDelegate

        Common.BoxWithText {
            width: 40
            height: 40
            color: "green"
            text: index
        }
    }
}
