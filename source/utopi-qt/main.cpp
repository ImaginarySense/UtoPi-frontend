// Copyright 2018 Imaginary Sense <support@imaginary.tech>
// Copyright 2018 María A. Cordero Pérez <maria@imaginary.tech>
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

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "screencontroller.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    //
    QScopedPointer<ScreenController> screen(new ScreenController);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    //
    engine.rootContext()->setContextProperty("epd", screen.data());

    QObject *rootObject = qobject_cast<QObject*>(engine.rootObjects().first());
    QMetaObject::invokeMethod(rootObject, "fastRefresh");

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
