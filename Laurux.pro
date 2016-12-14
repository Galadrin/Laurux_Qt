QT += qml quick multimedia

CONFIG += c++11

SOURCES += main.cpp \
    src/model/colormodel.cpp

RESOURCES += qml.qrc

TRANSLATIONS += laurux_fr.ts

OTHER_FILES += \
    qml/Main.qml \
    qml/Parameters.qml \
    qml/Preferences.qml \
    qml/assets/LCheckBoxStyle.qml

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    src/settings.h \
    src/model/colormodel.h

DISTFILES += \
    qml/qmldir \
    qml/Preferences.qml \
    qml/assets/LCheckBoxStyle.qml
