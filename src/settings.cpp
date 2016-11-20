#include "settings.h"

LSettings::LSettings(QObject *parent)
{
    this->settings = new QSettings(QDir::homePath()+QString("/Laurux3.conf"), QSettings::IniFormat);
}

LSettings::~LSettings() {
    delete this->settings;
}

void LSettings::loadSettings()
{
    // Load General parameters
    QString soc_num = this->settings->value("Soc").toString();
    this->socId = QString("Soc").append(soc_num);
    if (this->settings->value("son", false).toBool()){
        this->player = new QMediaPlayer;
        this->player->setMedia(QUrl::fromLocalFile("son/warning.ogg"));
    }

    // Load version from dbase group
    this->versionT = this->settings->value("dbase/Version").toString();

    // Load application font
    QFont tempFont = QFont(QGuiApplication::font());
    QString default_font = QString().sprintf("%s,%d",\
                                             tempFont.family().toUtf8().constData(),\
                                             tempFont.pointSize());
    int pointSize = tempFont.pointSize();

    QStringList font_def = this->settings->value("Soc/Font", default_font)\
            .toString().split(',');
    if (font_def.size() > 0 && ~QString(font_def[0]).isEmpty())
        tempFont.setFamily(font_def[0]);
    if (font_def.size() > 1 && ~QString(font_def[1]).isEmpty()){
        // adapt pointSize if relative to current size
        if(font_def[1].startsWith('+') || font_def[1].startsWith('-')){
            pointSize += font_def[1].toInt();
        } else {
            pointSize = font_def[1].toInt();
        }
    }

    tempFont.setPointSize(pointSize);
    QGuiApplication::setFont(tempFont);

    // Load application style parameters
    settings->beginGroup("Coul");
    QStringList keys = settings->allKeys();
    if (keys.isEmpty())
    {
        settings->setValue("Fnets",\
                          QVariant("Background: &HDDDDDD&; "));
        settings->setValue("Btns",\
                          QVariant("Background: &HBDBDBD&; "));
        settings->setValue("Znss",\
                          QVariant("Background: &HFAFAFA&; "));
        settings->setValue("Znaff",\
                          QVariant("Background: &HEEEEEE&; "));
        settings->setValue("Focus",\
                          QVariant("Background: &HF9FFC7&; "));
        settings->setValue("Coulfonds",\
                          QVariant("255,252,216,"));
        settings->setValue("Others",\
                          QVariant("255,232,199,"));
        settings->setValue("Fcs",\
                          QVariant("Background: &HF9FFC7&"));
        settings->setValue("Stk",\
                          QVariant("Background: &HCFF58E&; Font: serif,9; "));
        settings->setValue("Facts",\
                          QVariant("Background: &HFFFFFF&; Font: Serif,9; "));
        settings->setValue("Avs",\
                          QVariant("Background: &HFFFFFF&; Font: Serif,9; "));
        settings->setValue("Bl",\
                          QVariant("Background: &HFFFFFF&; Font: Serif,9; "));
        settings->setValue("Devis",\
                          QVariant("Background: &HFFFFFF&; Font: Serif,9; "));
        settings->setValue("Cmde",\
                          QVariant("Background: &HFFFFFF&; Font: Serif,9; "));
        settings->setValue("Prf",\
                          QVariant("Background: &HFFFFFF&; Font: Serif,9; "));
        settings->setValue("Nstk",\
                          QVariant("Background: &HFFFFFF&; Font: Serif,9; "));
        settings->setValue("Eps",\
                          QVariant("Background: &HFFFFFF&; Font: Serif,9; "));
        settings->setValue("Spd",\
                          QVariant("Background: &HFFFFFF&; Font: Serif,9; "));
        settings->setValue("Motps",\
                          QVariant("Background: &HFFFFFF&; Font: Serif,9; "));
        settings->setValue("Momnt",\
                          QVariant("Background: &HFFFFFF&; Font: Serif,9; "));
    }
    settings->endGroup();
    settings->sync();
}

void LSettings::coul()
{
    settings->beginGroup("Coul");
    QStringList fondsList = settings->value("Coulfonds").toString().split(",");
    QStringList othersList = settings->value("Others").toString().split(",");

    otherColor = QColor(othersList[0].toInt(), othersList[1].toInt(),
            othersList[2].toInt(), othersList[3].toInt());
    fondColor = QColor(fondsList[0].toInt(), fondsList[1].toInt(),
            fondsList[2].toInt(), fondsList[3].toInt());
}
