# TODO — Migrations et Models pour mediaval_rpg

But : définir les schémas de la base de données et les modèles ActiveRecord nécessaires au jeu.

- [ ] Créer migration et model `User` : email, password_digest, role (player/admin), last_sign_in_at
- [ ] Créer migration et model `Character` : name, level, experience, health, mana, user_id (belongs_to :user)
- [ ] Créer migration et model `Item` : name, item_type, rarity, stats (json), description
- [ ] Créer migration et model `InventoryItem` : character_id, item_id, quantity, equipped (bool)
- [ ] Créer migration et model `Skill` : name, power, cost, cooldown, skill_type
- [ ] Créer migration et model `CharacterSkill` : character_id, skill_id, learned_at, level
- [ ] Créer migration et model `Monster` : name, level, health, drops (json), ai_type
- [ ] Créer migration et model `Location` : name, description, difficulty, linked_locations (json)
- [ ] Créer migration et model `Quest` : title, description, requirements (json), rewards (json), status
- [ ] Créer migration et model `Battle` : attacker_id, defender_id, result, log (text), occurred_at
- [ ] Ajouter index sur les clés étrangères et champs fréquemment recherchés (user_id, character_id, name)
- [ ] Ajouter contraintes/validations aux models (présence, unicité, formats, valeurs numériques)
- [ ] Prévoir tables de liaison si besoin (many-to-many) : characters <-> items, quests <-> characters
- [ ] Écrire seeds de base pour dev (users, quelques characters, items, monsters, locations)
- [ ] Écrire tests unitaires pour validations et associations (RSpec/MinTest selon le projet)
- [ ] Linter et conventions : vérifier noms de colonnes, snake_case, timestamps
- [ ] Plan de migration : créer rollback pour chaque migration et tests de migration

Notes pratiques :
- Préférer des colonnes JSON pour données flexibles (drops, stats, rewards) mais documenter le schéma.
- Utiliser des enum pour les types (item_type, rarity, role, skill_type).
- Prévoir des indexes GIN si recherche JSON fréquente.

Checklist de lancement :
- [ ] bundle install / DB config
- [ ] rails generate migration/model pour chaque item ci‑dessus
- [ ] rails db:migrate && rails db:seed

``` 
