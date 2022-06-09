import QtQuick 2.15
import QtQuick.Controls 2.15
import org.testqt 1.0
import "./" as Common

ApplicationWindow {
    id: root
    visible: true
    width: 800
    height: 600
    
    ListView {
        id: view
        anchors.fill: parent
        anchors.margins: 20
        clip: true
        spacing: 2
        model: DataEntryModel{}
        delegate: Common.BoxWithText {
            width: 80
            height: 40
            color: "green"
            // use the defined model role "display"
            text: model.display
        }
    }
}
