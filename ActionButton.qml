import QtQuick 2.12
import QtQuick.Controls 2.12
import QtMultimedia 5.15
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.4

Button {
    id: actionButton

    text: "<font color='#fcdab7'>"
          + (playMusic.playbackState === Audio.PlayingState ? "Pause" : "Play") + "</font>"
    Layout.alignment: Qt.AlignCenter

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 50
        radius: 10
        color: "#1e5f74"
        gradient: Gradient {
            GradientStop {
                position: 0
                color: actionButton.pressed ? "#226378" : "#1e5f74"
            }
            GradientStop {
                position: 1
                color: actionButton.pressed ? "#173f60" : "#133b5c"
            }
        }
    }

    font.family: "qrc:/fonts/sofiapro-light.otf"
    font.pointSize: 14

    onClicked: {
        if (playMusic.playbackState == Audio.PlayingState)
            playMusic.pause()
        else
            playMusic.play()
    }
}
