#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "src/settings.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setOrganizationName("Laurux");
    QCoreApplication::setOrganizationDomain("laurux.fr");
    QCoreApplication::setApplicationName("Laurux");

    QGuiApplication app(argc, argv);

    appSettings settings;
    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("settings", &settings);

//    engine.load(QUrl(QLatin1String("qrc:/qml/Main.qml")));
//    engine.load(QUrl(QLatin1String("qrc:/qml/Parameters.qml")));
    engine.load(QUrl(QLatin1String("qrc:/qml/Preferences.qml")));
    int ret = app.exec();
    return ret;
}
