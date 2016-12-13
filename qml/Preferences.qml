import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "assets"

Window {

    flags: Qt.Dialog
    modality: Qt.WindowModal
    id: parameter_window
    visible: true
    property int facteur_taille: 7

    width: 111 * facteur_taille
    height: 73 * facteur_taille
    minimumWidth: 111 * facteur_taille
    minimumHeight: 73 * facteur_taille
    title: qsTr("Préférences")

    TabView {
        anchors.fill: parent
        //        anchors.bottom: parent.height - Button.height + 10

        Tab {
            id: environment_tab
            title: qsTr("Environnement")

            RowLayout {
                GridLayout {
                    flow: GridLayout.TopToBottom
                    //                rows: 13
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
                    }
                    Text {
                        id: environnementTitle
                        anchors.bottom: environnementGroupBox.top
                        text: qsTr("Environnement")
                        font.bold: true
                    }
                    GroupBox {
                        id: environnementGroupBox
                        title: environnementTitle

                        ColumnLayout {
                            ExclusiveGroup { id: environnementGroup }
                            RadioButton {
                                text: qsTr("C&ompta seule")
                                exclusiveGroup: environnementGroup
                            }
                            RadioButton {
                                text: qsTr("&Facturation seule")
                                exclusiveGroup: environnementGroup
                            }

                            RadioButton {
                                text: qsTr("Compta &et facturation")
                                checked: true
                                exclusiveGroup: environnementGroup
                            }
                        }
                    }
                    CheckBox {
                        id: prefix

                        text: qsTr("Nom de base avec préfixe")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez mettre un préfixe devant le nom de la base.")}
                        style: LCheckBoxStyle {}
                    }
                    CheckBox {
                        id: lcr

                        text: qsTr("Ges&tion des LCR")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez utiliser les LCR magnétiques.")}
                        style: LCheckBoxStyle {}
                    }
                    CheckBox {
                        id: son

                        text: qsTr("Gestion du son")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez un son pendant les messages d'alerte..")}
                        style: LCheckBoxStyle {}
                    }
                    RowLayout{
                        CheckBox {
                            id: son2

                            text: qsTr("S&ynthèse vocale")
                            LToolTip{ text: qsTr("A cocher si vous souhaitez activer la synthèse vocale..")}
                            style: LCheckBoxStyle {}
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
                    }
                    CheckBox {
                        id: majVer

                        text: qsTr("La &mise à jour automatique est activée")
                        LToolTip{ text: qsTr("Si ce bouton est coché alors, en cas de besoin, la mise à jour du logiciel se fera automatiquement.")}
                        style: LCheckBoxStyle {}
                    }
                    CheckBox {
                        id: gcf

                        text: qsTr("Couleurs des &fenêtres Laurux")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez les couleurs des fenêtres définies sous Laurux.\nSinon Laurux prendra les paramètres définis dans QT-config")}
                        style: LCheckBoxStyle {}
                    }
                    CheckBox {
                        id: infob

                        text: qsTr("Désactiver les &info-bulles")
                        LToolTip{ text: qsTr("A cocher si vous ne souhaitez pas faire apparaitre les infos-bulles sous la souris.")}
                        style: LCheckBoxStyle {}
                    }
                    CheckBox {
                        id: tme

                        text: qsTr("Mémoriser la taille de l'écran d'accueil")
                        LToolTip{ text: qsTr("Si l'option est cochée alors la taille de l'écran d'accueil à sa fermeture sera mémorisée")}
                        style: LCheckBoxStyle {}
                    }
                    CheckBox {
                        id: slide

                        text: qsTr("Activer le défilement des fonds d'écran")
                        LToolTip{ text: qsTr("Si l'option est cochée alors le fond d'écran changera à chaque lancement de Laurux.")}
                        style: LCheckBoxStyle {}
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
