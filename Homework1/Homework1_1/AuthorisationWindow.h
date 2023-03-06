#ifndef AUTHORISATIONWINDOW_H
#define AUTHORISATIONWINDOW_H

#include <QMainWindow>

namespace Ui {
class AuthorisationWindow;
}

class AuthorisationWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit AuthorisationWindow(QWidget *parent = nullptr);
    ~AuthorisationWindow();

public slots:
    void SlotEnterTheProgram();

private:
    bool UsernameCheck();
    bool PasswordCheck();
    void ShakeAnimation();
private:
    Ui::AuthorisationWindow *ui;

};

#endif // AUTHORISATIONWINDOW_H
