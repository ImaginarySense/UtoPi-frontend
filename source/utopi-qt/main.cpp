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
