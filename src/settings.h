#ifndef SETTINGS_H
#define SETTINGS_H

#include <QSettings>
#include <QString>
#include <QMediaPlayer>
#include <QDir>
#include <QColor>
#include <QFont>
#include <QGuiApplication>
#include <QHash>
#include <QPalette>

///
/// \brief The LSettingStyle class
///
class LSettingStyle : public QObject
{
    Q_OBJECT

public:
    LSettingStyle(){}
    LSettingStyle(QString styleDefinition);
    ~LSettingStyle() {}

    QColor getBackground() {return background;}
    QFont getFont() {return font;}
    QString getFontName();
    qint8 getFontSize();

    static QFont parseFont(QString fontString);

private:
    QColor background = QGuiApplication::palette().color(QPalette::Window);
    QString fontName = QGuiApplication::font().family();
    qint8 size = QGuiApplication::font().pointSize();
    QFont font = QGuiApplication::font();
};

///
/// \brief The LSettings class
///
class LSettings : public QObject
{
    Q_OBJECT

public:
    LSettings(QObject *parent = nullptr);
    ~LSettings();

    QSettings* settings;
    QString filename;

    QMediaPlayer* player;

    void loadSettings();
    Q_INVOKABLE LSettingStyle* getStyleItem(QString name);
    Q_INVOKABLE QList<QString> getStyleList();

private:
    QString socId = QString("Soc01");
    QString versionT = QString();
    QHash<QString, LSettingStyle*> style_map;
};

#endif // SETTINGS_H
