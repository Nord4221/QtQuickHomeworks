import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQuick.Controls.Styles 1.4
import QtCharts 2.0
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: _buttonRow.width
    height: 480
    title: qsTr("Graph print")
    Item
    {
        anchors.fill: parent
        ChartView
        {
            title: " Graphic"
            id: _chartViewObj
            anchors.fill: parent
            antialiasing: true
            LineSeries
            {
                id: _lineSeriesObj
                name:  propertiesHandler.propertyName
                color: propertiesHandler.propertyColor
                XYPoint { x: 1.1; y: 2.1 }
                XYPoint { x: 1.9; y: 3.3 }
                XYPoint { x: 2.1; y: 2.1 }
                XYPoint { x: 2.9; y: 1 }
                onDoubleClicked: fillGraph()
                onPointAdded: console.log("+point")
            }
        }
    }
    RowLayout
    {
        id: _buttonRow
        anchors.bottom: parent.bottom
        Button
        {
            text: "GRAPH_SIN"
            onClicked:
            {
                propertiesHandler.propertyGraphType = 0
                fillGraph()
            }
        }
        Button
        {
            text: "GRAPH_LIN"
            onClicked:
            {
                propertiesHandler.propertyGraphType = 1
                fillGraph()
            }
        }
        Button
        {
            text: "GRAPH_MOD"
            onClicked:
            {
                propertiesHandler.propertyGraphType = 2
                fillGraph()
            }
        }
        Button
        {
            text: "GRAPH_POW"
            onClicked:
            {
                propertiesHandler.propertyGraphType = 3
                fillGraph()
            }
        }
        Button
        {
            text: "GRAPH_LOG"
            onClicked:
            {
                propertiesHandler.propertyGraphType = 4
                fillGraph()
            }
        }
        Button
        {
            text: "zoomIn"
            onClicked:
            {
                _chartViewObj.zoomIn()
            }
        }
        Button
        {
            text: "zoomOut"
            onClicked:
            {
                _chartViewObj.zoomOut()
            }
        }
    }

   function fillGraph()
   {
       _lineSeriesObj.clear()
       var x
       var y
       for(var i = 0; i < 50; i++)
       {
           x = propertiesHandler.propertyValuesX[i]
           y = propertiesHandler.propertyValuesY[i]
           _lineSeriesObj.append(x, y)
       }

   }
}
