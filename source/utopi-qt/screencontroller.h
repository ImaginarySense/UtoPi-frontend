#ifndef SCREENCONTROLLER_H
#define SCREENCONTROLLER_H

#include <QObject>
#include <QtDebug>

class ScreenController : public QObject
{
    Q_OBJECT
public:
    explicit ScreenController(QObject *parent = nullptr);

    Q_INVOKABLE void test(QVariant frame);

signals:

public slots:
};

#endif // SCREENCONTROLLER_H
