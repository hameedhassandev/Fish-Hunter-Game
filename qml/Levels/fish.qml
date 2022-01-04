import QtQuick 2.0
import Felgo 3.0

Rectangle{
id:fish
width:110
height:90
color: "transparent"

Image {
    anchors.fill:parent
    source: "../../assets/fi.png"
}

NumberAnimation on x{
from : parent.width
to : - parent.width
running: true
duration: 7000
}

onXChanged: {
if(x < -parent.width)
    fish.destroy()
}

}//end of Rectangle
