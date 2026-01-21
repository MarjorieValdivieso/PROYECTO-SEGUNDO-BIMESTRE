#include "login.h"
#include "ui_login.h"

Login::Login(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Login) //
{
    ui->setupUi(this);
    ui->USUARIO->setPlaceholderText("Ingrese su usuario");
    ui->CONTRASEÑA->setPlaceholderText("Ingrese su contraseña");
    ui->contrasenia->setEchoMode(QLineEdit::Password);
}

