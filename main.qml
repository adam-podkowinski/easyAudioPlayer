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

    palette.window: "#202040"
    palette.base: "#543864"
    palette.alternateBase: "#ff6363"
    palette.text: "#ffbd69"

    color: palette.window
    font.family: "qrc:/fonts/sofiapro-light.otf"
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
