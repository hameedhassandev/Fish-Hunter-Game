import Felgo 3.0
import QtQuick 2.0
import QtMultimedia 5.12

GameWindow {
    id: gameWindow

    screenWidth: 960
    screenHeight: 640

    property var start: ""
    property var src:""
    property int scoreOfgame: 0
    property int health: 3
    property int time : 0
    property int lvl1Time: 20
    property int lvl2Time: 25
    property int scoreLvl1: 25
    property int scoreLvl2: 30




    //functions
    function dest(compID){
        compID.destroy()
    }
    function playMusic(musicID){

        musicID.play()
    }
    function stop(itemID){
        itemID.stop()
    }
    function trueVisibility(sceneName){

        sceneName.visible = true
    }

    function falseVisibility(sceneName){

        sceneName.visible = false
    }

    function changeStartString(newString){
        start = newString
    }
    function changeImageSrc(newSrc){
        src = newSrc
    }
    function setScoreOfgameZero(){
        scoreOfgame = 0
    }
    function setHealthValue(){
        health = 3
    }
    function setTime(value){
    time = value
    }
    function changeHealthBar(heartID){
        if(health === 2){
        heartID.source = "../assets/health2.png"
        }else if(health === 1){
        heartID.source = "../assets/health3.png"
        }
    }

    function chamgeScoreBarLvl2(scoreID){
        if(scoreOfgame === 5){
            scoreID.source = "../assets/si2.png"
        }else if(scoreOfgame === 10){
            scoreID.source = "../assets/si3.png"
        }else if(scoreOfgame === 15){
            scoreID.source = "../assets/si4.png"
        }else if(scoreOfgame === 20){
            scoreID.source = "../assets/si5.png"
        }
        else if(scoreOfgame === 25){
            scoreID.source = "../assets/si6.png"
        }
    }
    function chamgeScoreBarLvl1(scoreID){
        if(scoreOfgame === 5){
            scoreID.source = "../assets/sc2.png"
        }else if(scoreOfgame === 10){
            scoreID.source = "../assets/sc3.png"
        }else if(scoreOfgame === 15){
            scoreID.source = "../assets/sc4.png"
        }else if(scoreOfgame === 20){
            scoreID.source = "../assets/sc5.png"
        }

    }



    function gameTime(timerID,falseSceneID,trueSceneID,timeValue){

        time--
         if(time === 0) {
            stop(timerID)
             falseVisibility(falseSceneID)
             setScoreOfgameZero()
             setTime(timeValue)
             setHealthValue()
             changeStartString("Play again")
             changeImageSrc("../../assets/Time out.png")
             trueVisibility(trueSceneID)

         }
    }


    //target fish
    function targetFish(listName,playerID,numberOfScore,gameTimerID,hideSceneID,visibleSceneID,StartString,srcString,timeValue){
        for(var i = 0 ; i < listName.length ; i++){
         var tf =  listName[i]

            if(Math.abs(playerID.x - tf.x) < 40){
                if( Math.abs(playerID.y - tf.y) < 40){
                    dest(tf)
                    playMusic(eat)
                    scoreOfgame = scoreOfgame + 1
                    if(scoreOfgame > numberOfScore-1){
                        stop(gameTimerID)
                        setTime(timeValue)
                        setScoreOfgameZero()
                        setHealthValue()
                        falseVisibility(hideSceneID)
                        changeStartString(StartString)
                        changeImageSrc(srcString)
                        trueVisibility(visibleSceneID)

                    }
                }
            }
        }

    }


    function stonefunction(listStoneName,playerID,gameTimerID,startString,srcString,hideSceneID,visibleSceneID,timeValue){
        for(var i = 0 ; i < listStoneName.length ; i++){
         var st =  listStoneName[i]

        if(Math.abs(playerID.x - st.x) < 60){
            if( Math.abs(playerID.y - st.y) < 60){
                health--
                dest(st)
                playMusic(crushS)
                if(health === 0){
                    stop(gameTimerID)
                    setScoreOfgameZero()
                    setHealthValue()
                    setTime(timeValue)
                    falseVisibility(hideSceneID)
                    changeStartString(startString)
                    changeImageSrc(srcString)
                    trueVisibility(visibleSceneID)
                }
            }
          }
         }
       }



    SoundEffect{
    id:bg
    source: "../assets/snd/music.wav"

    }
    SoundEffect{
    id:eat
    source: "../assets/snd/fishPop.wav"

    }
    SoundEffect{
    id:crushS
    source: "../assets/snd/stone.wav"

    }



    Scene {
        id: scene
        //Game Rectangle tht fills all the scene
        Rectangle{
            anchors.fill: parent.gameWindowAnchorItem

            Image {
                id: backGame
                source: "../assets/bg2.jpg"
                width: 700
                height: 400
                }//background

            Image{
               id:title
               anchors.horizontalCenter: parent.horizontalCenter
               y:20
               source: "../assets/Fish Hunter Game.png"
               width: 190
               height: 30

              SequentialAnimation {

                 running: true

                 NumberAnimation { target: title; property: "scale"; to: 1.5; duration: 3000 }
                 NumberAnimation { target: title; property: "y"; to: 50; duration: 2000 }
              }//animation
            }//end image of title

        Column{
        anchors.centerIn: parent
        spacing: 10
        GameButton{

            text: "Level 1"
            width: 70
            onClicked: {
                playMusic(bg)//start music
                changeStartString("Start")
                setTime(lvl1Time)

                changeImageSrc("../../assets/inst1.png")
                var Component = Qt.createComponent("Levels/instrLvl1.qml")
                var newWindo = Component.createObject(gameWindow)
                scene.visible = false

                newWindo.show
            }//end onClicked

        }//end gameButton1



        GameButton{

            text: "Level 2"
            width: 70

            onClicked: {
                 playMusic(bg)//start music
                changeStartString("Start")
                setTime(lvl2Time)
                changeStartString("Start")
                changeImageSrc("../../assets/inst2.png")
                var Component = Qt.createComponent("Levels/instrLvl2.qml")
                    var newWindo = Component.createObject(gameWindow)

                falseVisibility(scene)
                    newWindo.show
            }
        }

        GameButton{

            text: "Exit"
            width: 70
            onClicked: Qt.quit()
        }


        }

        }


    }//end scene

}//end game window
