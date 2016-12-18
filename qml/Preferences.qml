import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2
import "assets"
import "utils/desEncrypt.js" as Crypto

Window {
    id: parameter_window
    visible: true

    property int facteur_taille: 7
    property string society_group: "/Soc" + settings.value("Soc", "01") + "/"
    property bool unlocked: settings.valueInt(society_group + "Admin", 0)?false:true

    width: 115 * facteur_taille
    height: 73 * facteur_taille
    minimumWidth: 111 * facteur_taille
    minimumHeight: 73 * facteur_taille
    title: qsTr("Préférences")
    onWindowStateChanged: {
        if(!unlocked){
            console.log("ask password")
            passwordDialog.title = qsTr("Enter Admin password")
            passwordDialog.visible = true }
    }
    onUnlockedChanged: tabView.enabled = unlocked

    Dialog {
        id: passwordDialog
        property string cipherText: ""
        modality: Qt.WindowModal
        standardButtons: StandardButton.Cancel | StandardButton.Apply
        onButtonClicked: cipherText = Crypto.stringToHex(Crypto.des("Laurux", passwordEntry.text, 1, 0))
        onApply:{
            if(settings.valueInt(society_group + "Admin") === 0) {
                settings.setValue(society_group + "Admin", 1)
                settings.setValue(society_group + "MdpPrefs", cipherText)
                visible = false
            }
            else if(cipherText === settings.value(society_group + "MdpPrefs")) {
                unlocked = true
                visible = false
            }else {
                unlocked = false
            }
        }
        onVisibleChanged: passwordEntry.text = ""

        TextField {
            id: passwordEntry
            placeholderText: qsTr("mot de passe")
            echoMode: TextInput.PasswordEchoOnEdit
        }

    }

    TabView {
        id: tabView
        anchors.fill: parent
        anchors.bottomMargin: 80
        enabled: unlocked

        Tab {
            id: environment_tab
            title: qsTr("Environnement")

            RowLayout {
                anchors.margins: 20
                anchors.fill: parent

                ColumnLayout {
                    CheckBox {
                        id: nfacm

                        Layout.row: 16
                        Layout.column: 0
                        Layout.maximumWidth: 49 * facteur_taille
                        Layout.maximumHeight: 2 * facteur_taille

                        text: qsTr("Gestion de l'administrateur.")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez saisir un mot de passe pour acceder aux préférences, aux paramètres et à la gestion des sociétés.")}
                        style: LCheckBoxStyle {}

                        onCheckedChanged: if (nfacm.checked) {
                                              console.log("set admin to 1")

                                              passwordDialog.title = qsTr("Set Admin password")
                                              passwordDialog.visible = true
                                          } else {
                                              console.log("set admin to 0")
                                              settings.setValue(society_group + "Admin", 0)
                                              settings.setValue(society_group + "MdpPrefs", "")
                                          }

                        checked: settings.valueInt(society_group + "Admin", 0) === 1 ? true : false
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
                                onCheckedChanged: settings.setValue(society_group + "Compta", checked?1:0)
                                checked: settings.valueInt(society_group + "Compta", 0) === 0 ? false : true
                            }
                            RadioButton {
                                text: qsTr("&Facturation seule")
                                exclusiveGroup: environnementGroup
                                onCheckedChanged: settings.setValue(society_group + "Gestion", checked?1:0)
                                checked: settings.valueInt(society_group + "Gestion", 0) === 0 ? false : true
                            }

                            RadioButton {
                                text: qsTr("Compta &et facturation")
                                exclusiveGroup: environnementGroup
                                onCheckedChanged: settings.setValue(society_group + "CptFac", checked?1:0)
                                checked: settings.valueInt(society_group + "CptFac", 1) === 0 ? false : true
                            }
                        }
                    }
                    CheckBox {
                        id: prefix

                        text: qsTr("Nom de base avec préfixe")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez mettre un préfixe devant le nom de la base.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Prefixe", checked?1:0)
                        checked: settings.valueInt(society_group + "Prefixe", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id: lcr

                        text: qsTr("Ges&tion des LCR")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez utiliser les LCR magnétiques.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Lcr", checked?1:0)
                        checked: settings.valueInt(society_group + "Lcr", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id: son

                        text: qsTr("Gestion du son")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez un son pendant les messages d'alerte..")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue("son", checked?1:0)
                        checked: settings.valueInt("son", 0) === 0 ? false : true

                    }
                    RowLayout{
                        CheckBox {
                            id: son2

                            text: qsTr("S&ynthèse vocale")
                            LToolTip{ text: qsTr("A cocher si vous souhaitez activer la synthèse vocale..")}
                            style: LCheckBoxStyle {}
                            onCheckedChanged: settings.setValue("son2", checked?1:0)
                            checked: settings.valueInt("son2", 0) === 0 ? false : true
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
                        onCheckedChanged: settings.setValue("Tips", checked?1:0)
                        checked: settings.valueInt("Tips", 1) === 0 ? false : true
                    }
                    CheckBox {
                        id: majVer

                        text: qsTr("La &mise à jour automatique est activée")
                        LToolTip{ text: qsTr("Si ce bouton est coché alors, en cas de besoin, la mise à jour du logiciel se fera automatiquement.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue("MajVer", checked?1:0)
                        checked: settings.valueInt("MajVer", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id: gcf

                        text: qsTr("Couleurs des &fenêtres Laurux")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez les couleurs des fenêtres définies sous Laurux.\nSinon Laurux prendra les paramètres définis dans QT-config")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Coul_fen", checked?1:0)
                        checked: settings.valueInt(society_group + "Coul_fen", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id: infob

                        text: qsTr("Désactiver les &info-bulles")
                        LToolTip{ text: qsTr("A cocher si vous ne souhaitez pas faire apparaitre les infos-bulles sous la souris.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Infob", checked?1:0)
                        checked: settings.valueInt(society_group + "Infob", 1) === 0 ? false : true
                    }
                    CheckBox {
                        id: tme

                        text: qsTr("Mémoriser la taille de l'écran d'accueil")
                        LToolTip{ text: qsTr("Si l'option est cochée alors la taille de l'écran d'accueil à sa fermeture sera mémorisée")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Tme", checked?1:0)
                        checked: settings.valueInt(society_group + "Tme", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id: slide

                        text: qsTr("Activer le défilement des fonds d'écran")
                        LToolTip{ text: qsTr("Si l'option est cochée alors le fond d'écran changera à chaque lancement de Laurux.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Slide", checked?1:0)
                        checked: settings.valueInt(society_group + "Slide", 0) === 0 ? false : true
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

                        TextField {
                            id: image_path
                            text: settings.value(society_group + "Fecran", "")
                            onTextChanged: settings.setValue(society_group + "Fecran", text)
                        }
                        Button {
                            text: qsTr("C&hoisir")
                            onClicked: fileDialog.visible = true
                        }
                        FileDialog {
                            id: fileDialog
                            modality: Qt.WindowModal
                            title: qsTr("Choix du fond d'écran")
                            selectExisting: true
                            selectMultiple: false
                            selectFolder: false
                            nameFilters: [ "Image files (*.png *.jpg)" ]
                            selectedNameFilter: "Image files (*.png *.jpg)"
                            sidebarVisible: true
                            onAccepted: {
                                console.log("Accepted: " + fileUrls)
                                image_path.text = fileUrl
                            }
                            onRejected: { console.log("Rejected") }
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

            RowLayout {
                anchors.margins: 20
                anchors.fill: parent

                Column {
                    spacing: 5
                    Text {
                        id: factureParamTitle
                        text: qsTr("Paramètres facturation")
                        font.bold: true
                    }
                    CheckBox {
                        id: entete

                        text: qsTr("Impr&ession de l'entête")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez que Laurux imprime votre entête sur les documents.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Entete", checked?1:0)
                        checked: settings.valueInt(society_group + "Entete", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id: conditions

                        text: qsTr("Impression des &reserves")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez que Laurux imprime en bas de document un texte concernant les réserves.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Conditions", checked?1:0)
                        checked: settings.valueInt(society_group + "Conditions", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id: recap

                        text: qsTr("Récapitulatif bas de &facture")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez une totalisation des articles, MO, remises et Eco-taxes.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Recap", checked?1:0)
                        checked: settings.valueInt(society_group + "Recap", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id: impttc

                        text: qsTr("Facture&s en TTC")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez imprimer vos documents en TTC.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Impttc", checked?1:0)
                        checked: settings.valueInt(society_group + "Impttc", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id: facA

                        text: qsTr("&Gestion des factures périodiques")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez gérer la facturation des abonnements.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Faca", checked?1:0)
                        checked: settings.valueInt(society_group + "Faca", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id: coupon

                        text: qsTr("Coupon détachable en bas de facture.")
                        LToolTip{ text: qsTr("Si impression du coupon \"A joindre au réglement\" en bas de facture.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Coupon", checked?1:0)
                        checked: settings.valueInt(society_group + "Coupon", 1) === 0 ? false : true
                    }
                    CheckBox {
                        id: sfht

                        text: qsTr("Saisie des documents clients en TTC")
                        LToolTip{ text: qsTr("Si l'option est activée alors la saisie des produits en facturation se fera en TTC, sinon elle se fera en HT.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Fht", checked?1:0)
                        checked: settings.valueInt(society_group + "Fht", 1) === 0 ? false : true
                    }
                    CheckBox {
                        id: marge

                        text: qsTr("Gestion du message si marge négative.")
                        LToolTip{ text: qsTr("Si l'option est activée alors, en sortant des lignes de détail de la facture, on aura un message d'attention lorsque la marge sera négative.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Marge", checked?1:0)
                        checked: settings.valueInt(society_group + "Marge", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id: qt1

                        text: qsTr("Qté = &1 par défaut pour lecture code barres")
                        LToolTip{ text: qsTr("Si la zone est cochée, la lecture d'un code barre \nen facturation donnera une quantité égale à 1 par \ndéfaut. \nLa validation sera automatique.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Qt1", checked?1:0)
                        checked: settings.valueInt(society_group + "Qt1", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id: cqte

                        text: qsTr("C&umul des quantités pour saisie article")
                        LToolTip{ text: qsTr("Si la zone est cochée, on cumulera les quantités \ndes articles ayant la même référence.\nSinon on aura une ligne différente pour chaque saisie.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Cqte", checked?1:0)
                        checked: settings.valueInt(society_group + "Cqte", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id: poids

                        text: qsTr("Calcul du &poids des commandes et des BL")
                        LToolTip{ text: qsTr("Si la zone est cochée, on affichera le poids total des commandes fournisseurs et des Bl clients.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Poids", checked?1:0)
                        checked: settings.valueInt(society_group + "Poids", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id: rglt

                        text: qsTr("La saisie des règlements est acti&vée")
                        LToolTip{ text: qsTr("Si ce bouton est activé alors les zones de saisie de réglement, en facturation, seront visibles.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Rglt", checked?1:0)
                        checked: settings.valueInt(society_group + "Rglt", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id:ctrlStk

                        text: qsTr("En facturation, contrôle si stock &négatif")
                        LToolTip{ text: qsTr("Si la zone est activée alors on ne pourra pas saisir de produit dont le stock est égal ou inférieur à zéro")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Ctrlstk", checked?1:0)
                        checked: settings.valueInt(society_group + "Ctrlstk", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id:pvConseille

                        text: qsTr("Gestion du PV TTC conseillé")
                        LToolTip{ text: qsTr("Si ce bouton est coché alors on pourra saisir le PV TTC conseillé en fiche produit.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Pvcons", checked?1:0)
                        checked: settings.valueInt(society_group + "Pvcons", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id:impBl

                        text: qsTr("Impression Numéro de BL sur facture")
                        LToolTip{ text: qsTr("Si ce bouton est coché alors le numéro du BL s'imprimera sur la première ligne de la facture")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Impbl", checked?1:0)
                        checked: settings.valueInt(society_group + "Impbl", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id:affaire

                        text: qsTr("Affichage chiffre d'affaire client")
                        LToolTip{ text: qsTr("Si ce bouton est coché alors le programme affichera le chiffre d'affaire du client saisit en facturation")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Affaire", checked?1:0)
                        checked: settings.valueInt(society_group + "Affaire", 0) === 0 ? false : true
                    }
                }
                Column {
                    spacing: 5
                    Text {
                        id: factureParamTitle2
                        text: qsTr("Paramètres facturation")
                        font.bold: true
                    }
                    CheckBox {
                        id: aFour

                        text: qsTr("Activation fournisseur en saisie article")
                        LToolTip{ text: qsTr("Si ce bouton est coché alors le programme gardera visible la zone \"Fournisseur\" lors de la saisie des articles. Sinon il affichera la zone \"Famille\"")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Afour", checked?1:0)
                        checked: settings.valueInt(society_group + "Afour", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id: totString

                        text: qsTr("Total document en lettres")
                        LToolTip{ text: qsTr("Si ce bouton est coché alors les fins de documents clients comporteront une ligne avec le total du document en lettre.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Totstring", checked?1:0)
                        checked: settings.valueInt(society_group + "Totstring", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id: vendeurs

                        text: qsTr("Gestion des vendeurs en facturation")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez activer la gestion des vendeurs en facturation.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Vendeurs", checked?1:0)
                        checked: settings.valueInt(society_group + "Vendeurs", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id: casier

                        text: qsTr("Impression casier sur documents client")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez faire apparaitre le code casier sur les documents client.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Casier", checked?1:0)
                        checked: settings.valueInt(society_group + "Casier", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id: affArt

                        text: qsTr("Masquer les références produits sur les devis")
                        LToolTip{ text: qsTr("A cocher si vous ne souhaitez pas imprimer les réfernces produits à l'impression des devis")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Affart", checked?1:0)
                        checked: settings.valueInt(society_group + "Affart", 0) === 0 ? false : true
                    }
                    Item {
                        id: spacer
                        height: 140
                        width: 200
                    }
                    Text {
                        id: stockParamTitle

                        text: qsTr("Paramètres stock")
                        font.bold: true
                    }
                    CheckBox {
                        id: pxRecpt

                        text: qsTr("Saisie &prix en réception")
                        LToolTip{ text: qsTr("A cocher si vous souhaitez saisir ou modifier le prix des produits lors des réceptions.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "prixRecpt", checked?1:0)
                        checked: settings.valueInt(society_group + "prixRecpt", 0) === 0 ? false : true
                    }
                    CheckBox {
                        id: recptMan

                        text: qsTr("Saisie manuelle en réception automatique")
                        LToolTip{ text: qsTr("Si ce bouton est coché alors les quantités reçues seront proposées à zéro sinon elles seront égales à la quantité commandée.")}
                        style: LCheckBoxStyle {}
                        onCheckedChanged: settings.setValue(society_group + "Rcptman", checked?1:0)
                        checked: settings.valueInt(society_group + "Rcptman", 0) === 0 ? false : true
                    }
                }
            }
        }
        Tab {
            id: gestion_2_tab
            title: qsTr("Gestion 2")
            ColumnLayout {
                anchors.margins: 20
                anchors.fill: parent

                Text {
                    id: reglementTitle
                    text: qsTr("Règlement")
                    font.bold: true
                }
                CheckBox {
                    id: txtF

                    text: qsTr("Texte fixe")
                    LToolTip{ text: qsTr("Si ce bouton est activé alors c'est le libellé ci-dessous qui apparaitra comme libellé de règlement en bas de facture")}
                    style: LCheckBoxStyle {}
                    onCheckedChanged: settings.setValue(society_group + "TxtF", checked?1:0)
                    checked: settings.valueInt(society_group + "TxtF", 0) === 0 ? false : true
                }
                Text {
                    text: qsTr("En achat, travail avec :")
                    font.bold: true
                }
                GroupBox {
                    RowLayout {
                        ExclusiveGroup { id: workWithGroup }
                        RadioButton {
                            text: qsTr("&Coefficient")
                            exclusiveGroup: workWithGroup
                            onCheckedChanged: settings.setValue(society_group + "Cof", checked?1:0)
                            checked: settings.valueInt(society_group + "Cof", 1) === 0 ? false : true
                        }
                        RadioButton {
                            text: qsTr("&TMQ")
                            exclusiveGroup: workWithGroup
                            onCheckedChanged: settings.setValue(society_group + "Tq", checked?1:0)
                            checked: settings.valueInt(society_group + "Tq", 0) === 0 ? false : true
                        }
                    }
                }
                Text {
                    text: qsTr("Chemin des photos des produits")
                    font.bold: true
                }
                RowLayout {

                    TextField {
                        id: photArt
                        text: settings.value(society_group + "Photart", "")
                        onTextChanged: settings.setValue(society_group + "Photart", text)
                    }
                    Button {
                        text: qsTr("C&hoisir")
                        onClicked: fileDialog.visible = true
                    }
                    FileDialog {
                        id: fileDialog
                        modality: Qt.WindowModal
                        title: qsTr("Choix du fond d'écran")
                        selectExisting: true
                        selectMultiple: false
                        selectFolder: false
                        nameFilters: [ "Image files (*.png *.jpg)" ]
                        selectedNameFilter: "Image files (*.png *.jpg)"
                        sidebarVisible: true
                        onAccepted: {
                            console.log("Accepted: " + fileUrls)
                            image_path.text = fileUrl
                        }
                        onRejected: { console.log("Rejected") }
                    }
                }
            }
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
