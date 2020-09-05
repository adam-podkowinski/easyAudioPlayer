import QtQuick 2.12
import QtQuick.Controls 2.12
import QtMultimedia 5.12
import QtQuick.Layouts 1.12

RowLayout {
    id: positionControl
    property int minutes: Math.floor(playMusic.duration / 60000)
    property int seconds: Math.floor(playMusic.duration / 1000 - minutes * 60)

    property int currentMinutes: Math.floor(playMusic.position / 60000)
    property int currentSeconds: Math.floor(
                                     playMusic.position / 1000 - currentMinutes * 60)

    property string minutesStr: this.minutes < 10 ? "0" + minutes.toString(
                                                        ) : minutes.toString()

    property string secondsStr: this.seconds < 10 ? "0" + seconds.toString(
                                                        ) : seconds.toString()

    property string currentMinutesStr: currentMinutes < 10 ? "0" + currentMinutes.toString(
                                                                 ) : currentMinutes.toString()
    property string currentSecondsStr: currentSeconds < 10 ? "0" + currentSeconds.toString(
                                                                 ) : currentSeconds.toString()

    Text {
        id: startText
        text: qsTr(positionRow.currentMinutesStr + ":" + positionRow.currentSecondsStr)
    }
    Slider {
        id: positionSlider
        from: 0
        to: playMusic.duration
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        onMoved: {
            playMusic.seek(positionSlider.value)
        }
        value: playMusic.position
    }
    Text {
        id: endText
        text: qsTr(positionRow.minutesStr + ":" + positionRow.secondsStr)
    }
}
