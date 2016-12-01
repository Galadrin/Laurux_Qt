#include "settings.h"

///
/// \brief LSettings::LSettings
/// \param parent
///
LSettings::LSettings(QObject *parent)
{
    this->settings = new QSettings(QDir::homePath()+QString("/Laurux3.conf"), QSettings::IniFormat);
}

///
/// \brief LSettings::~LSettings
///
LSettings::~LSettings() {
    // free handler on setting file
    delete this->settings;
    // free the Media player ressources
    delete this->player;
    // clean hashmap values before destroy object
    QHashIterator<QString, LSettingStyle*> i(this->style_map);
    while (i.hasNext()) {
        i.next();
        delete i.value();
    }
}

///
/// \brief LSettings::loadSettings read the setting file
/// and translate his information to objects
///
void LSettings::loadSettings()
{
    // get last loaded society number/name
    QString soc_num = this->settings->value("Soc").toString();
    this->socId = QString("Soc").append(soc_num);

    // if audio support, get a player
    if (this->settings->value("son", false).toBool()){
        this->player = new QMediaPlayer;
        this->player->setMedia(QUrl::fromLocalFile("son/warning.ogg"));
    }

    // Load version from dbase group
    this->versionT = this->settings->value("dbase/Version").toString();

    // load specific font for society
    QFont newFont = QFont(QGuiApplication::font());
    QString default_font = QString().sprintf("%s,%d",\
                                             newFont.family().toUtf8().constData(),\
                                             newFont.pointSize());
    QVariant fontString = this->settings->value("Soc/Font", default_font);
    newFont = LSettingStyle::parseFont(fontString.toString());
    QGuiApplication::setFont(newFont);

    // Load application style parameters
    settings->beginGroup("Coul");
    QStringList keys = settings->allKeys();
    // if the "Coul" entry does not exist, fill it
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
    keys = settings->allKeys();
    QStringList::iterator key;
    // for all keys in "Coul", store his informations to style object
    for (key = keys.begin(); key != keys.end(); key++) {
        QString value = settings->value(*key).toString();
        value = value.remove(" ");
        this->style_map.insert((*key),
                               new LSettingStyle(value));
    }
    settings->endGroup();
    // save changes
    settings->sync();

}

//////////////////////////////////////////////////////////

LSettingStyle* LSettings::getStyleItem(const QString name) {
    return this->style_map.find(name).value();
}

QList<QString> LSettings::getStyleList() {
    return this->style_map.keys();
}


///
/// \brief LSettingStyle::LSettingStyle
/// \param styleDefinition
///
LSettingStyle::LSettingStyle(QString styleDefinition){
    QStringList values = styleDefinition.split(";", QString::SkipEmptyParts);
    QStringList::iterator val;
    if (! values.isEmpty()){
        for (val = values.begin(); val != values.end(); ++val) {
            // if backgroud informations given
            if ((*val).startsWith("Background")){
                this->background = QColor((*val).section("&", 1, 1).replace('H', '#'));
            }
            // or Font informations
            else if ((*val).startsWith("Font")){
                this->font = this->parseFont((*val).section(":", 1, 1));
                this->fontName = this->font.family();
                this->size = this->font.pointSize();
            }
            // or RGBA color info
            else if ((*val).count(',') == 3){
                QStringList table = (*val).split(",");
                this->background = QColor(table[0].toInt(),table[1].toInt(),
                        table[2].toInt(),table[3].toInt());
            }
        }
    }
}


///
/// \brief LSettingStyle::parseFont
/// \param fontString
/// \return
///
QFont LSettingStyle::parseFont(QString fontString){
    // get current application font
    QFont font = QFont(QGuiApplication::font());
    int pointSize = font.pointSize();

    QStringList font_def = fontString.split(',');
    // get font family
    if (font_def.size() > 0 && !QString(font_def[0]).isEmpty())
        font.setFamily(font_def[0]);
    // get size info
    if (font_def.size() > 1 && !QString(font_def[1]).isEmpty()){
        // adapt pointSize if relative to current size
        if(font_def[1].startsWith('+') || font_def[1].startsWith('-')){
            pointSize += font_def[1].toInt();
        } else {
            pointSize = font_def[1].toInt();
        }
    }
    font.setPointSize(pointSize);
    return font;
}
