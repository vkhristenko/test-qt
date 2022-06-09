import QtQuick 2.15
import QtQuick.Controls 2.3

Rectangle {
    // name this element root
    id: root

    // properties: <name>: <value>
    width: 800; height: 600

    // color property
    color: "#4A4A4A"

    Image {
        id: triangle

        // reference the parent
        x: (parent.width - width)/2; y: 40

        source: 'palette_32.png'
    }

    onHeightChanged: console.log("root height changed!")

    Text {
        // reference element by id
        y: triangle.y + triangle.height + 20

        // reference root element
        width: root.width

        color: 'white'
        horizontalAlignment: Text.AlignHCenter
        text: 'Pallete'
    }

    /*
    Text {
        id: thisLabel
        x: 24; y:16
        height: 2*width
        property int times: 24
        property alias anotherTimes: thisLabel.times
        text: "Greetings" + times
        font {
            family: "Ubuntu"
            pixelSize: 24
        }

        KeyNavigation.tab: thisLabel

        //KeyNavigation.tab: otherLabel
        onHeightChanged: console.log("height:", height)
        focus: true
        color: focus ? "red" : "black"
    }*/

    Text {
        id: label

        x: 100; y: 100
        property int spacePresses: 0
        text: "Space pressed: " + spacePresses + " times"
        onTextChanged: console.log("text changed to: ", text)
        focus: true
        Keys.onSpacePressed: {
            increment()
        }

        Keys.onEscapePressed: {
            label.spacePresses = 0
        }

        function increment() {
            spacePresses = spacePresses + 1
        }
    }
}
