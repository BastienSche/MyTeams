/********************************************************************************
** Form generated from reading UI file 'contacts.ui'
**
** Created by: Qt User Interface Compiler version 6.2.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_CONTACTS_H
#define UI_CONTACTS_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>
#include <QtWidgets/QLabel>

QT_BEGIN_NAMESPACE

class Ui_Contacts
{
public:
    QLabel *label;

    void setupUi(QDialog *Contacts)
    {
        if (Contacts->objectName().isEmpty())
            Contacts->setObjectName(QString::fromUtf8("Contacts"));
        Contacts->resize(537, 385);
        label = new QLabel(Contacts);
        label->setObjectName(QString::fromUtf8("label"));
        label->setGeometry(QRect(200, 70, 91, 16));

        retranslateUi(Contacts);

        QMetaObject::connectSlotsByName(Contacts);
    } // setupUi

    void retranslateUi(QDialog *Contacts)
    {
        Contacts->setWindowTitle(QCoreApplication::translate("Contacts", "Dialog", nullptr));
        label->setText(QCoreApplication::translate("Contacts", "Contact page", nullptr));
    } // retranslateUi

};

namespace Ui {
    class Contacts: public Ui_Contacts {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_CONTACTS_H
