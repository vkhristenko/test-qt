import QtQuick 2.15

Loader {
    id: root
    source: "http://localhost:8080/test1.qml"
    onLoaded: {
        root.width = item.width
        root.height = item.height
    }
}
