#include "colormodel.h"

ColorModel::ColorModel()
    : m_styleNameData(), m_colorData(), m_fontData()
{
}

ColorModel::ColorModel(QObject *parent)
    : QObject(parent), m_styleNameData(), m_colorData(), m_fontData()
{
}

ColorModel::ColorModel(const ColorModel &other)
    : QObject(), m_styleNameData(other.name().toUtf8()), m_colorData(other.background()), m_fontData(other.font())
{

}

ColorModel::ColorModel(const QByteArray &name, const QColor &background, const QFont &font)
    : QObject(), m_styleNameData(name), m_colorData(background), m_fontData(font)
{
}

ColorListModel::ColorListModel(QObject *parent)
    : QAbstractListModel(parent)
{
    // Set names to the role name hash container (QHash<int, QByteArray>)
    // model.name, model.background, model.font_name, model.font_size, model.font
    m_roleNames[StyleName] = "name";
    m_roleNames[ColorBackground] = "background";
    m_roleNames[ColorFontName] = "font_name";
    m_roleNames[ColorFontSize] = "font_size";
    m_roleNames[ColorFont] = "font";
}

ColorListModel::~ColorListModel()
{
}

int ColorListModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_data.count();
}

QVariant ColorListModel::data(const QModelIndex &index, int role) const
{
    int row = index.row();
    if(row < 0 || row >= m_data.count()) {
        return QVariant();
    }
    ColorModel data = m_data.at(row);
    qDebug() << row << role << data.name();
    switch(role) {
    case StyleName:
        // return the style name as string (model.name)
        return data.name();
    case ColorBackground:
        // return the background color (model.background)
        return data.background();
    case ColorFontName:
        // return the font name of the font (model.font_name)
        return data.fontName();
    case ColorFontSize:
        // return the fontsize (model.font_size)
        return data.fontSize();
    case ColorFont:
        // return the font object (model.font)
        return data.font();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> ColorListModel::roleNames() const
{
    return m_roleNames;
}

void ColorListModel::add(const QByteArray styleName, const QColor &backgroundColor,
                         const QFont &font)
{
    ColorModel newElement = ColorModel(styleName, backgroundColor, font);
    newElement.background().setAlpha(255);

    emit beginInsertRows(QModelIndex(), m_data.count(), m_data.count());
    m_data.insert(m_data.count(), newElement);
    m_dataSet.insert(styleName, newElement);
    emit endInsertRows();
    // update our count property
    emit countChanged(m_data.count());
}

void ColorListModel::remove(int index) {
    if(index < 0 || index >= m_data.count()) {
        return;
    }
    emit beginRemoveRows(QModelIndex(), index, index);
    m_dataSet.remove(m_data.at(index).name().toUtf8());
    m_data.removeAt(index);
    emit endRemoveRows();
    // do not forget to update our count property
    emit countChanged(m_data.count());
}

void ColorListModel::remove(QByteArray styleName) {
    if(! m_dataSet.contains(styleName)) {
        return;
    }
    int index = m_data.indexOf(m_dataSet[styleName]);
    remove(index);
}

void ColorListModel::clear() {
    m_data.clear();
    m_dataSet.clear();
}

ColorModel ColorListModel::get(const int& index) const {
    return m_data.at(index);
}

ColorModel ColorListModel::get(const QByteArray &styleName) const {
    return m_dataSet[styleName];
}

QColor ColorListModel::getBackground(int index)
{
    if(index < 0 || index >= m_data.count()) {
        return QColor();
    }
    return m_data.at(index).background();
}
QColor ColorListModel::getBackground(QByteArray styleName)
{
    if(! m_dataSet.contains(styleName)) {
        return QColor();
    }
    return m_dataSet[styleName].background();
}

QFont ColorListModel::getFont(int index)
{
    if(index < 0 || index >= m_data.count()) {
        return QFont();
    }
    return m_data.at(index).font();
}

QFont ColorListModel::getFont(QByteArray styleName)
{
    if(! m_dataSet.contains(styleName)) {
        return QFont();
    }
    return m_dataSet[styleName].font();
}

QString ColorListModel::getFontName(int index)
{
    return getFont(index).family();
}

QString ColorListModel::getFontName(QByteArray styleName)
{
    return getFont(styleName).family();
}

qint8 ColorListModel::getFontSize(int index)
{
    return getFont(index).pointSize();
}

qint8 ColorListModel::getFontSize(QByteArray styleName)
{
    return getFont(styleName).pointSize();
}

