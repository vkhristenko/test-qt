import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt.WebSockets 1.3

Text {
    id: root
    width: 480
    height: 48

    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter

    WebSocket {
        id: socket
        url: "ws://ws.ifelse.io"
        active: true
        onTextMessageReceived: {
            console.log("text message received: " + message)
            text = message
        }

        onStatusChanged: {
            console.log("Status Code = " + socket.status)
            if (socket.status == WebSocket.Connecting) {
                console.log("connecting...")
            } else if (socket.status == WebSocket.Error) {
                console.log("Error: " + socket.errorString)
            } else if (socket.status == WebSocket.Open) {
                console.log("socket is open")
                socket.sendTextMessage("ping")
            } else if (socket.status == WebSocket.Closed) {
                console.log("socket is closed") 
                text += "\nSocket closed"
            } else if (socket.status == WebSocket.Closing) {
                console.log("socket is closing")
            }
        }
    }

    Button {
        property int counter: 0
        text: "Send Hello"
        onClicked: {
            socket.sendTextMessage("Hello from Viktor. counter = " + counter)
            counter = counter + 1
        }
    }
}
