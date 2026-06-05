# Game Master — routes (MVP)

## Auth & accès
- `GET /gm/login` (page)
- `POST /gm/login`
- `POST /gm/logout`
- `GET /gm/dashboard`

## Quêtes
- `GET /gm/quests` (index)
- `GET /gm/quests/new`
- `POST /gm/quests`
- `GET /gm/quests/:id`
- `GET /gm/quests/:id/edit`
- `PATCH /gm/quests/:id`
- `DELETE /gm/quests/:id`

## Étapes de quête
- `POST /gm/quests/:quest_id/steps`
- `PATCH /gm/quests/:quest_id/steps/:id`
- `DELETE /gm/quests/:quest_id/steps/:id`

## Énigmes (par étape)
- `POST /gm/steps/:step_id/riddles`
- `PATCH /gm/steps/:step_id/riddles/:id`
- `DELETE /gm/steps/:step_id/riddles/:id`

## PNJ (par étape ou global)
- `GET /gm/npcs`
- `GET /gm/npcs/new`
- `POST /gm/npcs`
- `GET /gm/npcs/:id/edit`
- `PATCH /gm/npcs/:id`
- `DELETE /gm/npcs/:id`
- `POST /gm/npcs/:npc_id/moves` (séries de mouvements)
- `PATCH /gm/npcs/:npc_id/moves/:id`
- `DELETE /gm/npcs/:npc_id/moves/:id`

## Équipements & boutique d’inventaire
- `GET /gm/items` (catalogue)
- `GET /gm/items/new`
- `POST /gm/items`
- `GET /gm/items/:id/edit`
- `PATCH /gm/items/:id`
- `DELETE /gm/items/:id`
- `GET /gm/shop`
- `PATCH /gm/shop` (règles, rotations, prix, drops)

## Attributs / XP / récompenses
- `PATCH /gm/quests/:id/rewards` (xp de fin, objets proposés)
- `PATCH /gm/steps/:id/rewards` (xp d’étape)

## Personnalisation UI (images)
- `GET /gm/assets/backgrounds`
- `POST /gm/assets/backgrounds` (upload)
- `DELETE /gm/assets/backgrounds/:id`
- `PATCH /gm/theme` (choix arrière-plan, thème)

## Aperçu joueurs & stats
- `GET /gm/players` (liste)
- `GET /gm/players/:id` (détail stats, inventaire, quête en cours)
- `PATCH /gm/players/:id` (admin: reset, compensation, etc.)
- `GET /gm/analytics` (optionnel)

---

Fichier créé automatiquement depuis la TODO principale.
