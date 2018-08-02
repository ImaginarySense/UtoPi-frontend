#include <QImage>
//#include <QString>
//#include <QStringList>
#include <QProcess>
#include "screencontroller.h"

ScreenController::ScreenController(QObject *parent) : QObject(parent)
{

}

void ScreenController::test(QVariant frame)
{
    qDebug() << "Sending image to device";
    QImage image = frame.value<QImage>();

    QString path = "python";     // Name/location.
    QStringList args;
    args << "screen.py"; // Arguments...
    QProcess * exec;  // The Process.
//    exec->setProcessChannelMode(image);

}
