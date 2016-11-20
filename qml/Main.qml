import QtQuick 2.4
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id: main_window

    visible: true
    width: 600
    height: 800
    title: "Laurux"


        menuBar: MenuBar {
            id: main_menu_bar

            Menu { title: qsTr("&Paramètres")
                MenuItem { text: qsTr("&Sociétés") }
                MenuItem { text: qsTr("&Paramètres généraux") }
                MenuItem { text: qsTr("P&références") }
                MenuItem { text: qsTr("&Couleurs")
                    iconName: "color"
                }
                MenuItem { text: qsTr("&Maj version")
                    iconName: "replace"
                }
                MenuItem { text: qsTr("&Quitter")
                    iconName: "exit"
                    iconSource: "qrc:/icons/22x22/exit.png"
                    onTriggered: main_window.close()
                }
            }
            Menu { title: qsTr("&Gestion")
                Menu { title: qsTr("&Constantes")
                    MenuItem { text: qsTr("&TVA sur ventes")
                        iconSource: "qrc:/icons/22x22/Tva.png" }
                    MenuItem { text: qsTr("C&omentaires")
                        iconSource: "qrc:/icons/22x22/Libell.png" }
                    MenuItem { text: qsTr("&Familles")
                        iconSource: "qrc:/icons/22x22/Fam.png" }
                    MenuItem { text: qsTr("Taux de main &d'oeuvre")
                        iconSource: "qrc:/icons/Tauxmo.png" }
                    MenuItem { text: qsTr("Texte &bas de facture") }
                    MenuItem { text: qsTr("Texte de \"&Réserve de propriété\"") }
                    MenuItem { text: qsTr("Textes associé a&ux courriels facturation") }
                    MenuItem { text: qsTr("Te&xtes SMS") }
                    MenuItem { text: qsTr("&Civilités") }
                    MenuItem { text: qsTr("T&ypes client") }
                    MenuItem { text: qsTr("&Status client") }
                    MenuItem { text: qsTr("Types &étiquettes") }
                    MenuItem { text: qsTr("Codes &postaux")
                        iconSource: "qrc:/icons/32x32/strategy_section.png" }
                    MenuItem { text: qsTr("&Marques")
                        iconName: "bookmark" }
                    MenuItem { text: qsTr("Ce&ntrales") }
                }
                Menu { title: qsTr("&Tables")
                    MenuItem { text: qsTr("&Client")
                        iconSource: "qrc:/icons/22x22/Client.png" }
                    MenuItem { text: qsTr("&Fournisseur")
                        iconSource: "qrc:/icons/22x22/Fournisseur.png" }
                    MenuItem { text: qsTr("&Articles")
                        iconName: "game" }
                    MenuItem { text: qsTr("&Matériels")
                        iconName: "system" }
                    MenuItem { text: qsTr("Main &d'oeuvre")
                        iconName: "tools" }
                    MenuItem { text: qsTr("&Vendeurs") }
                    MenuItem { text: qsTr("Commerciau&x") }
                    MenuItem { text: qsTr("Remises clients &par famille")
                        iconName: "text-right" }
                    MenuItem { text: qsTr("&Remise par type client")
                        iconName: "unindent" }
                    MenuItem { text: qsTr("&Tarif par client") }
                    MenuItem { text: qsTr("Tarifs par t&ype client") }
                    MenuItem { text: qsTr("Coe&ff de vente par type client") }
                    MenuItem { text: qsTr("Pr&oduits composés")
                        iconName: "network" }
                }
                Menu { title: qsTr("&Facturation")

                    MenuItem { text: qsTr("&Saisie des documents")
                        iconSource: "qrc:/icons/22x22/Saisiefacture.png" }
                    MenuItem { text: qsTr("Saisie &des factures entretien") }
                    MenuItem { text: qsTr("&Facture din de mois")
                        iconName: "properties" }
                    MenuItem { text: qsTr("Factu&ration périodique") }
                    MenuItem { text: qsTr("Re&groupement des BL") }
                    MenuItem { text: qsTr("&Bordereaux des réglements") }
                    MenuItem { text: qsTr("Liste des &traites") }
                    MenuItem { text: qsTr("&Liste des documents en cours") }
                    MenuItem { text: qsTr("&Archives")
                        iconName: "archive" }
                }
                Menu { title: qsTr("&GED")
                    MenuItem { text: qsTr("&Acquisition") }
                    MenuItem { text: qsTr("&Recherche") }
                }
                Menu { title: qsTr("&Promotions")
                    MenuItem { text: qsTr("&Tables des promotions") }
                    MenuItem { text: qsTr("&Articles en promotion") }
                    MenuItem { text: qsTr("&Statistiques promotions") }
                    MenuItem { text: qsTr("&Etiquettes promotion") }
                }
                Menu {  title: qsTr("&Impression des tables")
                    Menu { title: qsTr("&Tarif")
                        MenuItem { text: qsTr("&Interne") }
                        MenuItem { text: qsTr("&Client") }
                        MenuItem { text: qsTr("\"Type client (coeff\"T\")") }
                    }
                    MenuItem { text: qsTr("&Familles") }
                    MenuItem { text: qsTr("&Main d'oeuvre") }
                    MenuItem { text: qsTr("&Clients") }
                    MenuItem { text: qsTr("F&ournisseurs") }
                    MenuItem { text: qsTr("Maté&riels") }
                    Menu { title: qsTr("Eti&quettes")
                        MenuItem { text: qsTr("&Articles") }
                        MenuItem { text: qsTr("&Gondole") }
                        MenuItem { text: qsTr("&Clients") }
                        MenuItem { text: qsTr("Ca&sier") }
                    }
                }
                Menu { title: qsTr("&Stock")

                    MenuItem { text: qsTr("&Commande fournisseur") }
                    MenuItem { text: qsTr("&Réception manuelle") }
                    MenuItem { text: qsTr("Réception &automatique") }
                    MenuItem { text: qsTr("&Modification des réceptions") }
                    MenuItem { text: qsTr("&Validation des réceptions") }
                    MenuItem { text: qsTr("&Impression des produits a commander") }
                    MenuItem { text: qsTr("Ré&gularisation") }
                    MenuItem { text: qsTr("Effacement des mou&vements") }
                    Menu { title: qsTr("&Dépôts")
                        MenuItem { text: qsTr("&Table des dépôts") }
                        MenuItem { text: qsTr("T&ransfert dépôts") }
                        MenuItem { text: qsTr("&Sorties manuelles") }
                        Menu { title: qsTr("&Impressions")
                            MenuItem { text: qsTr("&Impression stock dépôts") }
                            MenuItem { text: qsTr("Impression des &mouvements") }
                        }
                    }

                    MenuItem { text: qsTr("Entrées des produits composés") }
                    Menu { title: qsTr("&Etiquettes")
                        MenuItem { text: qsTr("Etiquettes &articles") }
                        MenuItem { text: qsTr("Etiquettes &gondole") }
                        MenuItem { text: qsTr("Etiquettes &préparées") }
                        MenuItem { text: qsTr("Etiquettes &fitire base tarif") }
                    }

                    Menu { title: qsTr("Inventaire &tournant")
                        MenuItem { text: qsTr("&Génération") }
                        MenuItem { text: qsTr("&Saisies") }
                        MenuItem { text: qsTr("&Impression des écarts") }
                        MenuItem { text: qsTr("Impression des &non saisis") }
                        MenuItem { text: qsTr("Impression &de l'inventaire tournant") }
                        MenuItem { text: qsTr("&Validation de l'inventaire tournant") }
                        MenuItem { text: qsTr("Su&ppression de l'inventaire") }
                    }
                    Menu { title: qsTr("Inventaire de &fin d'exercice")
                        MenuItem { text: qsTr("&Génération") }
                        MenuItem { text: qsTr("&Saisies") }
                        MenuItem { text: qsTr("&Impression des écarts") }
                        MenuItem { text: qsTr("Impression des &non saisis") }
                        MenuItem { text: qsTr("Impression &de l'inventaire") }
                        MenuItem { text: qsTr("&Validation de l'inventaire") }
                        MenuItem { text: qsTr("Su&ppression de l'inventaire") }
                    }
                    Menu { title: qsTr("Im&pressions")
                        MenuItem { text: qsTr("&Commandes fournisseurs") }
                        MenuItem { text: qsTr("&Bons de réception") }
                        MenuItem { text: qsTr("&Régularisations") }
                        MenuItem { text: qsTr("&Entrée des produits composés") }
                        MenuItem { text: qsTr("&Stock") }
                    }
                    MenuItem { text: qsTr("&Suppression articles") }
                    Menu { title: qsTr("Tari&f")
                        Menu { title: qsTr("&Future base tarif")
                            MenuItem { text: qsTr("&Maj future base tarif") }
                            MenuItem { text: qsTr("&Etiquettes future base tarif") }
                        }

                        MenuItem { text: qsTr("Maj &tarifs en %") }
                        MenuItem { text: qsTr("&Maj tarif manuelle") }
                        MenuItem { text: qsTr("Table &des fichiers d'import") }
                    }
                    MenuItem { text: qsTr("&Mise à jour code casier") }
                }
                Menu { title: qsTr("Statisti&ques")
                    MenuItem { text: qsTr("Tableau de bord") }
                    MenuItem { text: qsTr("Statistiques &familles") }
                    MenuItem { text: qsTr("&Chiffre d'affaire clients") }
                    MenuItem { text: qsTr("Chiffre d'affaire &type client") }
                    MenuItem { text: qsTr("CA clients/commerciau&x") }
                    MenuItem { text: qsTr("&CA articles/commerciaux") }
                    MenuItem { text: qsTr("Chiffre d'affaire &produits-MO par client") }
                    MenuItem { text: qsTr("Chiffre d'affaire &totalisé") }
                    MenuItem { text: qsTr("&Hit parade des ventes") }
                    MenuItem { text: qsTr("Qté &articles vendus pour une période") }
                    MenuItem { text: qsTr("Qté &MO vendue pour une période") }
                    MenuItem { text: qsTr("Chiffre &d'affaire fournisseur") }
                    MenuItem { text: qsTr("Re&levé articles par client") }
                    MenuItem { text: qsTr("&Relevé MO par client") }
                    MenuItem { text: qsTr("Récapit&ulatif MO-produit par client") }
                    MenuItem { text: qsTr("Statistique utilisation base Laurux") }
                }
                Menu { title: qsTr("Ep&urations")
                    MenuItem { text: qsTr("Epuration des &factures archivées") }
                    MenuItem { text: qsTr("Epuration des &tickets de caisse") }
                    MenuItem { text: qsTr("Epuration des &BL fournisseurs") }
                    MenuItem { text: qsTr("Epuration des &devis") }
                    MenuItem { text: qsTr("Epuration des &clients divers caisses") }
                }
                Menu { title: qsTr("&Outils")
                    MenuItem { text: qsTr("&Changement famille") }
                    MenuItem { text: qsTr("Chan&gement fournisseur") }
                    MenuItem { text: qsTr("&Recalcul des stocks") }
                    MenuItem { text: qsTr("&Import des clients") }
                    MenuItem { text: qsTr("&Export des clients") }
                    MenuItem { text: qsTr("E&xport des contacts") }
                    MenuItem { text: qsTr("E&xport des articles") }
                    MenuItem { text: qsTr("RA&Z zones articles") }
                    MenuItem { text: qsTr("Import des codes postaux") }
                    MenuItem { text: qsTr("Appel programme") }
                }
                MenuItem { text: qsTr("E-&mailing") }
                Menu { title: qsTr("SMS")
                    MenuItem { text: qsTr("Envoi unique") }
                    MenuItem { text: qsTr("Envoi multiples") }
                }
                Menu { title: qsTr("&Boutique")
                    MenuItem { text: qsTr("&Saisie et envoi des produits") }
                }
                MenuItem { text: qsTr("C&lôture mensuelle")
                    iconName: "remove"
                }
            }
            Menu { title: qsTr("Cai&sse")
                Menu { title: qsTr("&Constantes")
                    MenuItem { text: qsTr("&Fiches caisses") }
                    MenuItem { text: qsTr("Fiches vendeurs(ses)") }
                    MenuItem { text: qsTr("Libellé &bas de ticket") }
                    MenuItem { text: qsTr("&Libellé avoir") }
                    MenuItem { text: qsTr("&Compte client caisse") }
                }
                Menu { title: qsTr("Ca&rte de fidélité")
                    MenuItem { text: qsTr("&table des cartes") }
                    MenuItem { text: qsTr("&Hit parade des cartes") }
                    MenuItem { text: qsTr("&Emailing") }
                }
                Menu { title: qsTr("&Opérations de fin de journée")
                    MenuItem { text: qsTr("Impressions des bordereaux") }
                    MenuItem { text: qsTr("&Moulinage des tickets") }
                }
                Menu { title: qsTr("&Statistiques caisses")
                    MenuItem { text: qsTr("CA journalier") }
                    MenuItem { text: qsTr("Historique tickets") }
                }
                MenuItem { text: qsTr("S&ychronisation des caisses nomades") }
            }
            Menu { title: qsTr("&Comptabilité")
                Menu { title: qsTr("&Constantes")
                    MenuItem { text: qsTr("C&omptes collectifs")
                        iconSource: "qrc:/icons/22x22/Collectifs.png"
                    }
                    MenuItem { text: qsTr("&TVA sur achats")
                        iconSource: "qrc:/icons/22x22/Tvac.png"
                    }
                    MenuItem { text: qsTr("C&omptes collectifs")
                        iconSource: "qrc:/icons/22x22/Collectifs.png"
                    }
                    MenuItem { text: qsTr("&Comptes")
                        iconSource: "qrc:/icons/22x22/Compte.png"
                    }
                    MenuItem { text: qsTr("&Journaux")
                        iconSource: "qrc:/icons/22x22/Journaux.png"
                    }
                    MenuItem { text: qsTr("&Libellés des saisies")
                        iconSource: "qrc:/icons/22x22/Lib.png"
                    }
                    MenuItem { text: qsTr("&Echéances") }
                    MenuItem { text: qsTr("&Masques de saisies") }
                    MenuItem { text: qsTr("&Postes analytiques") }
                }
                Menu { title: qsTr("&Saisies")
                    MenuItem { text: qsTr("Saisies des écritures")
                        iconName: "qrc:/icons/22x22/Achat.png"
                    }
                    MenuItem { text: qsTr("Saisies de la trésorerie")
                        iconName: "qrc:/icons/22x22/Tresor.png"
                    }
                }
                MenuItem { text: qsTr("&Traitement des écarts") }
                Menu { title: qsTr("&Relances")
                    MenuItem { text: qsTr("&Saisie des textes") }
                    MenuItem { text: qsTr("&Préparation des relances") }
                    MenuItem { text: qsTr("&Edition des relances") }
                }
                Menu { title: qsTr("Rele&vés")
                    MenuItem { text: qsTr("De &facture") }
                    MenuItem { text: qsTr("De &compte") }
                }
                MenuItem { text: qsTr("&Echéanciers") }
                Menu { title: qsTr("&Lettrage")
                    MenuItem { text: qsTr("Lettrage &manuel") }
                    MenuItem { text: qsTr("Lettrage &par montant") }
                    MenuItem { text: qsTr("Lettrage des &comptes soldés") }
                }
                Menu { title: qsTr("Rapp. &bancaire")
                    MenuItem { text: qsTr("&Saisie des rapprochements") }
                }
                Menu { title: qsTr("&Impressions")
                    MenuItem { text: qsTr("&Grands Livres") }
                    MenuItem { text: qsTr("&Balances") }
                    MenuItem { text: qsTr("&Journaux") }
                    MenuItem { text: qsTr("Journaux &centralisateurs") }
                    Menu { title: qsTr("&Analytiques")
                        MenuItem { text: qsTr("&Journaux") }
                        MenuItem { text: qsTr("&Comptes") }
                    }
                    MenuItem { text: qsTr("&Récapitulatif TVA") }
                    MenuItem { text: qsTr("Ecritures non &lettrées") }
                    MenuItem { text: qsTr("Ecrit&ures non justifiées") }
                    MenuItem { text: qsTr("&Plan comptable") }
                }
                Menu { title: qsTr("E&xtrait de compte")
                    MenuItem { text: qsTr("&Visualisation") }
                    MenuItem { text: qsTr("&Recherche d'un montant") }
                    MenuItem { text: qsTr("&Visu/modif des ecritures") }
                }
                Menu { title: qsTr("Co&mpte de résultat")
                    MenuItem { text: qsTr("Gestion des &rubriques") }
                    MenuItem { text: qsTr("Gestion des &comptes") }
                    MenuItem { text: qsTr("&Impression") }
                }
                Menu { title: qsTr("Clôture&s")
                    MenuItem { text: qsTr("Clôture de &période") }
                    MenuItem { text: qsTr("Clôture &annuelle") }
                }
                Menu { title: qsTr("&Outils")
                    MenuItem { text: qsTr("&Recalcul des soldes") }
                    MenuItem { text: qsTr("&Vérification des balances") }
                    MenuItem { text: qsTr("Ep&uration des relevés bancaires") }
                    MenuItem { text: qsTr("&Déblocage écritures") }
                    MenuItem { text: qsTr("&Export des journaux") }
                    MenuItem { text: qsTr("E&xport fichier A47") }
                    MenuItem { text: qsTr("&Import du JDV Laurux") }
                    MenuItem { text: qsTr("Import des écritures &Sage") }
                    Menu { title: qsTr("Import &Ciel Expert")
                        Menu { title: qsTr("&Table de correspondance")
                            MenuItem { text: qsTr("Table des &clients et fournisseurs") }
                            MenuItem { text: qsTr("Table des &journaux") }
                        }
                        MenuItem { text: qsTr("&Import des écritures") }
                    }
                    MenuItem { text: qsTr("&Duplication de société") }
                }
            }
            Menu { title: qsTr("&Base")
                MenuItem { text: qsTr("&Sauvegarde") }
                MenuItem { text: qsTr("&Restauration") }
                MenuItem { text: qsTr("Connexion &nouvelle base") }
                MenuItem { text: qsTr("&Envoi base") }
            }
            Menu { title: qsTr("&Agenda")
                MenuItem { text: qsTr("&Agenda") }
            }
            Menu { title: qsTr("&?")
                MenuItem { text: qsTr("&concernant Laurux")
                    iconName: "info" }
                MenuItem { text: qsTr("&Information système")
                    iconName: "computer" }
                MenuItem { text: qsTr("Aide &Html")
                    iconSource: "qrc:/icons/22x22/Quoi.png" }
                MenuItem { text: qsTr("&Astuces")
                    iconSource: "qrc:/icons/48x48/tip.png" }
                MenuItem { text: qsTr("C&onnexion site Laurux")
                    iconName: "network" }
                MenuItem { text: qsTr("&Mon IP") }
            }
        }
}
