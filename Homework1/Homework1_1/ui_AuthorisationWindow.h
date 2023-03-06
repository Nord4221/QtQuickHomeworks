/********************************************************************************
** Form generated from reading UI file 'AuthorisationWindow.ui'
**
** Created by: Qt User Interface Compiler version 5.13.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_AUTHORISATIONWINDOW_H
#define UI_AUTHORISATIONWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_AuthorisationWindow
{
public:
    QWidget *centralWidget;
    QGridLayout *gridLayout;
    QLineEdit *lineEditUsername;
    QLineEdit *lineEditPassword;
    QPushButton *pushButtonEnter;
    QMenuBar *menuBar;
    QToolBar *mainToolBar;
    QStatusBar *statusBar;

    void setupUi(QMainWindow *AuthorisationWindow)
    {
        if (AuthorisationWindow->objectName().isEmpty())
            AuthorisationWindow->setObjectName(QString::fromUtf8("AuthorisationWindow"));
        AuthorisationWindow->resize(400, 300);
        AuthorisationWindow->setLayoutDirection(Qt::LeftToRight);
        centralWidget = new QWidget(AuthorisationWindow);
        centralWidget->setObjectName(QString::fromUtf8("centralWidget"));
        gridLayout = new QGridLayout(centralWidget);
        gridLayout->setSpacing(6);
        gridLayout->setContentsMargins(11, 11, 11, 11);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        lineEditUsername = new QLineEdit(centralWidget);
        lineEditUsername->setObjectName(QString::fromUtf8("lineEditUsername"));
        lineEditUsername->setAlignment(Qt::AlignCenter);

        gridLayout->addWidget(lineEditUsername, 0, 0, 1, 1);

        lineEditPassword = new QLineEdit(centralWidget);
        lineEditPassword->setObjectName(QString::fromUtf8("lineEditPassword"));
        lineEditPassword->setAlignment(Qt::AlignCenter);

        gridLayout->addWidget(lineEditPassword, 1, 0, 1, 1);

        pushButtonEnter = new QPushButton(centralWidget);
        pushButtonEnter->setObjectName(QString::fromUtf8("pushButtonEnter"));
        QSizePolicy sizePolicy(QSizePolicy::Fixed, QSizePolicy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(pushButtonEnter->sizePolicy().hasHeightForWidth());
        pushButtonEnter->setSizePolicy(sizePolicy);
        pushButtonEnter->setLayoutDirection(Qt::LeftToRight);

        gridLayout->addWidget(pushButtonEnter, 2, 0, 1, 1);

        AuthorisationWindow->setCentralWidget(centralWidget);
        menuBar = new QMenuBar(AuthorisationWindow);
        menuBar->setObjectName(QString::fromUtf8("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 400, 21));
        AuthorisationWindow->setMenuBar(menuBar);
        mainToolBar = new QToolBar(AuthorisationWindow);
        mainToolBar->setObjectName(QString::fromUtf8("mainToolBar"));
        AuthorisationWindow->addToolBar(Qt::TopToolBarArea, mainToolBar);
        statusBar = new QStatusBar(AuthorisationWindow);
        statusBar->setObjectName(QString::fromUtf8("statusBar"));
        AuthorisationWindow->setStatusBar(statusBar);

        retranslateUi(AuthorisationWindow);

        QMetaObject::connectSlotsByName(AuthorisationWindow);
    } // setupUi

    void retranslateUi(QMainWindow *AuthorisationWindow)
    {
        AuthorisationWindow->setWindowTitle(QCoreApplication::translate("AuthorisationWindow", "AuthorisationWindow", nullptr));
        lineEditUsername->setPlaceholderText(QCoreApplication::translate("AuthorisationWindow", "\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \320\273\320\276\320\263\320\270\320\275", nullptr));
        lineEditPassword->setPlaceholderText(QCoreApplication::translate("AuthorisationWindow", "\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \320\277\320\260\321\200\320\276\320\273\321\214", nullptr));
        pushButtonEnter->setText(QCoreApplication::translate("AuthorisationWindow", "\320\222\320\276\320\271\321\202\320\270", nullptr));
    } // retranslateUi

};

namespace Ui {
    class AuthorisationWindow: public Ui_AuthorisationWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_AUTHORISATIONWINDOW_H
