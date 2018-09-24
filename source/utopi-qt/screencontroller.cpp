// Copyright 2018 Imaginary Sense <support@imaginary.tech>
// Copyright 2018 Javier O. Cordero Pérez <javier@imaginary.tech>
// Copyright 2018 Victor A. Ortiz Alvarado <va2ron1@imaginary.tech>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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
//    qDebug() << code;

    // Prepare image for use in device
    QImage image = frame.value<QImage>();
//    qDebug() << "Image";
//    qDebug() <<  image;
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
//    qDebug() << result;
}
