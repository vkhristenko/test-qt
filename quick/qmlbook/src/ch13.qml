import QtQuick 2.15

Rectangle {
    width: 800
    height: 600
    color: "red"

    function makeRequest() {
        var r = new XMLHttpRequest()
        r.onreadystatechange = function() {
            if (r.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
                console.log("HEADERS RECEIVED")
            } else if (r.readyState === XMLHttpRequest.DONE) {
                console.log("request completed")
                var obj = JSON.parse(r.responseText.toString())
                console.log(obj["data"])
            }
        }
        r.open("GET", "test.json")
        r.send()
    }

    Component.onCompleted: {
        makeRequest()
    }
}
