import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.12

    Scene {
        id: instructions1

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
                height: 70
                y:40
               source: src

           }

        Column{
        anchors.centerIn: parent
        spacing: 10
        GameButton{

            text: start
            width: 90
            onClicked: {
                playMusic(bg)
                var Component = Qt.createComponent("Level1.qml")
                var newWindo = Component.createObject(gameWindow)
                falseVisibility(instructions1)
                newWindo.show
            }

        }

        GameButton{
            text: "Back to menu"
            width: 90
            onClicked: {
                playMusic(bg)
                falseVisibility(instructions1)
                trueVisibility(scene)
            }
        }


         }//end Column

        }//Rectangle

    }//scene


