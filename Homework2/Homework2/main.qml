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
    title: qsTr("Dating form")
    ColumnLayout
    {
        anchors.centerIn: parent
        id: _columnlayout
        spacing: 2
        ColumnLayout
        {
            id: _columnlayoutUser
            visible: true
            RowLayout
            {
                Text
                {
                    id: _labelUserName
                    text: qsTr("User name:")
                    Layout.minimumWidth: 110
                }
                TextField
                {
                    id: _textFieldUserName
                }
            }
            RowLayout
            {
                Text
                {
                    id: _labelUserAge
                    text: qsTr("Age")
                    Layout.minimumWidth: 110
                }
                TextField
                {
                    id: _textFieldUserAge
                    inputMask: "99"
                }
            }
            RowLayout
            {
                Text
                {
                    id: _labelUserGender
                    text: qsTr("Gender")
                    Layout.minimumWidth: 110
                }
                ComboBox
                {
                    id: _comboBoxUserGender
                    model: ["Male", "Female", "Attack Helicopter"]
                }
            }
            RowLayout
            {
                Text
                {
                    id: _labelUserEducationLevel
                    text: qsTr("Education level")
                    Layout.minimumWidth: 110
                }
                ComboBox
                {
                    id: _comboBoxUserEducation
                    model: ["Post-secondary", "Bachelor's", "Master's"]
                }
            }
            RowLayout
            {
                Text
                {
                    id: _labelHobbies
                    text: qsTr("Hobbies")
                    Layout.minimumWidth: 110
                }
                CheckBox
                {
                    id: _checkBoxTravelling
                    checked: false
                    text: qsTr("Travelling")
                }
                CheckBox
                {
                    id: _checkBoxCooking
                    checked: false
                    text: qsTr("Cooking")
                }
                CheckBox
                {
                    id: _checkBoxHorseRiding
                    checked: false
                    text: qsTr("Horse riding")
                }
            }
        }
        ColumnLayout
        {
            id: _columnlayoutPartner
            visible: false
            RowLayout
            {
                Text
                {
                    id: _labelParnerAge
                    text: qsTr("Preffered partner age")
                    Layout.minimumWidth: 110
                }
                ComboBox
                {
                    id: _comboBoxPartnerPrefferedAge
                    model: ["18-27", "27-35", "35-44", "44-52","52-.."]
                }
            }
            RowLayout
            {
                Text
                {
                    id: _labelPartnerGender
                    text: qsTr("Gender")
                    Layout.minimumWidth: 110
                }
                ComboBox
                {
                    id: _comboBoxPartnerGender
                    model: ["Male", "Female", "Attack Helicopter"]
                }
            }
            RowLayout
            {
                Text
                {
                    id: _labelPartnerEducationLevel
                    text: qsTr("Education level")
                    Layout.minimumWidth: 110
                }
                ComboBox
                {
                    id: _comboBoxPartnerEducation
                    model: ["Post-secondary", "Bachelor's", "Master's"]
                }
            }
        }
        RowLayout
        {
            Button
            {
                id: _buttonReg
                text: qsTr("Registration")
                Layout.minimumWidth: 110
                onClicked: registrateUser()
            }
            Button
            {
                id: _buttonSwitchMenu
                text: qsTr("ChangeMenu")
                Layout.minimumWidth: 110
                onClicked: switchMenu()
            }
        }
    }

    function switchMenu()
    {
        if(_columnlayoutPartner.visible == false)
        {
            _columnlayoutUser.visible = false
            _columnlayoutPartner.visible = true
        }
        else
        {
            _columnlayoutPartner.visible = false
            _columnlayoutUser.visible = true
        }
    }

    function registrateUser()
    {
        console.log(
                        "\n User params: ",
                        "\n User name: ", _textFieldUserName.text,
                        "\n User age : ", _textFieldUserAge.text,
                        "\n User gender   : ", _comboBoxUserGender.currentText,
                        "\n User education: ", _comboBoxUserEducation.currentText,
                        "\n Hobbies: "
                   )
        if(_checkBoxCooking.checked)
            console.log(" Cooking ")
        if(_checkBoxTravelling.checked)
            console.log(" Travelling ")
        if(_checkBoxHorseRiding.checked)
            console.log(" HorseRiding")

        console.log(
                        "\n Partner params: ",
                        "\n Preffered age : ", _comboBoxPartnerPrefferedAge.currentText,
                        "\n Partner gender: ", _comboBoxPartnerGender.currentText,
                        "\n Partner education: ", _comboBoxPartnerEducation.currentText
                   )
    }
}
