import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.1
import "assets"

Window {
    id: parameter_window
    visible: true
    property int facteur_taille: 7
    property string society_group: "/Soc" + settings.value("Soc", "01") + "/"

    width: 115 * facteur_taille
    height: 73 * facteur_taille
    minimumWidth: 111 * facteur_taille
    minimumHeight: 73 * facteur_taille
    title: qsTr("Préférences")

    TabView {
        anchors.fill: parent

        Tab {
            id: environment_tab
            title: qsTr("Environnement")

            RowLayout {
                ColumnLayout {
                    anchors.margins: 20
                    anchors.fill: parent

                    CheckBox {
                        id: nfacm

                        Layout.row: 16
                        Layout.column: 0
                        Layout.maximumWidth: 49 * facteur_taille
                        Layout.maximumHeight: 2 * facteur_taille

                        text: qsTr("Gestion de l'administrateur.")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez saisir un mot de passe pour acceder aux préférences, aux paramètres et à la gestion des sociétés.")}
                        style: LCheckBoxStyle {}

                        onCheckedChanged: settings.setValue(society_group + "Admin", infob.checked?0:1)
                        checked: settings.valueInt(society_group + "Admin", 0) === 0 ? true : false
                    }
                    Text {
                        id: environnementTitle
                        anchors.bottom: environnementGroupBox.top
                        text: qsTr("Environnement")
                        font.bold: true
                    }
                    GroupBox {
                        id: environnementGroupBox

                        ColumnLayout {
                            ExclusiveGroup { id: environnementGroup }
                            RadioButton {
                                text: qsTr("C&ompta seule")
                                exclusiveGroup: environnementGroup
                                onCheckedChanged: settings.setValue(society_group + "Compta", infob.checked?0:1)
                                checked: settings.valueInt(society_group + "Compta", 0) === 0 ? true : false
                            }
                            RadioButton {
                                text: qsTr("&Facturation seule")
                                exclusiveGroup: environnementGroup
                                onCheckedChanged: settings.setValue(society_group + "Gestion", infob.checked?0:1)
                                checked: settings.valueInt(society_group + "Gestion", 0) === 0 ? true : false
                            }

                            RadioButton {
                                text: qsTr("Compta &et facturation")
                                exclusiveGroup: environnementGroup
                                onCheckedChanged: settings.setValue(society_group + "CptFac", infob.checked?0:1)
                                checked: settings.valueInt(society_group + "CptFac", 1) === 0 ? true : false
                            }
                        }
                    }
                    CheckBox {
                        id: prefix

                        text: qsTr("Nom de base avec préfixe")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez mettre un préfixe devant le nom de la base.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Prefixe", infob.checked?0:1)
                        checked: settings.valueInt(society_group + "Prefixe", 0) === 0 ? true : false
                    }
                    CheckBox {
                        id: lcr

                        text: qsTr("Ges&tion des LCR")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez utiliser les LCR magnétiques.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Lcr", infob.checked?0:1)
                        checked: settings.valueInt(society_group + "Lcr", 0) === 0 ? true : false
                    }
                    CheckBox {
                        id: son

                        text: qsTr("Gestion du son")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez un son pendant les messages d'alerte..")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue("son", infob.checked?0:1)
                        checked: settings.valueInt("son", 0) === 0 ? true : false

                    }
                    RowLayout{
                        CheckBox {
                            id: son2

                            text: qsTr("S&ynthèse vocale")
                            LToolTip{ text: qsTr("A cocher si vous souhaitez activer la synthèse vocale..")}
                            style: LCheckBoxStyle {}
                            onCheckedChanged: settings.setValue("son2", infob.checked?0:1)
                            checked: settings.valueInt("son2", 0) === 0 ? true : false
                        }
                        Button {
                            id: test_synthese
                            text: qsTr("Tester la synthèse")
                            LToolTip{text: "Tester la synthèse"}
                        }
                    }
                    CheckBox {
                        id: tip

                        text: qsTr("&Affichage des astuces")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez l'écran des astuces du jour au démarrage de Laurux")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue("Tips", infob.checked?0:1)
                        checked: settings.valueInt("Tips", 1) === 0 ? true : false
                    }
                    CheckBox {
                        id: majVer

                        text: qsTr("La &mise à jour automatique est activée")
                        LToolTip{ text: qsTr("Si ce bouton est coché alors, en cas de besoin, la mise à jour du logiciel se fera automatiquement.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue("MajVer", infob.checked?0:1)
                        checked: settings.valueInt("MajVer", 0) === 0 ? true : false
                    }
                    CheckBox {
                        id: gcf

                        text: qsTr("Couleurs des &fenêtres Laurux")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez les couleurs des fenêtres définies sous Laurux.\nSinon Laurux prendra les paramètres définis dans QT-config")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Coul_fen", infob.checked?0:1)
                        checked: settings.valueInt(society_group + "Coul_fen", 0) === 0 ? true : false
                    }
                    CheckBox {
                        id: infob

                        text: qsTr("Désactiver les &info-bulles")
                        LToolTip{ text: qsTr("A cocher si vous ne souhaitez pas faire apparaitre les infos-bulles sous la souris.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Infob", infob.checked?0:1)
                        checked: settings.valueInt(society_group + "Infob", 1) === 0 ? true : false
                    }
                    CheckBox {
                        id: tme

                        text: qsTr("Mémoriser la taille de l'écran d'accueil")
                        LToolTip{ text: qsTr("Si l'option est cochée alors la taille de l'écran d'accueil à sa fermeture sera mémorisée")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Tme", infob.checked?0:1)
                        checked: settings.valueInt(society_group + "Tme", 0) === 0 ? true : false
                    }
                    CheckBox {
                        id: slide

                        text: qsTr("Activer le défilement des fonds d'écran")
                        LToolTip{ text: qsTr("Si l'option est cochée alors le fond d'écran changera à chaque lancement de Laurux.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Slide", infob.checked?0:1)
                        checked: settings.valueInt(society_group + "Slide", 0) === 0 ? true : false
                    }
                }
                ColumnLayout {
                    Text {
                        id: backScreenTitle
                        text: qsTr("Fond d'écran")
                        font.bold: true
                    }
                    Label {
                        id: imageselectTitle
                        text: qsTr("Image du fond d'écran")
                    }
                    RowLayout {

                        TextField { id: image_path}
                        Button {
                            text: qsTr("C&hoisir")
                        }
                    }
                    Text {
                        id: policeTitle
                        text: qsTr("Police de Laurux")
                        font.bold: true
                    }
                    Button {
                        text: qsTr("Changer la police")
                        onClicked: fontDialog.visible = true
                    }
                    FontDialog {
                        id: fontDialog
                        title: qsTr("Choisir la police")
                        modality:Qt.WindowModal

                        font: Qt.font({ family: "Serif", pointSize: 8, weight: Font.Normal })
                        currentFont: Qt.font({ family: settings.value("fontName", "Serif"), pointSize: settings.valueInt("fontSize", 8), weight: Font.Normal })
                        onCurrentFontChanged: { console.log("CurrentFontChanged: " + currentFont) }
                        onAccepted: {
                            console.log("Accepted: " + font)
                            settings.setValue("fontName", font.family)
                            settings.setValue("fontSize", font.pixelSize)
                        }
                        onRejected: { console.log("Rejected") }
                    }
                }
            }
        }
        Tab {
            id: gestion_1_tab
            title: qsTr("Gestion 1")
        }
        Tab {
            id: gestion_2_tab
            title: qsTr("Gestion 2")
        }
        Tab {
            id: gestion_3_tab
            title: qsTr("Gestion 3")
        }
        Tab {
            id: compta_tab
            title: qsTr("Comptabilité")
        }
        Tab {
            id: boutique_tab
            title: qsTr("Boutique")
        }
        Tab {
            id: reseau_tab
            title: qsTr("Réseau")
        }
        Tab {
            id: pdf_tab
            title: qsTr("PDF")
        }
        Tab {
            id: caisse_tab
            title: qsTr("Caisse")
        }
        Tab {
            id: logos_tab
            title: qsTr("Logos")
        }
    }
}
