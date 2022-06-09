import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

//Window {
//    width: 1920
//    height: 1280
//    visible: true
//    title: qsTr("Hello World from VK!")
//
//    Text {
//        anchors.centerIn: parent
//        text: "Some Text 1!"
//    }
//
//    Text {
//        anchors.centerIn: parent
//        text: "Some Text 2!"
//    }
//}

//window containing the application
ApplicationWindow {

    visible: true

    //title of the application
    title: qsTr("Hello World")
    width: 640
    height: 480

    //menu containing two menu items
    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    //Content Area

    //a button in the middle of the content area
    Button {
        text: qsTr("Hello World")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
}
