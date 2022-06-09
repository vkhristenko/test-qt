import QtQuick 2.15
import "./" as Common

Rectangle {
    width: 800
    height: 600
    
    Column {
        x: 0; y:0  
        spacing: 2
        Repeater {
            model: 10
            Common.BoxWithText {
                width: 120
                height: 32
                color: "blue"
                text: index
            }
        }
    }

    Column {
        x: 600; y:0
        spacing: 2
        Repeater {
            model: 10

            delegate: Common.BoxWithText {
                width: 100
                height: 32
                color: "brown"
                text: index
            }
        }
    }

    Column {
        x: 200; y: 0
        spacing: 2
        Repeater {
            model: ["Enterprise", "Columbia", "Challenger", "Discovery", "Endeavour", "Atlantis"]
            Common.BoxWithText {
                width: 100
                height: 32
                radius: 3
                color: "red"
                text: modelData + "(" + index + ")"
            }
        }
    }

    Column {
        x: 400; y:0
        spacing: 2
        Repeater {
            model: ListModel {
                ListElement { name: "Mercury"; surfaceColor: "gray" }
                ListElement { name: "Venus"; surfaceColor: "yellow" }
                ListElement { name: "Earth"; surfaceColor: "blue" }
                ListElement { name: "Mars"; surfaceColor: "orange" }
                ListElement { name: "Jupiter"; surfaceColor: "orange" }
                ListElement { name: "Saturn"; surfaceColor: "yellow" }
                ListElement { name: "Uranus"; surfaceColor: "darkBlue" }
                ListElement { name: "Neptune"; surfaceColor: "darkBlue" }
            }

            Common.BoxWithText {
                width: 120
                height: 32
                radius: 3
                color: "lightblue"
                text: name

                Rectangle {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 4

                    width: 16
                    height: 16
                    radius: 8
                    color: surfaceColor
                }
            }
        }
    }
}
