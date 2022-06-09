import QtQuick 2.15
import QtQuick.Controls 2.4
//import QtQuick.Dialogs 1.2
import Qt.labs.platform 1.0 as NativeDialogs

ApplicationWindow {
    id: root

    property bool _isDirty: true
    property string _fileName
    property bool _tryingToClose: false

    onClosing: {
        console.log("closing a window")
        /*if (root._isDirty) {
            closeWarningDialog.open()
            close.accepted = false
        }
        */
    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")

            MenuItem {
                text: qsTr("&New")
                icon.name: "document-new"
                onTriggered: newDocument()
            }
            /*
            MenuSeparator{}
            MenuItem {
                text: qsTr("&Open")
                icon.name: "document-open"
                onTriggered: openDocument()
            }
            MenuSeparator{}
            MenuItem {
                text: qsTr("&Save")
                icon.name: "document-save"
                onTriggered: saveDocument()
            }
            MenuSeparator{}
            MenuItem {
                text: qsTr("Save &As...")
                icon.name: "document-save-as"
                onTriggered: saveAsDocument()
            }
            */
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

    /*
    FileDialog {
        id: openDialog
        title: "Open"
        folder: shortcuts.home
        onAccepted: {
            console.log("selected a file: ", openDialog.fileUrl)
            var window = root._createNewDocument()
            window._fileName = openDialog.fileUrl
            window.show()
        }
    }*/

    /*
    FileDialog {
        id: saveAsDialog
        title: "Save As"
        folder: shortcuts.home
        onAccepted: {
            root._fileName = saveAsDialog.fileUrl
            saveDocument()
        }
        onRejected: {
            root._tryingToClose = false
        }
    }
    */

    /*
    MessageDialog {
        id: closeWarningDialog
        title: "Closing document"
        text: "You have unsaved changed. Do you want to save your changes?"
        standardButtons: StandardButton.Yes | StandardButton.No | StandardButton.Cancel
        onYes: {
            root._tryingToClose = true
            root.saveDocument()
        }
        onNo: {
            root._isDirty = false
            root.close()
        }
        onRejected: {
            console.log("onRejected clicked for the warning dialog")
        }
    }*/

    function _createNewDocument() {
        var component = Qt.createComponent("DocumentWindow.qml")
        var window = component.createObject()
        return window
    }

    function newDocument() {
        var window = _createNewDocument()
        window.show()
    }
    function openDocument() {
        console.log("opening a document")
        //openDialog.open();
    }

    function saveAsDocument() {
        console.log("saveAs")
        //saveAsDialog.open()
    }

    function saveDocument() {
        console.log("save")
        /*
        if (_fileName.length == 0) {
            root.saveAsDocument();
        } else {
            console.log("Saving Document")
            root._isDirty = false;
            if (root._tryingToClose)
                root.close()
            }*/
    }
}
