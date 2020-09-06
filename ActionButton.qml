import QtQuick 2.12
import QtQuick.Controls 2.12
import QtMultimedia 5.15
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.4
import "uiFunctions.js" as UiFunctions

Button {
    id: actionButton

    text: "<font color='" + palette.text + "'>"
          + (player.playbackState === Audio.PlayingState ? "Pause" : "Play") + "</font>"
    Layout.alignment: Qt.AlignCenter

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 50
        radius: 10
        gradient: Gradient {
            GradientStop {
                position: 0
                color: actionButton.pressed ? UiFunctions.clickColor(
                                                  palette.base,
                                                  12) : palette.base
            }
            GradientStop {
                position: 1
                color: actionButton.pressed ? UiFunctions.clickColor(
                                                  palette.alternateBase,
                                                  12) : palette.alternateBase
            }
        }
    }

    font.family: "qrc:/fonts/sofiapro-light.otf"
    font.pointSize: 14

    onClicked: {
        if (player.playbackState == Audio.PlayingState)
            player.pause()
        else
            player.play()
    }
}
