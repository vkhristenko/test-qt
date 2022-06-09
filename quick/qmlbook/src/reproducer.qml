import QtQuick 2.15
import QtQuick.Controls 2.4
//import QtQuick.Dialogs 1.2
import Qt.labs.platform 1.0 as NativeDialogs

ApplicationWindow {
    id: root

    onClosing: {
        console.log("closing window")
    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")

            MenuItem {
                text: qsTr("&New")
                icon.name: "document-new"
                onTriggered: newDocument()
            }
        }
    }

    NativeDialogs.FileDialog {
        id: openDialog
        title: "Open"
        //folder: shortcuts.home
        onAccepted: {
            console.log("open file dialog")
        }
    }

    function newWindow() {
        console.log("new window")
        var component = Qt.createComponent("reproducer.qml")
        var window = component.createObject()
        return window
    }

    function newDocument() {
        console.log("new document")
        var window = newWindow()
        window.show()
    }
}
