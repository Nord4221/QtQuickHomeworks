import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: _item.width
    height: _item.height
    title: qsTr("Hello World")
    Item
    {
        id: _item
        height: 450
        width: 330
        ListModel
        {
            id: books
            ListElement
            {
                group: "Fiction"
                name: "Dune"
                authorName: "H.F"
                iconPath: "qrc:/dune.png"
            }
            ListElement
            {
                group: "Fiction"
                name: "Bravery"
                authorName: "Idk"
                iconPath: "qrc:/Bravery.png"
            }
            ListElement
            {
                group: "Love story"
                name: "Black and white"
                authorName: "idk 2"
                iconPath: "qrc:/BnW.png"
            }
            ListElement
            {
                group: "Love story"
                name: "Autumn"
                authorName: "idk 3"
                iconPath: "qrc:/Autmn.png"
            }
       }
       ListView
       {
            id: list
            anchors.fill: parent
            model: books
            spacing: 1
            // Хэдер
            header: Rectangle
            {
                width: parent.width
                height: 20
                color: "darkblue"
                Text
                {
                    anchors.centerIn: parent
                    text: "Local library"
                    color: "white"
                }
            }
            // Футер
            footer: Rectangle
            {
                width: parent.width
                height: 20
                color: "darkgreen"
                Text
                {
                    anchors.centerIn: parent
                    text: "Created by me"
                    color: "white"
                }
             }

             section.delegate: Rectangle
             {
                width: parent.width
                height: 20
                color: "lightblue"
                Text
                {
                    anchors.centerIn: parent
                    text: section
                    color: "darkblue"
                    font.weight: Font.Bold
                }
              }
              section.property: "group"
              // Сами элементы
              delegate: Rectangle
              {
                  width: list.width
                  height: 50
                  radius: 3
                  border.width: 1
                  border.color: "darkgray"
                  color: "lightgray"
                  MouseArea
                  {
                      anchors.fill: parent
                      onDoubleClicked:
                      {
                          list.model.remove(index)
                      }
                  }
                 Column
                 {
                    anchors.fill: parent
                    Row
                    {
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text
                        {
                            text: "Название книги"
                            font.weight: Font.Bold
                        }
                        Text
                        {
                            text: name
                        }
                        spacing: 20
                    }
                    Row
                    {
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text
                        {
                            text: "Имя автора"
                            font.weight: Font.Bold
                        }
                        Text
                        {
                            text: authorName
                        }
                        spacing: 20
                    }
                    Row
                    {
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text
                        {
                            text: "Обложка"
                            font.weight: Font.Bold
                        }
                        Image
                        {
                            width: 20
                            height: 20
                            source: iconPath
                        }
                        spacing: 20
                    }
                } // Column
           }// Rectangle
           focus: true
           // Анимация появления элементов модели
           populate: Transition
           {
               NumberAnimation
               {
                   properties: "x,y"
                   duration: 1500
                   easing.type: Easing.OutExpo
               }
           }
           // Анимация добавления элементов
           add: Transition
           {
                NumberAnimation
                {
                    property: "opacity";
                    from: 0
                    to: 1.0
                    duration: 400
                }
                NumberAnimation
                {
                    property: "scale";
                    from: 0
                    to: 1.0
                    duration: 100
                }
            }
                    // Удаление элемента
            remove: Transition
            {
                PropertyAnimation
                {
                    property: "opacity"
                    to: 0
                    duration: 1000
                }
            }
                    // Вставка дефолтного пользователя при нажатии на пробел
            Keys.onSpacePressed: model.insert(1,
                                                  {
                                                      group: "Fiction",
                                                      name: "somebody",
                                                      authorName: "idk",
                                                      iconPath: "qrc:/dune.png"
                                                  }
                                              )

       }
    }

}
