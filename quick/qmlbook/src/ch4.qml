import QtQuick 2.15

Rectangle {
    id: root
    width: 800; height: 600
    //color: "red"

    Rectangle {
        id: rect1
        x: 10; y: 10
        width: 100; height: 580
        color: "lightsteelblue"
        MouseArea {
            id: area
            width: parent.width
            height: parent.height
            onClicked: rect2.visible = !rect2.visible
        }
    }

    Rectangle {
        id: rect2
        x: rect1.x + rect1.width + 50
        y: rect1.y
        width: rect1.width
        height: rect1.height
        border {
            color: "lightsteelblue"
            width: 4
        }
        radius: 8
    }

    /*
    Text {
        text: "The quick brown text"
        color: "#303030"
        font {
            pixelSize: 30
        }
    }*/
}
