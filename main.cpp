#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "ColorUtil.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("colorUtil", new ColorUtil(&app));
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
