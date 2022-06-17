import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt.labs.qmlmodels 1.0

ApplicationWindow {
    id: root
    visible: true
    width: 1240
    height: 860
    
    function createArray(n) {
        var arr = []
        for (var i=0; i<n; i++) {
            var item = {
                "row": "row " + i,
                "0": 0,
                "1": 0,
                "2": 0,
                "3": 0,
                "4": 0,
                "5": 0,
                "6": 0,
                "7": 0,
                "8": 0,
                "9": 0
            }
            arr.push(item)
        }
        return arr
    }

    property int counter: 0
    Timer {
        interval: 20
        running: true
        repeat: true
        onTriggered: {
            root.counter++
            //console.log("counter = " + root.counter)
            //console.log(Math.floor(root.counter / 10), root.counter % 10)
            var idx = data.index(Math.floor(root.counter / 10) % 50, 1 + root.counter % 10)
            //console.log(idx)
            data.setData(
                idx,
                "display",
                counter
            )
        }
    }

    TableView {
        anchors.fill: parent
        columnSpacing: 1
        rowSpacing: 1
        clip: true

        model: TableModel {
            id: data
            TableModelColumn { display: "row" }
            TableModelColumn { display: "0" }
            TableModelColumn { display: "1" }
            TableModelColumn { display: "2" }
            TableModelColumn { display: "3" }
            TableModelColumn { display: "4" }
            TableModelColumn { display: "5" }
            TableModelColumn { display: "6" }
            TableModelColumn { display: "7" }
            TableModelColumn { display: "8" }
            TableModelColumn { display: "9" }

            property var oneRow: {
            }

            rows: createArray(50, data.oneRow)
        }

        delegate: Rectangle {
            implicitWidth: 50
            implicitHeight: 20
            border.width: 1

            Text {
                text: {
                    console.log(model.display)
                    return model.display
                }
                anchors.centerIn: parent
            }
        }
    }
}
