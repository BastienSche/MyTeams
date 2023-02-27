/****************************************************************************
** Meta object code from reading C++ file 'Client.hpp'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.2.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../../client/Client.hpp"
#include <QtGui/qtextcursor.h>
#include <QScreen>
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'Client.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.2.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_ResponseHandler_t {
    const uint offsetsAndSize[14];
    char stringdata0[82];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(offsetof(qt_meta_stringdata_ResponseHandler_t, stringdata0) + ofs), len 
static const qt_meta_stringdata_ResponseHandler_t qt_meta_stringdata_ResponseHandler = {
    {
QT_MOC_LITERAL(0, 15), // "ResponseHandler"
QT_MOC_LITERAL(16, 11), // "sigWinState"
QT_MOC_LITERAL(28, 0), // ""
QT_MOC_LITERAL(29, 10), // "sigOnlines"
QT_MOC_LITERAL(40, 14), // "sigReceiveCall"
QT_MOC_LITERAL(55, 12), // "sigStartCall"
QT_MOC_LITERAL(68, 13) // "sigAcceptCall"

    },
    "ResponseHandler\0sigWinState\0\0sigOnlines\0"
    "sigReceiveCall\0sigStartCall\0sigAcceptCall"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ResponseHandler[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       5,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    1,   44,    2, 0x06,    1 /* Public */,
       3,    0,   47,    2, 0x06,    3 /* Public */,
       4,    1,   48,    2, 0x06,    4 /* Public */,
       5,    1,   51,    2, 0x06,    6 /* Public */,
       6,    0,   54,    2, 0x06,    8 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString,    2,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    2,
    QMetaType::Void, QMetaType::QString,    2,
    QMetaType::Void,

       0        // eod
};

void ResponseHandler::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<ResponseHandler *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->sigWinState((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->sigOnlines(); break;
        case 2: _t->sigReceiveCall((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 3: _t->sigStartCall((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 4: _t->sigAcceptCall(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (ResponseHandler::*)(const QString & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ResponseHandler::sigWinState)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (ResponseHandler::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ResponseHandler::sigOnlines)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (ResponseHandler::*)(const QString & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ResponseHandler::sigReceiveCall)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (ResponseHandler::*)(const QString & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ResponseHandler::sigStartCall)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (ResponseHandler::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ResponseHandler::sigAcceptCall)) {
                *result = 4;
                return;
            }
        }
    }
}

const QMetaObject ResponseHandler::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_ResponseHandler.offsetsAndSize,
    qt_meta_data_ResponseHandler,
    qt_static_metacall,
    nullptr,
qt_incomplete_metaTypeArray<qt_meta_stringdata_ResponseHandler_t
, QtPrivate::TypeAndForceComplete<ResponseHandler, std::true_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<const QString &, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<const QString &, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<const QString &, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>



>,
    nullptr
} };


const QMetaObject *ResponseHandler::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ResponseHandler::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ResponseHandler.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int ResponseHandler::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 5;
    }
    return _id;
}

// SIGNAL 0
void ResponseHandler::sigWinState(const QString & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void ResponseHandler::sigOnlines()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void ResponseHandler::sigReceiveCall(const QString & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void ResponseHandler::sigStartCall(const QString & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void ResponseHandler::sigAcceptCall()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}
struct qt_meta_stringdata_Window_t {
    const uint offsetsAndSize[10];
    char stringdata0[46];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(offsetof(qt_meta_stringdata_Window_t, stringdata0) + ofs), len 
static const qt_meta_stringdata_Window_t qt_meta_stringdata_Window = {
    {
QT_MOC_LITERAL(0, 6), // "Window"
QT_MOC_LITERAL(7, 9), // "StateSlot"
QT_MOC_LITERAL(17, 0), // ""
QT_MOC_LITERAL(18, 12), // "StopCallSlot"
QT_MOC_LITERAL(31, 14) // "SendRecordSlot"

    },
    "Window\0StateSlot\0\0StopCallSlot\0"
    "SendRecordSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Window[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       1,    1,   32,    2, 0x08,    1 /* Private */,
       3,    0,   35,    2, 0x08,    3 /* Private */,
       4,    0,   36,    2, 0x08,    4 /* Private */,

 // slots: parameters
    QMetaType::Void, QMetaType::QString,    2,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void Window::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Window *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->StateSlot((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->StopCallSlot(); break;
        case 2: _t->SendRecordSlot(); break;
        default: ;
        }
    }
}

const QMetaObject Window::staticMetaObject = { {
    QMetaObject::SuperData::link<QMainWindow::staticMetaObject>(),
    qt_meta_stringdata_Window.offsetsAndSize,
    qt_meta_data_Window,
    qt_static_metacall,
    nullptr,
qt_incomplete_metaTypeArray<qt_meta_stringdata_Window_t
, QtPrivate::TypeAndForceComplete<Window, std::true_type>
, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<const QString &, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>


>,
    nullptr
} };


const QMetaObject *Window::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Window::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Window.stringdata0))
        return static_cast<void*>(this);
    return QMainWindow::qt_metacast(_clname);
}

int Window::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 3)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 3;
    }
    return _id;
}
struct qt_meta_stringdata_Client_t {
    const uint offsetsAndSize[6];
    char stringdata0[22];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(offsetof(qt_meta_stringdata_Client_t, stringdata0) + ofs), len 
static const qt_meta_stringdata_Client_t qt_meta_stringdata_Client = {
    {
QT_MOC_LITERAL(0, 6), // "Client"
QT_MOC_LITERAL(7, 13), // "sigSendRecord"
QT_MOC_LITERAL(21, 0) // ""

    },
    "Client\0sigSendRecord\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Client[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   20,    2, 0x06,    1 /* Public */,

 // signals: parameters
    QMetaType::Void,

       0        // eod
};

void Client::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Client *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->sigSendRecord(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (Client::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Client::sigSendRecord)) {
                *result = 0;
                return;
            }
        }
    }
    (void)_a;
}

const QMetaObject Client::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_Client.offsetsAndSize,
    qt_meta_data_Client,
    qt_static_metacall,
    nullptr,
qt_incomplete_metaTypeArray<qt_meta_stringdata_Client_t
, QtPrivate::TypeAndForceComplete<Client, std::true_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>



>,
    nullptr
} };


const QMetaObject *Client::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Client::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Client.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Client::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 1)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 1;
    }
    return _id;
}

// SIGNAL 0
void Client::sigSendRecord()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
