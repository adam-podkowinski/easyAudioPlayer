import QtQuick 2.12
import QtQuick.Controls 2.12
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

        background: Rectangle {
            x: positionSlider.leftPadding
            y: positionSlider.topPadding + positionSlider.availableHeight / 2 - height / 2
            implicitWidth: 200
            implicitHeight: 6
            width: positionSlider.availableWidth
            height: implicitHeight
            radius: 3
            color: "#fcdab7"

            Rectangle {
                width: positionSlider.visualPosition * parent.width
                height: parent.height
                color: "#1e5f74"
                radius: 3
            }
        }

        handle: Rectangle {
            x: positionSlider.leftPadding + positionSlider.visualPosition
               * (positionSlider.availableWidth - width)
            y: positionSlider.topPadding + positionSlider.availableHeight / 2 - height / 2
            implicitWidth: 20
            implicitHeight: 20
            radius: 10
            color: positionSlider.pressed ? "#f0f0f0" : "#f6f6f6"
            border.color: "#bdbebf"
        }
    }
    Text {
        id: endText
        text: qsTr(positionRow.minutesStr + ":" + positionRow.secondsStr)
    }
}
