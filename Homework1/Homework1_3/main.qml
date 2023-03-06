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
                id: _textFieldSideA_X
            }
            TextField
            {
                id: _textFieldSideA_Y
            }
            TextField
            {
                id: _textFieldSideAB_Length
                visible: false
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
                id: _textFieldSideB_X
            }
            TextField
            {
                id: _textFieldSideB_Y
            }
            TextField
            {
                id: _textFieldSideBC_Length
                visible: false
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
                id: _textFieldSideC_X
            }
            TextField
            {
                id: _textFieldSideC_Y
            }
            TextField
            {
                id: _textFieldSideCA_Length
                visible: false
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

    function calculateLengths()
    {
        _textFieldSideAB_Length.text = Math.sqrt(Math.pow(Math.pow(_textFieldSideB_X.text,1)-Math.pow(_textFieldSideA_X.text,1),2)+ Math.pow(Math.pow(_textFieldSideB_Y.text,1)-Math.pow(_textFieldSideA_Y.text,1),2))
        _textFieldSideBC_Length.text = Math.sqrt(Math.pow(Math.pow(_textFieldSideC_X.text,1)-Math.pow(_textFieldSideB_X.text,1),2)+ Math.pow(Math.pow(_textFieldSideC_Y.text,1)-Math.pow(_textFieldSideB_Y.text,1),2))
        _textFieldSideCA_Length.text = Math.sqrt(Math.pow(Math.pow(_textFieldSideA_X.text,1)-Math.pow(_textFieldSideC_X.text,1),2)+ Math.pow(Math.pow(_textFieldSideA_Y.text,1)-Math.pow(_textFieldSideC_Y.text,1),2))
    }

    function calculateArea()
    {
        calculateLengths()
        _textFieldValueP.text = (Math.pow(_textFieldSideAB_Length.text,1)+Math.pow(_textFieldSideBC_Length.text,1)+Math.pow(_textFieldSideCA_Length.text,1))/2
        _textFieldResult.text = Math.sqrt(Math.pow(_textFieldValueP.text,1)*(Math.pow(_textFieldValueP.text,1) - _textFieldSideAB_Length.text)*(Math.pow(_textFieldValueP.text,1) - _textFieldSideBC_Length.text)*(Math.pow(_textFieldValueP.text,1) - _textFieldSideCA_Length.text))
    }
}
