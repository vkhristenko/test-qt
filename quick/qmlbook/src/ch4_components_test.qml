import QtQuick 2.15
import "./" as MyComponents

Rectangle {
    id: root
    width: 300
    height: 150

    MyComponents.MyButton {
        id: my_button
        x: 12; y: 12
        text: "Start me"
        onClicked: {
            status.text = "Button clicked!"
        }
    }

    Text {
        id: status
        x: 12; y: 76
        width: 116; height: 26
        text: "waiting ..."
        horizontalAlignment: Text.AlignHCenter
    }
}
