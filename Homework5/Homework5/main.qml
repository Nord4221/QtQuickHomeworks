import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "FigureContainerScript.js" as FigureScript
Window {
    id: _mainWindow
    visible: true
    width: 500
    height: 550
    title: qsTr("Hello World")

    ComboBox
    {
        editable: false
        model: ListModel
        {
            id: model
            ListElement { text: "House" }
            ListElement { text: "Hourglass" }
        }
        onCurrentTextChanged:
        {
            _myCanvas.figureName = currentText
            _myCanvas.requestPaint()
        }
    }

    Canvas
    {
        id: _myCanvas
        anchors.fill: parent
        property int xStep: width / 6
        property int yStep: height / 5
        property string figureName: "House"
        onPaint:
        {
            var object = new FigureScript.FigureContainerObj(figureName);
            var figurePoints = object.getFigurePointsArr()
            var figurePointsAmount = object.getFigurePointsAmount()
            console.log(figurePoints)
            console.log(figurePointsAmount)
            var locCtx = getContext("2d")
            locCtx.clearRect(0,0,_mainWindow.width,_mainWindow.height)
            locCtx.fillStyle = Qt.rgba(1, 1, 0, 1);
            locCtx.beginPath()
            locCtx.moveTo(figurePoints[0][0] * xStep, figurePoints[0][1]*xStep);
            for(var i = 1; i < figurePointsAmount; i++)
            {
                locCtx.lineTo(figurePoints[i][0] * xStep, figurePoints[i][1]*xStep);
                console.log(figurePoints[i][0] * xStep + " " + figurePoints[i][1]*xStep);
            }
            locCtx.closePath()
            locCtx.lineWidth = 15;
            locCtx.stroke();
            locCtx.fill()
        }
    }
//    Button
//    {
//        id: _myButton
//        text: "Change figure"
//        onClicked: switchFigure()
//    }
//    function switchFigure()
//    {
//        if(_myCanvas.figureName != "Hourglass")
//        {
//            _myCanvas.figureName = "Hourglass"
//            _myCanvas.requestPaint()
//        }
//        else
//        {
//            _myCanvas.figureName ="House"
//            _myCanvas.requestPaint()
//        }
//    }
}
