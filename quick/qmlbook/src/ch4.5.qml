import QtQuick 2.15
import "./" as MyComponents

MyComponents.Square {
    id: root
    color: "black"
    width: 120
    height: 240

    /*
    Column {
        id: row
        anchors.centerIn: parent
        spacing: 8
        Square { color: "#ea7025" }
        Square { color: "green"; width: 96 }
        Square { color: "blue" }
    }*/
    
    Row {
        id: row
        anchors.centerIn: parent
        spacing: 20
        Square { color: "red" }
        Square { color: "green" }
        Square { color: "blue" }
    }

}
