import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window
{
    visible: true
    width: 300
    height: 300
    minimumWidth: 300
    minimumHeight: 300
    title: qsTr("Dating form")

    Component
    {
        id: _componentLogin


        ColumnLayout
        {
            anchors.centerIn: parent
            id: _columnlayout
            spacing: 2
            RowLayout
            {
                Text
                {
                    id: _labelLogin
                    text: qsTr("User name:")
                    Layout.minimumWidth: 110
                }
                TextField
                {
                    id: _textFieldLogin
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: qsTr("Логин")
                }
            }
            RowLayout
            {
                Text
                {
                    id: _labelPassword
                    text: qsTr("Password:")
                    Layout.minimumWidth: 110
                }
                TextField
                {
                    id: _textFieldPassword
                    echoMode: TextInput.Password
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: qsTr("Пароль")
                }
            }
            Button
            {
                id: _buttonSubmit
                width: 200
                height: 40
                Layout.minimumWidth: 110
                background: Rectangle
                {
                    color: parent.down ? "#bbbbbb" : (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                }
                text: qsTr("Вход")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked:
                {
                    if ("login" === _textFieldLogin.text && "password" === _textFieldPassword.text)
                        loginUser()
                }

            }
        }

    }

    Component
    {
        id: _componentLogged

        Button
        {
            text: qsTr("Go back")
            onClicked:backToLogin()
        }
    }
    Loader
    {
        id: loader
        sourceComponent: _componentLogin
    }

    function loginUser()
    {
        loader.sourceComponent = _componentLogged
    }
    function backToLogin()
    {
        loader.sourceComponent = _componentLogin
    }


}
