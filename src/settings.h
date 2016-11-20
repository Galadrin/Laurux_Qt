#ifndef SETTINGS_H
#define SETTINGS_H

#include <QSettings>
#include <QString>
#include <QMediaPlayer>
#include <QDir>
#include <QColor>
#include <QFont>
#include <QGuiApplication>

class LSettings : public QObject
{
    Q_OBJECT
public:
    LSettings(QObject *parent = nullptr);
    ~LSettings();

    QSettings* settings;
    QString filename;

    QMediaPlayer* player = NULL;

    void loadSettings();
    void coul();

private:
    QString socId = QString("Soc01");
    QString versionT = QString();
    QColor otherColor, fondColor;
};

#endif // SETTINGS_H
