import QtQuick 2.4
import QtQuick.Window 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQml.Models 2.2
import Qt.labs.settings 1.0

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
    title: qsTr("Table des paramètres")

    GridLayout {
        id: layout
        columns: 4
        anchors.margins: 20
        anchors.fill: parent

        flow: GridLayout.TopToBottom

        Label {
            Layout.row: 0
            Layout.column: 0
            Layout.fillWidth: true
            Layout.columnSpan: 4
            Layout.maximumWidth: 107 * facteur_taille
            Layout.maximumHeight: 4 * facteur_taille

            horizontalAlignment: TextInput.AlignHCenter
            verticalAlignment: "AlignVCenter"
            text: qsTr("Table des paramètres")
        }

        // First column definition
        Label {
            Layout.row: 1
            Layout.column: 0
            Layout.fillHeight: false
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Date cloture de l'exercice en cours")
        }
        TextField {
            id: datec

            Layout.row: 1
            Layout.column: 1
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            placeholderText: qsTr("jj.mm.aaaa")
            ToolTip.text: qsTr("Saisir la date sous la forme jj.mm.aaaa")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000

            inputMask: "DD.DD.DDDD"
            horizontalAlignment: TextInput.AlignHCenter
            ToolTip.visible: hovered
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }


        Label {
            Layout.row: 2
            Layout.column: 0
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Date cloture de l'exercice N-1")
        }
        TextField {
            id: date1

            Layout.row: 2
            Layout.column: 1
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            placeholderText: qsTr("jj.mm.aaaa")
            ToolTip.text: qsTr("Saisir la date sous la forme jj.mm.aaaa")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000

            inputMask: "DD.DD.DDDD"
            horizontalAlignment: TextInput.AlignHCenter
            ToolTip.visible: hovered
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }

        Label {
            Layout.row: 3
            Layout.column: 0
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Date cloture de l'exercice N-2")
        }
        TextField {
            id: date2

            Layout.row: 3
            Layout.column: 1
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            placeholderText: qsTr("jj.mm.aaaa")
            ToolTip.text: qsTr("Saisir la date sous la forme jj.mm.aaaa")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000

            inputMask: "DD.DD.DDDD"
            horizontalAlignment: TextInput.AlignHCenter
            ToolTip.visible: hovered
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }

        Label {
            Layout.row: 4
            Layout.column: 0
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Date cloture de l'exercice N-3")
        }
        TextField {
            id: date3

            Layout.row: 4
            Layout.column: 1
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            placeholderText: qsTr("jj.mm.aaaa")
            ToolTip.text: qsTr("Saisir la date sous la forme jj.mm.aaaa")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000

            inputMask: "DD.DD.DDDD"
            horizontalAlignment: TextInput.AlignHCenter
            ToolTip.visible: hovered
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }

        Label {
            Layout.row: 5
            Layout.column: 0
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Date cloture de l'exercice N-4")
        }
        TextField {
            id: date4

            Layout.row: 5
            Layout.column: 1
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            placeholderText: qsTr("jj.mm.aaaa")
            ToolTip.text: qsTr("Saisir la date sous la forme jj.mm.aaaa")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000

            inputMask: "DD.DD.DDDD"
            horizontalAlignment: TextInput.AlignHCenter
            ToolTip.visible: hovered
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }

        Label {
            Layout.row: 6
            Layout.column: 0
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Date cloture de l'exercice N-5")
        }
        TextField {
            id: date5

            Layout.row: 6
            Layout.column: 1
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            placeholderText: qsTr("jj.mm.aaaa")
            ToolTip.text: qsTr("Saisir la date sous la forme jj.mm.aaaa")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000

            inputMask: "DD.DD.DDDD"
            horizontalAlignment: TextInput.AlignHCenter
            ToolTip.visible: hovered
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }


        Label {
            Layout.row: 7
            Layout.column: 0
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Dernière période cloturée")
        }
        TextField {
            id: datepc

            Layout.row: 7
            Layout.column: 1
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            placeholderText: qsTr("jj.mm.aaaa")
            ToolTip.text: qsTr("Saisir la date sous la forme jj.mm.aaaa")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000

            inputMask: "DD.DD.DDDD"
            horizontalAlignment: TextInput.AlignHCenter
            ToolTip.visible: hovered
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }

        Label {
            Layout.row: 8
            Layout.column: 0
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Date traitement du dernier exercice cloturé")
        }
        TextField {
            id: datedec

            Layout.row: 8
            Layout.column: 1
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            placeholderText: qsTr("jj.mm.aaaa")
            ToolTip.text: qsTr("Saisir la date sous la forme jj.mm.aaaa")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000

            inputMask: "DD.DD.DDDD"
            horizontalAlignment: TextInput.AlignHCenter
            ToolTip.visible: hovered
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }

        Label {
            Layout.row: 9
            Layout.column: 0
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Date fin d'exercice du dernier exercice cloturé")
        }
        TextField {
            id: datefedec

            Layout.row: 9
            Layout.column: 1
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            placeholderText: qsTr("jj.mm.aaaa")
            ToolTip.text: qsTr("Saisir la date sous la forme jj.mm.aaaa")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000

            inputMask: "DD.DD.DDDD"
            horizontalAlignment: TextInput.AlignHCenter
            ToolTip.visible: hovered
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }

        Label {
            Layout.row: 10
            Layout.column: 0
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Compte de régul +")
        }
        TextField {
            id: regulplus

            Layout.row: 10
            Layout.column: 1
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            inputMask: "00000000"
            horizontalAlignment: TextInput.AlignHCenter
        }

        Label {
            Layout.row: 11
            Layout.column: 0
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Compte de régul -")
        }
        TextField {
            id: regulmoins

            Layout.row: 11
            Layout.column: 1
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            inputMask: "00000000"
            horizontalAlignment: TextInput.AlignHCenter
        }

        Label {
            Layout.row: 12
            Layout.column: 0
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Journal de report")
        }
        TextField {
            id: jreport

            Layout.row: 12
            Layout.column: 1
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            inputMask: "00"
            horizontalAlignment: TextInput.AlignHCenter
        }

        Label {
            Layout.row: 13
            Layout.column: 0
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Compte de résultat +")
        }
        TextField {
            id: resultplus

            Layout.row: 13
            Layout.column: 1
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            inputMask: "000000"
            horizontalAlignment: TextInput.AlignHCenter
        }

        Label {
            Layout.row: 14
            Layout.column: 0
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Compte de résultat -")
        }
        TextField {
            id: resultmoins

            Layout.row: 14
            Layout.column: 1
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            inputMask: "000000"
            horizontalAlignment: TextInput.AlignHCenter
        }

        Label {
            Layout.row: 15
            Layout.column: 0
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Devise")
        }
        TextField {
            id: devise

            Layout.row: 15
            Layout.column: 1
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            ToolTip.text: qsTr("Longueur sur 8 caractères maximum\nNe pas utiliser de symbole SVP.")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000

            inputMask: "nnnnnnnn"
            horizontalAlignment: TextInput.AlignHCenter
            ToolTip.visible: hovered
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }

        // second column definition
        Label {
            Layout.row: 1
            Layout.column: 2
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Dernier N° client")
        }
        TextField {
            id: dnclient

            Layout.row: 1
            Layout.column: 3
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            inputMask: "00000000"
            horizontalAlignment: TextInput.AlignHCenter
            readOnly: true
        }

        Label {
            Layout.row: 2
            Layout.column: 2
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Dernier N° fournisseur")
        }
        TextField {
            id: dnfournisseur

            Layout.row: 2
            Layout.column: 3
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            inputMask: "00000000"
            horizontalAlignment: TextInput.AlignHCenter
            readOnly: true
        }

        Label {
            Layout.row: 3
            Layout.column: 2
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Dernier N° bon")
        }
        TextField {
            id: dnbon

            Layout.row: 3
            Layout.column: 3
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            inputMask: "000000"
            horizontalAlignment: TextInput.AlignHCenter
            readOnly: true
        }

        Label {
            Layout.row: 4
            Layout.column: 2
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Dernier N° facture")
        }
        TextField {
            id: dnfac

            Layout.row: 4
            Layout.column: 3
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            inputMask: "000000"
            horizontalAlignment: TextInput.AlignHCenter
            readOnly: true
        }

        Label {
            Layout.row: 5
            Layout.column: 2
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Coefficient ventes cessions")
        }
        TextField {
            id: coretro

            Layout.row: 5
            Layout.column: 3
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            inputMask: "000000"
            horizontalAlignment: TextInput.AlignHCenter
        }

        Label {
            Layout.row: 6
            Layout.column: 2
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("N° Journal ventes auto")
        }
        TextField {
            id: jrnal

            Layout.row: 6
            Layout.column: 3
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            ToolTip.text: qsTr("Doit être créé dans la table des journaux.")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000
            inputMask: "00"
            horizontalAlignment: TextInput.AlignHCenter
            ToolTip.visible: hovered
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }

        Label {
            Layout.row: 7
            Layout.column: 2
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("N° Journal caisse")
        }
        TextField {
            id: jrnal2

            Layout.row: 7
            Layout.column: 3
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            ToolTip.text: qsTr("Doit être créé dans la table des journaux.")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000
            inputMask: "00"
            horizontalAlignment: TextInput.AlignHCenter
            ToolTip.visible: hovered
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }

        Label {
            Layout.row: 8
            Layout.column: 2
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Virement interne carte")
        }
        TextField {
            id: viremc

            Layout.row: 8
            Layout.column: 3
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            ToolTip.text: qsTr("Ce compte doit exister dans la table des comptes.\nLes règlements par carte seront ventilés dans ce compte")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000
            inputMask: "00000000"
            horizontalAlignment: TextInput.AlignHCenter
            ToolTip.visible: hovered
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }

        Label {
            Layout.row: 9
            Layout.column: 2
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Virement interne chèques")
        }
        TextField {
            id: viremchq

            Layout.row: 9
            Layout.column: 3
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            ToolTip.text: qsTr("Ce compte doit exister dans la table des comptes.\nLes règlements par carte seront ventilés dans ce compte")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000
            inputMask: "00000000"
            horizontalAlignment: TextInput.AlignHCenter
            ToolTip.visible: hovered
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }

        Label {
            Layout.row: 10
            Layout.column: 2
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Virement interne autres")
        }
        TextField {
            id: virema

            Layout.row: 10
            Layout.column: 3
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            ToolTip.text: qsTr("Ce compte doit exister dans la table des comptes.\nLes règlements par carte seront ventilés dans ce compte")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000
            inputMask: "00000000"
            horizontalAlignment: TextInput.AlignHCenter
            ToolTip.visible: hovered
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }

        Label {
            Layout.row: 11
            Layout.column: 2
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("N° Journal banque")
        }
        TextField {
            id: jrnal3

            Layout.row: 11
            Layout.column: 3
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            ToolTip.text: qsTr("Doit être créé dans la table des journaux.")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000
            inputMask: "00"
            horizontalAlignment: TextInput.AlignHCenter
            ToolTip.visible: hovered
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }

        Label {
            Layout.row: 12
            Layout.column: 2
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Dernière cloture en facturation")
        }
        TextField {
            id: mc

            Layout.row: 12
            Layout.column: 3
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            ToolTip.text: qsTr("Saisir le mois en cours sous la forme mm.aaaa")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000
            inputMask: "00.0000"
            horizontalAlignment: TextInput.AlignHCenter
            ToolTip.visible: hovered
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }

        Label {
            Layout.row: 13
            Layout.column: 2
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("Mois en cours en facturatin")
        }
        TextField {
            id: mc2

            Layout.row: 13
            Layout.column: 3
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            ToolTip.text: qsTr("Saisir le mois en cours sous la forme mm.aaaa")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000
            inputMask: "00.0000"
            horizontalAlignment: TextInput.AlignHCenter
            ToolTip.visible: hovered
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }

        Label {
            Layout.row: 14
            Layout.column: 2
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("N° Journal ventes caisses")
        }
        TextField {
            id: jrnal4

            Layout.row: 14
            Layout.column: 3
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            ToolTip.text: qsTr("Doit être créé dans la table des journaux.")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000
            inputMask: "00"
            horizontalAlignment: TextInput.AlignHCenter
            ToolTip.visible: hovered
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }

        Label {
            Layout.row: 15
            Layout.column: 2
            Layout.maximumWidth: 45 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            text: qsTr("N° Journal achat")
        }
        TextField {
            id: jrnal5

            Layout.row: 15
            Layout.column: 3
            Layout.maximumWidth: 12.2857 * facteur_taille
            Layout.maximumHeight: 3 * facteur_taille
            ToolTip.text: qsTr("Doit être créé dans la table des journaux.")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000
            ToolTip.visible: hovered
            inputMask: "00"
            horizontalAlignment: TextInput.AlignHCenter
            property bool hovered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
                onClicked: parent.focus = true
            }
        }
        CheckBox {
            id: nfacm

            Layout.row: 16
            Layout.column: 0
            //            Layout.columnSpan: 4
            //            Layout.fillHeight: false
            Layout.maximumWidth: 49 * facteur_taille
            Layout.maximumHeight: 2 * facteur_taille

            text: qsTr("N° de facture sous la forme AAMMXXXXXXX")
            ToolTip.text: qsTr("A cocher si vous souhaitez avoir des numéros de facture sous la forme AAMMXXXXXX au lieu de AAAAXXXXXXX")
            ToolTip.delay: 1000
            ToolTip.timeout: 5000
            ToolTip.visible: hovered
            style: CheckBoxStyle {
                indicator: Rectangle {
                    implicitWidth: 16
                    implicitHeight: 16
                    radius: 3
                    border.color: control.activeFocus ? "darkblue" : "gray"
                    border.width: 1
                    Rectangle {
                        visible: control.checked
                        color: "#555"
                        border.color: "#333"
                        radius: 1
                        anchors.margins: 4
                        anchors.fill: parent
                    }
                }
            }
        }
        Item {
            Layout.row: 17
            Layout.column: 0
            Layout.columnSpan: 4
            Layout.fillWidth: true
            implicitHeight: help.height

            Button {
                id: help
                iconName: "khelp.png"
                iconSource: "qrc:/icons/32x32/khelp.png"
                width: 4.3 * facteur_taille
                height: 4.3 * facteur_taille
                anchors.right: save.left
                anchors.margins: 20
                ToolTip {
                    text: qsTr("Doc HTML")
                    delay: 1000
                    timeout: 5000
                    visible: parent.hovered
                }
            }
            Button {
                id: save
                anchors.centerIn: parent
                iconName: "folder_new.png"
                iconSource: "qrc:/icons/22x22/folder_new.png"
                text: qsTr("&Enregistrer")

            }
            Button {
                id: quit

                iconName: "folder_new.png"
                iconSource: "qrc:/icons/22x22/exit.png"
                text: qsTr("&Quitter")

                anchors.left: save.right
                anchors.margins: 20
            }
        }
    }
}
