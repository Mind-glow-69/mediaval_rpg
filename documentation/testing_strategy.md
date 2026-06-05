# Testing strategy and automatic workflow

## Objectif
Permettre d'écrire les tests avant les fonctionnalités et de les exécuter
automatiquement.

## Base existante
- Rails Minitest est déjà en place.
- Les tests système existent via `test/application_system_test_case.rb`.
- Le workflow CI exécute déjà la suite sur push et pull request.

## Commandes à utiliser
```bash
bin/rails test
bin/rails test:system
bin/rails test test/integration
```

## Convention test-first
1. Écrire le test.
2. Le faire échouer.
3. Implémenter la fonctionnalité minimale.
4. Refaire tourner la suite.

## Organisation recommandée
- `test/integration/` pour les flux métier.
- `test/system/` pour les parcours UI.
- `test/models/` pour les règles de domaine.

## Automatisation CI
Le workflow `.github/workflows/ci.yml` doit lancer la suite à chaque push et
pull request.

## Critères d'acceptation
- Les tests sont exécutés automatiquement sur CI.
- Le repo supporte un cycle test-first sans ajout de framework externe.