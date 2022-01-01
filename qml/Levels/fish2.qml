import QtQuick 2.0
import Felgo 3.0

Rectangle{
id:fish2
width:90
height:70
color: "transparent"

Image {

    anchors.fill:parent
    source: "../../assets/fi2.png"
}

NumberAnimation on x{
from : parent.width
to : - parent.width
running: true
duration: 7000
}

onXChanged: {
if(x < -parent.width)
    fish2.destroy()
}

}//end of Rectangle
