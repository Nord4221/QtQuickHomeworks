import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: _columnlayout.width
    height: _columnlayout.height
    minimumWidth: _columnlayout.width
    minimumHeight: _columnlayout.height
    title: qsTr("TriangleAreaCalculator")
    ColumnLayout
    {
        anchors.centerIn: parent
        id : _columnlayout
        spacing: 2
        RowLayout
        {
            Text
            {
                id : _labelSideA
                text: qsTr("Side A")
                Layout.minimumWidth: 60
            }
            TextField
            {
                id: _textFieldSideA
            }
        }
        RowLayout
        {
            Text
            {
                id : _labelSideB
                text: qsTr("Side B")
                Layout.minimumWidth: 60
            }
            TextField
            {
                id: _textFieldSideB
            }
        }
        RowLayout
        {
            Text
            {
                id : _labelSideC
                text: qsTr("Side C")
                Layout.minimumWidth: 60
            }
            TextField
            {
                id: _textFieldSideC
            }
        }
        RowLayout
        {
            Button
            {
                id : _buttonCalc
                text: qsTr("Calculate")
                Layout.minimumWidth: 60
                onClicked: calculateArea()
            }
            TextField
            {
                id: _textFieldResult
            }
        }
        TextField
        {
            id: _textFieldValueP
            visible: false
        }
    }

    function calculateArea()
    {
        _textFieldValueP.text = (Math.pow(_textFieldSideA.text,1)+Math.pow(_textFieldSideB.text,1)+Math.pow(_textFieldSideC.text,1))/2
        _textFieldResult.text = Math.sqrt(Math.pow(_textFieldValueP.text,1)*(Math.pow(_textFieldValueP.text,1) - _textFieldSideA.text)*(Math.pow(_textFieldValueP.text,1) - _textFieldSideB.text)*(Math.pow(_textFieldValueP.text,1) - _textFieldSideC.text))
    }
}
