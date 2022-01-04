import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.12



    Scene {
        id: instructions2
        Rectangle{
        anchors.fill: parent.gameWindowAnchorItem
        Image {
            id: backGame
            source: "../../assets/bg2.jpg"
            width: 700
            height: 400

        }




        Image {
            anchors.horizontalCenter: parent.horizontalCenter
             width : 150
             height: 90
             y:20
            source: src

        }


        Column{
        anchors.centerIn: parent
        spacing: 10
        GameButton{

            text: start
            width: 90
            onClicked: {
              bg.play()

            var Component = Qt.createComponent("Level2.qml")
                var newWindo = Component.createObject(gameWindow)
                 falseVisibility(instructions2)
                newWindo.show
            }

        }

        GameButton{

            text: "Back to menu"
            width: 90
            onClicked: {
                    bg.play()
                   falseVisibility(instructions2)
                   trueVisibility(scene)

            }
        }

        }//end Column

      }//Rectangle
}//scene


