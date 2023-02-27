/********************************************************************************
** Form generated from reading UI file 'finalwindow.ui'
**
** Created by: Qt User Interface Compiler version 6.2.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_FINALWINDOW_H
#define UI_FINALWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>
#include <QtWidgets/QGroupBox>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QPushButton>

QT_BEGIN_NAMESPACE

class Ui_FinalWindow
{
public:
    QGroupBox *groupBox;
    QLabel *Contact1;
    QPushButton *callBTN_1;
    QPushButton *pushButtonRefresh;
    QPushButton *pushButtonAddContact;
    QLineEdit *lineEditAddContact;
    QPushButton *pushButtonDisconnect;
    QPushButton *callBTN_2;
    QPushButton *callBTN_3;
    QPushButton *callBTN_4;
    QPushButton *callBTN_7;
    QPushButton *callBTN_5;
    QPushButton *callBTN_8;
    QPushButton *callBTN_6;
    QLabel *Contact2;
    QLabel *Contact3;
    QLabel *Contact4;
    QLabel *Contact7;
    QLabel *Contact5;
    QLabel *Contact6;
    QLabel *Contact8;

    void setupUi(QDialog *FinalWindow)
    {
        if (FinalWindow->objectName().isEmpty())
            FinalWindow->setObjectName(QString::fromUtf8("FinalWindow"));
        FinalWindow->resize(626, 379);
        FinalWindow->setMinimumSize(QSize(400, 300));
        groupBox = new QGroupBox(FinalWindow);
        groupBox->setObjectName(QString::fromUtf8("groupBox"));
        groupBox->setGeometry(QRect(0, 0, 681, 381));
        groupBox->setAutoFillBackground(false);
        Contact1 = new QLabel(groupBox);
        Contact1->setObjectName(QString::fromUtf8("Contact1"));
        Contact1->setGeometry(QRect(40, 100, 81, 16));
        callBTN_1 = new QPushButton(groupBox);
        callBTN_1->setObjectName(QString::fromUtf8("callBTN_1"));
        callBTN_1->setGeometry(QRect(150, 90, 113, 32));
        pushButtonRefresh = new QPushButton(groupBox);
        pushButtonRefresh->setObjectName(QString::fromUtf8("pushButtonRefresh"));
        pushButtonRefresh->setGeometry(QRect(80, 30, 121, 24));
        pushButtonAddContact = new QPushButton(groupBox);
        pushButtonAddContact->setObjectName(QString::fromUtf8("pushButtonAddContact"));
        pushButtonAddContact->setGeometry(QRect(520, 30, 91, 24));
        lineEditAddContact = new QLineEdit(groupBox);
        lineEditAddContact->setObjectName(QString::fromUtf8("lineEditAddContact"));
        lineEditAddContact->setGeometry(QRect(390, 30, 113, 24));
        pushButtonDisconnect = new QPushButton(groupBox);
        pushButtonDisconnect->setObjectName(QString::fromUtf8("pushButtonDisconnect"));
        pushButtonDisconnect->setGeometry(QRect(10, 340, 80, 24));
        callBTN_2 = new QPushButton(groupBox);
        callBTN_2->setObjectName(QString::fromUtf8("callBTN_2"));
        callBTN_2->setGeometry(QRect(150, 160, 113, 32));
        callBTN_3 = new QPushButton(groupBox);
        callBTN_3->setObjectName(QString::fromUtf8("callBTN_3"));
        callBTN_3->setGeometry(QRect(150, 230, 113, 32));
        callBTN_4 = new QPushButton(groupBox);
        callBTN_4->setObjectName(QString::fromUtf8("callBTN_4"));
        callBTN_4->setGeometry(QRect(150, 300, 113, 32));
        callBTN_7 = new QPushButton(groupBox);
        callBTN_7->setObjectName(QString::fromUtf8("callBTN_7"));
        callBTN_7->setGeometry(QRect(460, 230, 113, 32));
        callBTN_5 = new QPushButton(groupBox);
        callBTN_5->setObjectName(QString::fromUtf8("callBTN_5"));
        callBTN_5->setGeometry(QRect(460, 90, 113, 32));
        callBTN_8 = new QPushButton(groupBox);
        callBTN_8->setObjectName(QString::fromUtf8("callBTN_8"));
        callBTN_8->setGeometry(QRect(460, 300, 113, 32));
        callBTN_6 = new QPushButton(groupBox);
        callBTN_6->setObjectName(QString::fromUtf8("callBTN_6"));
        callBTN_6->setGeometry(QRect(460, 160, 113, 32));
        Contact2 = new QLabel(groupBox);
        Contact2->setObjectName(QString::fromUtf8("Contact2"));
        Contact2->setGeometry(QRect(40, 170, 81, 16));
        Contact3 = new QLabel(groupBox);
        Contact3->setObjectName(QString::fromUtf8("Contact3"));
        Contact3->setGeometry(QRect(40, 240, 81, 16));
        Contact4 = new QLabel(groupBox);
        Contact4->setObjectName(QString::fromUtf8("Contact4"));
        Contact4->setGeometry(QRect(40, 300, 81, 16));
        Contact7 = new QLabel(groupBox);
        Contact7->setObjectName(QString::fromUtf8("Contact7"));
        Contact7->setGeometry(QRect(340, 240, 81, 16));
        Contact5 = new QLabel(groupBox);
        Contact5->setObjectName(QString::fromUtf8("Contact5"));
        Contact5->setGeometry(QRect(340, 100, 81, 16));
        Contact6 = new QLabel(groupBox);
        Contact6->setObjectName(QString::fromUtf8("Contact6"));
        Contact6->setGeometry(QRect(340, 170, 81, 16));
        Contact8 = new QLabel(groupBox);
        Contact8->setObjectName(QString::fromUtf8("Contact8"));
        Contact8->setGeometry(QRect(340, 300, 81, 16));

        retranslateUi(FinalWindow);

        QMetaObject::connectSlotsByName(FinalWindow);
    } // setupUi

    void retranslateUi(QDialog *FinalWindow)
    {
        FinalWindow->setWindowTitle(QCoreApplication::translate("FinalWindow", "Dialog", nullptr));
        groupBox->setTitle(QString());
        Contact1->setText(QCoreApplication::translate("FinalWindow", "Jean Dupont", nullptr));
        callBTN_1->setText(QCoreApplication::translate("FinalWindow", "Call", nullptr));
        pushButtonRefresh->setText(QCoreApplication::translate("FinalWindow", "Refresh contacts", nullptr));
        pushButtonAddContact->setText(QCoreApplication::translate("FinalWindow", "Add Contact", nullptr));
        pushButtonDisconnect->setText(QCoreApplication::translate("FinalWindow", "Disconnect", nullptr));
        callBTN_2->setText(QCoreApplication::translate("FinalWindow", "Call", nullptr));
        callBTN_3->setText(QCoreApplication::translate("FinalWindow", "Call", nullptr));
        callBTN_4->setText(QCoreApplication::translate("FinalWindow", "Call", nullptr));
        callBTN_7->setText(QCoreApplication::translate("FinalWindow", "Call", nullptr));
        callBTN_5->setText(QCoreApplication::translate("FinalWindow", "Call", nullptr));
        callBTN_8->setText(QCoreApplication::translate("FinalWindow", "Call", nullptr));
        callBTN_6->setText(QCoreApplication::translate("FinalWindow", "Call", nullptr));
        Contact2->setText(QCoreApplication::translate("FinalWindow", "Jean Dupont", nullptr));
        Contact3->setText(QCoreApplication::translate("FinalWindow", "Jean Dupont", nullptr));
        Contact4->setText(QCoreApplication::translate("FinalWindow", "Jean Dupont", nullptr));
        Contact7->setText(QCoreApplication::translate("FinalWindow", "Jean Dupont", nullptr));
        Contact5->setText(QCoreApplication::translate("FinalWindow", "Jean Dupont", nullptr));
        Contact6->setText(QCoreApplication::translate("FinalWindow", "Jean Dupont", nullptr));
        Contact8->setText(QCoreApplication::translate("FinalWindow", "Jean Dupont", nullptr));
    } // retranslateUi

};

namespace Ui {
    class FinalWindow: public Ui_FinalWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_FINALWINDOW_H
