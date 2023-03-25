import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import Qt.labs.qmlmodels 1.0
import QtQuick.LocalStorage 2.12
import "DatabaseController.js" as DbController

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    property int cellHorizontalSpacing: 10
    property var db_1
    property var db_2
    property var db
    TableModel
    {
        id: tableModel
        TableModelColumn { display: "id" }
        TableModelColumn { display: "first_name" }
        TableModelColumn { display: "last_name" }
        TableModelColumn { display: "email" }
        TableModelColumn { display: "phone" }
        rows: []
        onDataChanged: console.log("2")
    }

    TableView
    {
        id: table
        anchors.fill: parent
        columnSpacing: 0
        rowSpacing: 0
        model: tableModel

        delegate: Rectangle
        {
            implicitWidth: Math.max(100, /*left*/ cellHorizontalSpacing + innerText.width + /*right*/cellHorizontalSpacing)
            implicitHeight: 50
            border.width: 1

            TextEdit
            {
                id: innerText
                text: display
                anchors.centerIn: parent
                onEditingFinished:
                {
                    display = text
                    var currentRowId = parent.y/parent.implicitHeight;
                    try
                    {
                    db.transaction((tx) => {
                                             DbController.updateContact(tx, tableModel.getRow(currentRowId).id,
                                                                            tableModel.getRow(currentRowId).first_name,
                                                                            tableModel.getRow(currentRowId).last_name,
                                                                            tableModel.getRow(currentRowId).email,
                                                                            tableModel.getRow(currentRowId).phone)
                                           }
                                  )
                    }
                    catch (err)
                    {
                        console.log("Error creating or updating table in database: " + err)
                    }
                }
            }
        }

    }

    Column
    {
        anchors.centerIn: parent
        MyOwnComboBox
        {
            id: _comboBox
            textRole: "key"
            model: ListModel
            {
                ListElement { key: "First Db"; value: 1 }
                ListElement { key: "Second Db"; value: 2 }
            }
            onActivated:
            {
                console.log(_comboBox.model.get(currentIndex).value)
                fillDatabases(_comboBox.model.get(currentIndex).value)
            }
        }
        Button
        {
            width:  _comboBox.width
            height: _comboBox.height
            text: "Добавить человека"
            onClicked: dialog.open()
        }
    }
    Dialog
    {
        id: dialog
        anchors.centerIn: parent
        title: "Add person"
        standardButtons: Dialog.Ok | Dialog.Cancel
        Column
        {
            anchors.fill: parent
            spacing: 5
            TextField
            {
                id: firstName
                placeholderText: "Имя"
            }
            TextField
            {
                id: lastName
                placeholderText: "Фамилия"
            }
            TextField
            {
                id: email
                placeholderText: "E-mail"
            }
            TextField
            {
                id: phone
                placeholderText: "Номер телефона"
            }
        }
        onAccepted:
        {
            try
            {
                db.transaction((tx) =>
                               {
                                    var resObj = DbController.addContact(tx, firstName.text,
                                                                                lastName.text,
                                                                                email.text,
                                                                                phone.text);
                                    if (resObj.rowsAffected !== 0)
                                    {
                                        tableModel.appendRow(
                                                               {
                                                                    id: resObj.insertId,
                                                                    first_name: firstName.text,
                                                                    last_name: lastName.text,
                                                                    email: email.text,
                                                                    phone: phone.text
                                                                }
                                                            )
                                    }
                               }
                              )
            }
            catch (err)
            {
                console.log("Error creating or updating table in database: " + err)
            }
        }
    }


    Component.onCompleted:
    {
          db_1 = LocalStorage.openDatabaseSync("DBExample", "1.0", "Пример локальной базы данных ", 1000)
          db_2 = LocalStorage.openDatabaseSync("DBExample_2", "1.0", "Пример локальной базы данных 2", 1000)
          fillDatabases(1)
    }

    function fillDatabases(currentCheckBoxState)
    {
        if(currentCheckBoxState == 1)
            db = db_1
        else if(currentCheckBoxState == 2)
            db = db_2
        tableModel.clear()
        try
        {
            db.transaction((tx) => { DbController.readContacts(tx, table.model) })
        }
        catch (err)
        {
            console.log("Error creating or updating table in database: " + err)
        }
    }
}
