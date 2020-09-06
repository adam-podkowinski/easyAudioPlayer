.pragma library

function clickColor(color, change) {

    let hexColor = color.toString().substring(1)
    let endColor = "#"

    for (var i = 0; i < hexColor.length; i += 2) {
        let num = hexColor[i] + hexColor[i + 1]
        num = parseInt(num, 16)
        if (num < 255 - change)
            num += change
        else
            num += 255 - num
        num = num.toString(16)
        endColor += num
    }

    return endColor
}
