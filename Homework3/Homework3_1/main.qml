import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtQml 2.2

Window
{
    id: primaryFrame
    width: _columnlayout.width
    height: _columnlayout.height
    visible: true
    title: qsTr("Dating form")

    property string userParametersWindowStateName: "user_params"
    property string partnerParametersWindowStateName: "partner_params"
    property string foundPartnerWindowStateName: "partner_search"
    property string foundwStateName: "indicator_hidden"
    ColumnLayout
    {
        anchors.centerIn: parent
        id: _columnlayout
        spacing: 2

        ColumnLayout
        {
            anchors.centerIn: parent
            id: _columnlayoutRegistration
            spacing: 2

            state: userParametersWindowStateName
            states:
            [
                State
                {
                    name: userParametersWindowStateName
                    PropertyChanges
                    {
                        target: _columnlayoutUser;
                        visible: true
                    }
                    PropertyChanges
                    {
                        target: _columnlayoutPartner;
                        visible: false
                    }
                },
                State
                {
                    name: partnerParametersWindowStateName
                    PropertyChanges
                    {
                        target: _columnlayoutUser;
                        visible: false
                    }
                    PropertyChanges
                    {
                        target: _columnlayoutPartner;
                        visible: true
                    }
                }
            ]

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
        ColumnLayout
        {
            id: _columnlayoutFoundPartner
            spacing: 2
            visible: false
            opacity: 0.0
            states: State
            {
                name: "partner_search"
                when: _buttonReg.clicked
                PropertyChanges
                {
                    target: _columnlayoutFoundPartner
                    visible: true;
                    opacity: 1.0
                }
                PropertyChanges
                {
                    target: _columnlayoutRegistration
                    visible: false;
                }
            }
            transitions: Transition
            {
                to: "partner_search"
                reversible: false
                SequentialAnimation
                {
                    PropertyAnimation
                    {
                        target: _columnlayoutFoundPartner
                        property: "opacity";
                        duration: 5000
                    }
                }
            }
            Button
            {
                id: _buttonFindPartner
                text: qsTr("Find Partner")
                onClicked: switchMenu()
            }
        }
        BusyIndicator
        {
           id: _indicatorSearch
           visible: false
           states:
           [
               State
               {
                   name: "indicator_shown"
                   when: _buttonFindPartner.pressed
                   PropertyChanges
                   {
                       target: _indicatorSearch
                       visible: true
                       running: image.status === Image.Loading
                   }
               }
           ]
        }
    }
    function switchMenu()
    {
         if (_columnlayoutRegistration.state == partnerParametersWindowStateName)
         {
             _columnlayoutRegistration.state = userParametersWindowStateName
         }
         else
         {
             _columnlayoutRegistration.state = partnerParametersWindowStateName
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
        _columnlayoutFoundPartner.state = foundPartnerWindowStateName;
    }
}
