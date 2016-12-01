#ifndef COLORMODEL_H
#define COLORMODEL_H

#include <QtCore>
#include <QtGui>


class ColorModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QColor background READ background CONSTANT)
    Q_PROPERTY(QString fontName READ fontName CONSTANT)
    Q_PROPERTY(int fontSize READ fontSize CONSTANT)

public:
    ColorModel();
    ColorModel(QObject *parent);
    ColorModel(const ColorModel &other);
    ColorModel(const QByteArray &name, const QColor &background, const QFont &font);
    ~ColorModel() {}

    // QAbstractItemModel interface
public:
    QString name() const {return QString(m_styleNameData);}

    QColor background() const {return m_colorData;}

    QFont font() const {return m_fontData;}

    QString fontName() const {return m_fontData.family();}

    int fontSize() const {return m_fontData.pixelSize();}

    bool operator==(const ColorModel& a) const
    {
        return (m_styleNameData == a.name());
    }

    ColorModel& operator=(const ColorModel& other) // copy assignment
    {
        if (this != &other) { // self-assignment check expected
            m_styleNameData = other.name().toUtf8();
            m_colorData = other.background();
            m_fontData = other.font();
            /* copy data from other's storage to this storage */
        }
        return *this;
    }

private:
    QByteArray m_styleNameData;
    QColor m_colorData;
    QFont m_fontData;
};

class ColorListModel : public QAbstractListModel
{
    Q_OBJECT

public:

    // Define the role name to be used
    enum roleNames{
        StyleName = Qt::UserRole,
        ColorBackground = Qt::UserRole +1,
        ColorFontName = Qt::UserRole + 2,
        ColorFontSize = Qt::UserRole + 3,
        ColorFont = Qt::UserRole + 4,
    };

    explicit ColorListModel(QObject *parent = 0);
    ~ColorListModel();

    // QAbstractItemModel interface
public:
    virtual int rowCount(const QModelIndex &parent) const override;
    virtual QVariant data(const QModelIndex &index, int role) const override;
    // add an entry from the given informations
    Q_INVOKABLE void add(const QByteArray styleName, const QColor& backgroundColor = QColor(),
                         const QFont& font = QFont());
    // removes an entry from the index
    Q_INVOKABLE void remove(int index);
    Q_INVOKABLE void remove(QByteArray styleName);
    // clear the whole model (e.g. reset)
    Q_INVOKABLE void clear();

    Q_INVOKABLE ColorModel get(const int &index) const;
    Q_INVOKABLE ColorModel get(const QByteArray &styleName) const;
    // gives the size of the model
    Q_PROPERTY(int count READ count NOTIFY countChanged)
    Q_INVOKABLE int count() {return m_data.count();}
    // gets a element at the index
    Q_INVOKABLE QColor getBackground(int index);
    Q_INVOKABLE QColor getBackground(QByteArray styleName);
    Q_INVOKABLE QFont getFont(int index);
    Q_INVOKABLE QFont getFont(QByteArray styleName);
    Q_INVOKABLE QString getFontName(int index);
    Q_INVOKABLE QString getFontName(QByteArray styleName);
    Q_INVOKABLE qint8 getFontSize(int index);
    Q_INVOKABLE qint8 getFontSize(QByteArray styleName);

signals:
    void countChanged(int newCount);

protected:
    // return the roles mapping to be used by QML
    virtual QHash<int, QByteArray> roleNames() const override;

private:
    QList<ColorModel> m_data;
    QMap<QByteArray, ColorModel> m_dataSet;
    QHash<int, QByteArray> m_roleNames;
};


#endif // COLORMODEL_H
