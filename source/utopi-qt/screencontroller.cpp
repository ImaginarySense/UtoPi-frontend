#include <QImage>
//#include <QString>
//#include <QStringList>
#include <QProcess>
#include <QBuffer>
#include <QTemporaryFile>
#include "screencontroller.h"

ScreenController::ScreenController(QObject *parent) : QObject(parent)
{

}

void ScreenController::fastRefresh(QVariant frame)
{
    this->refresh(fast, frame);
}
void ScreenController::partialRefresh(QVariant frame)
{
    this->refresh(partial, frame);
}
void ScreenController::fullRefresh(QVariant frame)
{
    this->refresh(full, frame);
}
void ScreenController::refresh(RefreshTypes refreshCode, QVariant frame)
{
    const QString IMG_PATH = "out.bmp";

    // Cast enum to equivalent number string
    QString code = static_cast<QString>(refreshCode+48);
    qDebug() << code;

    // Prepare image for use in device
    QImage image = frame.value<QImage>();
    qDebug() << "Image";
    qDebug() <<  image;
    QTemporaryFile file;
    image.save(IMG_PATH);

//    QBuffer buffer(&image);
//    buffer.open(QIODevice::ReadOnly);
//    qDebug() << "Buffer";
//    qDebug() << buffer.readAll();

    // Run screen refreshing program
    // Path
    QString path = "python";
    // Arguments
    QStringList params;
    params << "screen.py" << code << IMG_PATH;
    // Execution
    QProcess *process = new QProcess();
    process->start(path,params,QIODevice::ReadWrite);  // DEV: QIO

    // Send frame as STDIN
    if (!process->waitForStarted())
        return;
//    process->write(image);
//    process->closeWriteChannel();

    if (!process->waitForFinished())
        return;
    QByteArray result = process->readAllStandardError();
    qDebug() << result;
}
