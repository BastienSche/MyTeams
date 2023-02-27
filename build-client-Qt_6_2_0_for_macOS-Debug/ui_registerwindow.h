/********************************************************************************
** Form generated from reading UI file 'registerwindow.ui'
**
** Created by: Qt User Interface Compiler version 6.2.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_REGISTERWINDOW_H
#define UI_REGISTERWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QPushButton>

QT_BEGIN_NAMESPACE

class Ui_RegisterWindow
{
public:
    QPushButton *registerBTN;
    QLabel *label;
    QLineEdit *lineEditUsername;
    QPushButton *backBTN;
    QLineEdit *lineEditPassword;
    QLabel *label_2;

    void setupUi(QDialog *RegisterWindow)
    {
        if (RegisterWindow->objectName().isEmpty())
            RegisterWindow->setObjectName(QString::fromUtf8("RegisterWindow"));
        RegisterWindow->resize(400, 300);
        registerBTN = new QPushButton(RegisterWindow);
        registerBTN->setObjectName(QString::fromUtf8("registerBTN"));
        registerBTN->setGeometry(QRect(190, 150, 113, 32));
        label = new QLabel(RegisterWindow);
        label->setObjectName(QString::fromUtf8("label"));
        label->setGeometry(QRect(50, 80, 71, 16));
        lineEditUsername = new QLineEdit(RegisterWindow);
        lineEditUsername->setObjectName(QString::fromUtf8("lineEditUsername"));
        lineEditUsername->setGeometry(QRect(150, 80, 151, 21));
        backBTN = new QPushButton(RegisterWindow);
        backBTN->setObjectName(QString::fromUtf8("backBTN"));
        backBTN->setGeometry(QRect(40, 150, 113, 32));
        lineEditPassword = new QLineEdit(RegisterWindow);
        lineEditPassword->setObjectName(QString::fromUtf8("lineEditPassword"));
        lineEditPassword->setGeometry(QRect(150, 113, 151, 24));
        label_2 = new QLabel(RegisterWindow);
        label_2->setObjectName(QString::fromUtf8("label_2"));
        label_2->setGeometry(QRect(50, 110, 71, 16));

        retranslateUi(RegisterWindow);

        QMetaObject::connectSlotsByName(RegisterWindow);
    } // setupUi

    void retranslateUi(QDialog *RegisterWindow)
    {
        RegisterWindow->setWindowTitle(QCoreApplication::translate("RegisterWindow", "Dialog", nullptr));
        registerBTN->setText(QCoreApplication::translate("RegisterWindow", "Register", nullptr));
        label->setText(QCoreApplication::translate("RegisterWindow", "Username", nullptr));
        backBTN->setText(QCoreApplication::translate("RegisterWindow", "Back", nullptr));
        label_2->setText(QCoreApplication::translate("RegisterWindow", "Password", nullptr));
    } // retranslateUi

};

namespace Ui {
    class RegisterWindow: public Ui_RegisterWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_REGISTERWINDOW_H
