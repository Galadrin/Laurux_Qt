#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "src/settings.h"
#include "src/model/colormodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setOrganizationName("Laurux");
    QCoreApplication::setOrganizationDomain("laurux.fr");
    QCoreApplication::setApplicationName("Laurux");

    QGuiApplication app(argc, argv);
    ColorListModel colorModel;
    LSettings *app_settings = new LSettings();
    app_settings->loadSettings();
    QList<QString> keys = app_settings->getStyleList();
    for(QString key : keys) {
        LSettingStyle* style = app_settings->getStyleItem(key);
        colorModel.add(key.toUtf8(), style->getBackground(), style->getFont());
    }
    ColorModel coulFond = colorModel.get("Coulfonds");
    ColorModel Btns = colorModel.get("Btns");
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty ("Coulfonds", &coulFond);
    engine.rootContext()->setContextProperty ("Btns", &Btns);

    engine.load(QUrl(QLatin1String("qrc:/qml/Main.qml")));
//    engine.load(QUrl(QLatin1String("qrc:/qml/Parameters.qml")));
    int ret = app.exec();
    delete app_settings;
    return ret;
}
