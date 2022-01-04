import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.12

Scene {

     property var fishList: [ ]
     id: root
     visible: true
     anchors.fill: parent

     function generateComponent(componenetPath,positionList,sceneID,xValue,yValue)
     {
        var object = Qt.createComponent(componenetPath)
        if(object.status === Component.Ready){
            var e = object.createObject(sceneID,{"x": xValue ,"y":yValue })
            //push every position into list
            positionList.push(e)
        }
     }


     Timer{
         id:fish_timer
         interval: 300
         running: true
         repeat: true

         onTriggered: {generateComponent("fish.qml",fishList,root,0,Math.random()* root.width)}

     }



     Timer {
        id: gameTimer
        running: true
        repeat: true

        onTriggered: {

            gameTime(gameTimer,root,instructions1,lvl1Time)
        }

      }


     Image {
         id: background
         anchors.fill:parent.gameWindowAnchorItem
         source: "../../assets/bg.jpg"
     }//back ground scene

     Rectangle{
         //main fish
     id:player
     width:120
     height:100
     color: "transparent"

     Image {
         id: mainFish
         anchors.fill:parent
         source: "../../assets/mainFish.png"
     }

     MouseArea{
         anchors.leftMargin: -8
         anchors.topMargin: 0
         //anchors.rightMargin: 8
         anchors.bottomMargin: 0

         anchors.fill : parent

     drag.target: parent
     drag.axis: Drag.XAndYAxis
     drag.maximumX: root.width
     drag.minimumX:0
     drag.maximumY: root.height
     drag.minimumY:0
     }





     onXChanged:{

         targetFish(fishList,player,scoreLvl1,gameTimer,root,instructions1,"Play again","../../assets/Congrtualtions.png",lvl1Time)
         chamgeScoreBarLvl1(scor)
     }

}//player rectangle(fish)

     Text {
         id: score
         color: "white"
         font.pixelSize: 30
         x:400
         y:10
         text:scoreOfgame
         Image {
             id: scor
             width: 260
             height: 70
             x : 25
             y: -10
             source: "../../assets/sc1.png"
         }

     }


     Text {
         id: t
         color: "white"
         font.pixelSize: 30
         x:800
         y:10

         text: time
         Image {
             id: timeIMage
             width: 50
             height: 50
             x : 35
             y: -2
             source: "../../assets/clock.png"
         }

     }


}
