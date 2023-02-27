/********************************************************************************
** Form generated from reading UI file 'call.ui'
**
** Created by: Qt User Interface Compiler version 6.2.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_CALL_H
#define UI_CALL_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>
#include <QtWidgets/QLabel>
#include <QtWidgets/QPushButton>

QT_BEGIN_NAMESPACE

class Ui_Call
{
public:
    QLabel *interlocutorName;
    QPushButton *endCallBTN;
    QPushButton *DisconnectBTN;

    void setupUi(QDialog *Call)
    {
        if (Call->objectName().isEmpty())
            Call->setObjectName(QString::fromUtf8("Call"));
        Call->resize(446, 293);
        Call->setMinimumSize(QSize(446, 0));
        interlocutorName = new QLabel(Call);
        interlocutorName->setObjectName(QString::fromUtf8("interlocutorName"));
        interlocutorName->setGeometry(QRect(170, 80, 81, 20));
        endCallBTN = new QPushButton(Call);
        endCallBTN->setObjectName(QString::fromUtf8("endCallBTN"));
        endCallBTN->setGeometry(QRect(170, 150, 91, 41));
        DisconnectBTN = new QPushButton(Call);
        DisconnectBTN->setObjectName(QString::fromUtf8("DisconnectBTN"));
        DisconnectBTN->setGeometry(QRect(20, 250, 81, 31));

        retranslateUi(Call);

        QMetaObject::connectSlotsByName(Call);
    } // setupUi

    void retranslateUi(QDialog *Call)
    {
        Call->setWindowTitle(QCoreApplication::translate("Call", "Dialog", nullptr));
        interlocutorName->setText(QCoreApplication::translate("Call", "Jean Dupont", nullptr));
        endCallBTN->setText(QCoreApplication::translate("Call", "End Call", nullptr));
        DisconnectBTN->setText(QCoreApplication::translate("Call", "Disconnect", nullptr));
    } // retranslateUi

};

namespace Ui {
    class Call: public Ui_Call {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_CALL_H
