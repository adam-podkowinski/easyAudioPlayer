import QtQuick 2.12
import QtQuick.Controls 2.12
import QtMultimedia 5.15
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.4

ApplicationWindow {
    id: window
    width: 400
    height: 500
    visible: true
    color: "#1d2d50"
    font.family: "qrc:/fonts/sofiapro-light.otf"
    palette.text: "#fcdab7"

    Audio {
        id: playMusic
        audioRole: Audio.MusicRole
        source: "qrc:/sounds/sound.mp3"
    }

    ColumnLayout {
        focus: true
        Keys.forwardTo: actionButton
        anchors.centerIn: parent

        ActionButton {
            id: actionButton
        }

        PositionControl {
            id: positionRow
        }
    }
}
