import QtQuick 2.0
import Felgo 3.0

Rectangle{
id:stone
width:80
height:80
color: "transparent"

Image {
    id: stoneImg
    anchors.fill:parent
    source: "../../assets/stone.png"
}
NumberAnimation on y{
from : -y -50
to : parent.height+50
running: true
duration: 3000
}
onYChanged: {
if(y > parent.height){
    stone.destroy()

}

 }
}

