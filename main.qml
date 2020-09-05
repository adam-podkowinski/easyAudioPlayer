import QtQuick 2.12
import QtQuick.Controls 2.12
import QtMultimedia 5.12
import QtQuick.Layouts 1.12

ApplicationWindow {
    id: window
    width: 400
    height: 500
    visible: true

    Audio {
        id: playMusic
        audioRole: Audio.MusicRole
        source: "qrc:/new/sounds/sound.mp3"
    }

    ColumnLayout {
        focus: true
        Keys.forwardTo: actionButton
        anchors.centerIn: parent

        Button {
            id: actionButton
            text: playMusic.playbackState == Audio.PlayingState ? "Pause" : "Play"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            onClicked: {
                if (playMusic.playbackState == Audio.PlayingState)
                    playMusic.pause()
                else
                    playMusic.play()
            }
        }

        PositionControl {
            id: positionRow
        }
    }
}
