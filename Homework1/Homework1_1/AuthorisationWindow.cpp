#include "AuthorisationWindow.h"
#include "ui_AuthorisationWindow.h"
#include <QDebug>
#include <QThread>

AuthorisationWindow::AuthorisationWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::AuthorisationWindow)
{
    ui->setupUi(this);
    ui->lineEditPassword->setEchoMode(QLineEdit::Password);
    connect(ui->pushButtonEnter, &QPushButton::clicked, this, &AuthorisationWindow::SlotEnterTheProgram);
}

AuthorisationWindow::~AuthorisationWindow()
{
    delete ui;
}

void AuthorisationWindow::SlotEnterTheProgram()
{
    if(UsernameCheck() && PasswordCheck())
    {
        ui->pushButtonEnter->hide();
        ui->lineEditUsername->hide();
        ui->lineEditPassword->hide();
         qDebug() << "Успех";
    }
    else
    {
        ShakeAnimation();
        qDebug() << "Неудача";
        return;
    }
}

bool AuthorisationWindow::UsernameCheck()
{
    if(ui->lineEditUsername->text() == "login")
        return true;
    else
        return false;
}

bool AuthorisationWindow::PasswordCheck()
{
    if(ui->lineEditPassword->text() == "password")
        return true;
    else
        return false;

}

void AuthorisationWindow::ShakeAnimation()
{
    int posX = ui->centralWidget->x();
    int posY = ui->centralWidget->x();

    for (int i = posX; i <= posX + 5; i++)
    {
        ui->centralWidget->move(i,posY);
        this->repaint();
        this->thread()->usleep(100);
    }

    for (int i = posX + 5; i >= (posX-5); i--)
    {
        ui->centralWidget->move(i,posY);
        this->repaint();
        this->thread()->usleep(100);
    }

    for (int i = posX-5; i <= posX; i++)
    {
        ui->centralWidget->move(i,posY);
        this->repaint();
        this->thread()->usleep(100);
    }
}


