import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "uiFunctions.js" as UiFunctions

RowLayout {
    id: positionControl
    property int minutes: Math.floor(player.duration / 60000)
    property int seconds: Math.floor(player.duration / 1000 - minutes * 60)

    property int currentMinutes: Math.floor(player.position / 60000)
    property int currentSeconds: Math.floor(
                                     player.position / 1000 - currentMinutes * 60)

    property string minutesStr: this.minutes < 10 ? "0" + minutes.toString(
                                                        ) : minutes.toString()

    property string secondsStr: this.seconds < 10 ? "0" + seconds.toString(
                                                        ) : seconds.toString()

    property string currentMinutesStr: currentMinutes < 10 ? "0" + currentMinutes.toString(
                                                                 ) : currentMinutes.toString()
    property string currentSecondsStr: currentSeconds < 10 ? "0" + currentSeconds.toString(
                                                                 ) : currentSeconds.toString()

    property bool isSliderEnabled: true

    Text {
        id: startText
        text: qsTr(positionRow.currentMinutesStr + ":" + positionRow.currentSecondsStr)
        color: palette.text
    }

    Slider {
        id: positionSlider
        from: 0
        to: player.duration
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        onMoved: {
            player.seek(value)
        }

        enabled: isSliderEnabled

        value: player.position

        background: Rectangle {
            x: positionSlider.leftPadding
            y: positionSlider.topPadding + positionSlider.availableHeight / 2 - height / 2
            implicitWidth: 200
            implicitHeight: 6
            width: positionSlider.availableWidth
            height: implicitHeight
            radius: 3
            color: palette.text

            Rectangle {
                width: positionSlider.visualPosition * parent.width
                height: parent.height
                color: palette.alternateBase
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
            color: positionSlider.pressed ? palette.base : UiFunctions.clickColor(
                                                palette.base, 10)
            border.color: positionSlider.pressed ? UiFunctions.clickColor(
                                                       palette.base,
                                                       10) : palette.base
        }
    }

    Text {
        id: endText
        text: qsTr(positionRow.minutesStr + ":" + positionRow.secondsStr)
        color: palette.text
    }
}
