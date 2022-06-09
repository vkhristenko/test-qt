import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt.WebSockets 1.3

Rectangle {
    width: 360
    height: 360
    color: "#000"

    ChatView {
        id: box
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: input.top
    }

    ChatInput {
        id: input
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        focus: true
        onAccepted: {
            console.log("send message: " + text)
            socket.sendTextMessage(text)
            box.append(">", text)
            text = ""
        }
    }

    WebSocket {
        id: socket

        url: "ws://localhost:3000"
        active: true
        onTextMessageReceived: {
            console.log("received msg: ", message)
            box.append("<", message)
        }

        onStatusChanged: {
            if (socket.status == WebSocket.Error){
                console.log("socket error ")
                box.append("#", "socket error " + socket.errorString)
            } else if (socket.status == WebSocket.Open) {
                console.log("socket open")
                box.append("#", "socket open")
            } else if (socket.status == WebSocket.Closed) {
                console.log("socket closed")
                box.append("#", "socket closed")
            } else if (socket.status == WebSocket.Connecting) {
                console.log("socket connecting...")
                box.append("#", "connecting...")
            } else if (socket.status == WebSocket.Closing) {
                console.log("socket closing")
                box.append("#", "socket closing")
            }
        }
    }
}
