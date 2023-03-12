import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Shapes 1.12

Window
{
    visible: true

    width: height
    height: width
    title: qsTr("Rectangle")
    Rectangle
    {
        id: _basicRectangle
        color: 'mediumpurple'
        anchors.centerIn: parent
        width: parent.width - 100
        height: parent.height - 100
        radius: 0
        Button
        {
            anchors.fill: parent
            opacity: 0
            visible: true
            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onClicked:
                {
                    if(mouse.button === Qt.LeftButton)
                        switchColor()
                    else if(mouse.button === Qt.RightButton)
                        rotateFigure()
                }
                onDoubleClicked: switchShape()
            }

        }
    }

    PropertyAnimation
    {
        id: _rotateAnimation
        target: _basicRectangle
        property: "rotation"
        from: 0
        to: 180
        duration: 500
        running: false
    }


    function switchColor()
    {
        _basicRectangle.color = Qt.rgba(Math.random()%1.0,Math.random()%1.0,Math.random()%1.0,Math.random()%1.0)
    }
    function switchShape()
    {
        if(_basicRectangle.radius == 0)
            _basicRectangle.radius = _basicRectangle.width
        else
            _basicRectangle.radius = 0
    }
    function rotateFigure()
    {
        _rotateAnimation.start()
    }
}
