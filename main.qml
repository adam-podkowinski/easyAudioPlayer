import QtQuick 2.12
import QtQuick.Controls 2.12
import QtMultimedia 5.15
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.4
import "uiFunctions.js" as UiFunctions

ApplicationWindow {
    id: window
    width: 400
    height: 500
    visible: true

    palette.window: "#202040"
    palette.base: "#543864"
    palette.alternateBase: "#ff6363"
    palette.text: "#ffbd69"

    color: palette.window
    font.family: "qrc:/fonts/sofiapro-light.otf"

    Audio {
        id: player
        audioRole: Audio.MusicRole
        playlist: Playlist {
            id: playlist
            PlaylistItem {
                source: "qrc:/sounds/sound.mp3"
            }
            PlaylistItem {
                source: "qrc:/sounds/sound1.mp3"
            }
            PlaylistItem {
                source: "qrc:/sounds/sound2.mp3"
            }

            playbackMode: Playlist.Loop

            onCurrentIndexChanged: {
                //Reset slider to prevent skipping playlist elements
                positionRow.isSliderEnabled = false
                positionRow.isSliderEnabled = true
            }
        }
    }

    ColumnLayout {
        focus: true
        Keys.forwardTo: actionButton
        anchors.centerIn: parent

        Text {
            text: UiFunctions.fileBasename(
                      playlist.currentItemSource.toString())
            Layout.alignment: Qt.AlignCenter
            color: palette.text
            font.pointSize: 12
        }

        PositionControl {
            id: positionRow
            isSliderEnabled: true
        }

        ActionButton {
            id: actionButton
        }
    }
}
