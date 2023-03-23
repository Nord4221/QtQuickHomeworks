import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2
import "ApiCommands.js" as ApiCommands
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    Item
    {
        id: _itemObj
        anchors.fill: parent
        ListModel
        {
            id: model
        }
        ListView
        {
            id: listview
            anchors.fill: parent
            model: model
            header: Rectangle
            {
                height: 35
                width: parent.width
                color: "dark green"

                Text
                {
                    anchors.centerIn: parent
                    text: "Данные от сервера"
                    color: "white"
                }
            }
            delegate: Rectangle
            {
                width:parent.width
                height: 30
                Text
                {
                    text: listdata
                    anchors.centerIn: parent
                }
            }
        }
        Column
        {
            anchors.bottom: parent.bottom
            visible: true
            Button
            {
                width: _itemObj.width
                text: "Подтянуть данные"
                onClicked: ApiCommands.getData()
            }
            Button
            {
                width: _itemObj.width
                text: "Получить один случайный факт"
                onClicked: ApiCommands.getOneRandomFact()
            }
        }
    }
}
