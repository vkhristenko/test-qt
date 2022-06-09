import QtQuick 2.15
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.2

ApplicationWindow {
    id: root
    visible: true
    width: 1200
    height: 800

    background: Rectangle {
        color: "darkGray"
    }

    Image {
        id: image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        asynchronous: true
    }

    header: ToolBar {
        Flow {
            anchors.fill: parent
            ToolButton {
                text: qsTr("Open")
                icon.name: "document-open"
                onClicked: {
                    console.log("clicked tool bar")
                    fileOpenDialog.open()
                }
            }
        }
    }

    FileDialog {
        id: fileOpenDialog
        title: "Select an image file"
        folder: shortcuts.home
        nameFilters: [
            "Image files (*.png *.jpeg *.jpg)",
        ]
        onAccepted: {
            console.log("accepted event")
            image.source = fileOpenDialog.fileUrl
        }
    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open...")
                icon.name: "document-open"
                onTriggered: {
                    console.log("Menu onTriggered event")
                    fileOpenDialog.open()
                }
            }
        }
        Menu {
            title: qsTr("&Help")
            MenuItem {
                text: qsTr("&About...")
                onTriggered: aboutDialog.open()
            }
        }
        Menu {
            title: qsTr("Popup")
            MenuItem {
                text: qsTr("Test1")
                onTriggered: popup.open()
            }
        }
    }

    Dialog {
        id: aboutDialog
        title: qsTr("About")
        Label {
            anchors.fill: parent
            text: qsTr("QML Image Viewer\nA part of the QmlBook\nhttp://qmlbook.org")
            horizontalAlignment: Text.AlignHCenter
        }

        standardButtons: StandardButton.Ok
    }

    Popup {
        id: popup
        x: 100
        y: 100
        width: 200
        height: 300
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.closeOnPressOutsideParent
    }
}
