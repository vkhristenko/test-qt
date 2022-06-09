import QtQuick 2.15
import QtQuick.Controls 2.4
import "./" as MyComponents

ApplicationWindow {
    id: root
    visible: true
    width: 800
    height: 600

    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font {
                pixelSize: Qt.application.font.pixelSize * 1.6
            }
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: drawer
        width: root.width * 0.66
        height: root.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Profile")
                width: parent.width
                onClicked: {
                    stackView.push("Profile.qml")
                    drawer.close()
                }
            }

            ItemDelegate {
                text: qsTr("About")
                width: parent.width
                onClicked: {
                    stackView.push(aboutPage)
                    drawer.close()
                }
            }
        }
    }

    Component {
        id: aboutPage
        
        MyComponents.About {}
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: MyComponents.Home{}
    }
}
