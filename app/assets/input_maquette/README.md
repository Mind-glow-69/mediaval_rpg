# Input Maquette - Navigation Map

Ce dossier contient des maquettes HTML statiques reliées entre elles pour
faciliter la navigation rapide.

## Player pages
- `welcome_page_user.html` -> landing
- `user_quest_panel.html` -> journal de quetes
- `inventory.html` -> personnage + inventaire
- `schedule_user.html` -> calendrier/evenements

## Game Master pages
- `game_master_commande.html` -> dashboard GM
- `quest_panel_commande.html` -> gestion quetes/steps/riddles
- `hystory_panel.html` -> registry systemes/NPC

## Harmonisation styles (futur)
1. Extraire les tokens communs (couleurs, spacing, typo) dans un fichier commun.
2. Definir des classes utilitaires partagees (`.grain-overlay`, `.brutalist-shadow`, etc.).
3. Uniformiser les etats de navigation active/inactive sur toutes les pages.
4. Mapper les composants repetes (topbar/sidebar/cards/buttons) pour reuse.

Suggestion de prochaine etape: creer `shared_maquette.css` dans ce dossier et
remplacer progressivement les styles inline/pages par des tokens communs.