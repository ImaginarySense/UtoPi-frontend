/****************************************************************************
** Meta object code from reading C++ file 'screencontroller.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.11.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../utopi-qt/screencontroller.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'screencontroller.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.11.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_ScreenController_t {
    QByteArrayData data[10];
    char stringdata0[94];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ScreenController_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ScreenController_t qt_meta_stringdata_ScreenController = {
    {
QT_MOC_LITERAL(0, 0, 16), // "ScreenController"
QT_MOC_LITERAL(1, 17, 11), // "fastRefresh"
QT_MOC_LITERAL(2, 29, 0), // ""
QT_MOC_LITERAL(3, 30, 5), // "frame"
QT_MOC_LITERAL(4, 36, 14), // "partialRefresh"
QT_MOC_LITERAL(5, 51, 11), // "fullRefresh"
QT_MOC_LITERAL(6, 63, 12), // "RefreshTypes"
QT_MOC_LITERAL(7, 76, 4), // "fast"
QT_MOC_LITERAL(8, 81, 7), // "partial"
QT_MOC_LITERAL(9, 89, 4) // "full"

    },
    "ScreenController\0fastRefresh\0\0frame\0"
    "partialRefresh\0fullRefresh\0RefreshTypes\0"
    "fast\0partial\0full"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ScreenController[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       0,    0, // properties
       1,   38, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    1,   29,    2, 0x02 /* Public */,
       4,    1,   32,    2, 0x02 /* Public */,
       5,    1,   35,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void, QMetaType::QVariant,    3,
    QMetaType::Void, QMetaType::QVariant,    3,
    QMetaType::Void, QMetaType::QVariant,    3,

 // enums: name, flags, count, data
       6, 0x0,    3,   42,

 // enum data: key, value
       7, uint(ScreenController::fast),
       8, uint(ScreenController::partial),
       9, uint(ScreenController::full),

       0        // eod
};

void ScreenController::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        ScreenController *_t = static_cast<ScreenController *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->fastRefresh((*reinterpret_cast< QVariant(*)>(_a[1]))); break;
        case 1: _t->partialRefresh((*reinterpret_cast< QVariant(*)>(_a[1]))); break;
        case 2: _t->fullRefresh((*reinterpret_cast< QVariant(*)>(_a[1]))); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject ScreenController::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_ScreenController.data,
      qt_meta_data_ScreenController,  qt_static_metacall, nullptr, nullptr}
};


const QMetaObject *ScreenController::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ScreenController::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ScreenController.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int ScreenController::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 3)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 3;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
