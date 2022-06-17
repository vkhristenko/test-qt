import QtQuick 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15

ApplicationWindow {
    width: 800
    height: 600

    ChartView {
        id: chart
        x: 0; y:0
        title: "Line"
        anchors.fill: parent
        antialiasing: true

        property int num_points: 0
        property var series
    }
    
    Rectangle {
        id: remove_button

        // export button properties
        property alias text: label.text
        signal clicked

        width: 115; height: 26
        color: "lightsteelblue"
        border {
            color: "slategrey"
        }

        Text {
            id: label
            anchors.centerIn: parent
            text: "Remove"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                remove_button.clicked()
            }
        }

        onClicked: {
            console.log("remove button was clicked")
            chart.removeAllSeries()
        }
    }
    
    Rectangle {
        id: add_button

        // export button properties
        property alias text: add_button_label.text
        signal clicked

        x: 115; y:0
        width: 115; height: 26
        color: "lightsteelblue"
        border {
            color: "slategrey"
        }

        Text {
            id: add_button_label
            anchors.centerIn: parent
            text: "Add"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                add_button.clicked()
            }
        }

        onClicked: {
            console.log("add button was clicked")
            chart.series = chart.createSeries(ChartView.SeriesTypeLine, "line1")
            chart.series.pointsVisible = true
            chart.series.append(0.2, 0.2)
        }
    }
}
