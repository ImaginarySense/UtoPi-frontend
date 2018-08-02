#ifndef SCREENCONTROLLER_H
#define SCREENCONTROLLER_H

#include <QObject>
#include <QtDebug>

class ScreenController : public QObject
{
    Q_OBJECT
    Q_ENUMS(RefreshTypes)
public:
    explicit ScreenController(QObject *parent = nullptr);
    enum RefreshTypes
    {
        fast,
        partial,
        full
    };
    Q_INVOKABLE void fastRefresh(QVariant frame);
    Q_INVOKABLE void partialRefresh(QVariant frame);
    Q_INVOKABLE void fullRefresh(QVariant frame);
    void refresh(RefreshTypes refreshCode, QVariant frame);

signals:

public slots:
};

#endif // SCREENCONTROLLER_H
