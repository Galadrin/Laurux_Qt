#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "src/settings.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setOrganizationName("Laurux");
    QCoreApplication::setOrganizationDomain("laurux.fr");
    QCoreApplication::setApplicationName("Laurux");

    QGuiApplication app(argc, argv);

    LSettings *app_settings = new LSettings();
    app_settings->loadSettings();

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/qml/Main.qml")));
    return app.exec();
}
