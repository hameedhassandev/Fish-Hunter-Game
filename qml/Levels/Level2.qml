import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.12

Scene {

     property var fishList: [ ]
     property var stoneList: [ ]

    function generateComponent(componenetPath,listName,objectPlace,xValue,yValue)
    {
     var object = Qt.createComponent(componenetPath)
       if(object.status === Component.Ready){
           var e = object.createObject(objectPlace,{"x": xValue ,"y":yValue })
           //push every position into list
           listName.push(e)
       }
    }

     id: root2
     visible: true
     anchors.fill: parent

     Timer{
         id:fish_timer
         interval: 300
         running: true
         repeat: true
         onTriggered: {generateComponent("fish2.qml",fishList,root2,0,Math.random()* root2.width)}
     }

     Timer{
         id:stone
         interval: 900
         running: true
         repeat: true

         onTriggered: {generateComponent("stone.qml",stoneList,root2,Math.random()* root2.width,0)}
     }



     Timer {
        id: gameTimer
        running: true
        repeat: true

        onTriggered: {
          gameTime(gameTimer,root2,instructions2,lvl2Time)
        }

      }


     Image {
         id: background
         anchors.fill:parent.gameWindowAnchorItem
         source: "../../assets/bg.jpg"
     }

     Rectangle{
     id:player
     width:120
     height:100
     color: "transparent"

     Image {
         id: mFish
         anchors.fill:parent
         source: "../../assets/mainFish.png"
     }
     MouseArea{

     anchors.fill : parent

     drag.target: parent
     drag.axis: Drag.XAndYAxis
     drag.maximumX: root2.width
     drag.minimumX:0
     drag.maximumY: root2.height
     drag.minimumY:0
     }


     onXChanged:{

         targetFish(fishList,player,scoreLvl2,gameTimer,root2,instructions2,"Play again","../../assets/Congrtualtions.png",lvl2Time)

         chamgeScoreBarLvl2(scorImge)

     }

     onYChanged:{

       stonefunction(stoneList,player,gameTimer,"Play again","../../assets/gameOver.png",root2,instructions2,lvl2Time)
        changeHealthBar(healthIMG)

     }

     }

     Text {
         id: score
         color: "white"
         font.pixelSize: 30
         x:450
         y:10
         text:scoreOfgame
         Image {
             id: scorImge
             width: 260
             height: 70
             x : 25
             y: -10
             source: "../../assets/si1.png"
         }

     }


     Text {
         id: harm
         color: "white"
         font.pixelSize: 30
         x:800
         y:10

         text: time
         Image {
             id: tClock
             width: 50
             height: 50
             x : 35
             y: -2
             source: "../../assets/clock.png"
         }

     }
     Text {
         id: hea
         text: health
         font.pixelSize: 35
         color: "white"
         x : 200
         y:10
         Image {
             id: healthIMG
             width: 160
             height: 50
             x : 25
             y: -6
             source: "../../assets/health1.png"
         }

     }

}
