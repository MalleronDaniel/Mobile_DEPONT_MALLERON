# Juste Prix - README

## Contributeurs
- Malleron Daniel
- Depont Samuel

## Description
Le projet "Juste Prix" est un jeu simple et divertissant où les joueurs doivent estimer un prix et recevoir des indications sur la justesse de leur estimation. Ce jeu a été développé par Malleron Daniel et Depont Samuel

Le jeu consiste à deviner le prix. Après chaque estimation, le joueur reçoit des indications s'il est trop haut, trop bas ou s'il a trouvé le prix exact.

## Niveaux de difficulté
Le jeu propose trois niveaux de difficulté :

- Niveau Facile : La fourchette de prix est de 0 à 100 avec 30 essais.
- Niveau Moyen : La fourchette de prix est de 0 à 1000 avec 15 essais.
- Niveau Difficile : La fourchette de prix est de 0 à 5000 avec 10 essais.

## Installation
1. Cloner le dépôt du projet depuis Mobile_DEPONT_MALLERON.
2. Assurez-vous d'avoir le système de gestion de base de données databaseFactoryFfiWeb installé et configuré.
3. Exécutez le Main.dart pour lancer le jeu.

## Utilisation
1. Lancez le jeu en exécutant le fichier principal.
2. Choisissez le niveau de difficulté souhaité.
3. Estimez le prix et soumettez votre estimation.
4. Recevez les indications et ajustez votre estimation en conséquence.
5. Répétez les étapes 3 et 4 jusqu'à ce que vous trouviez le prix exact ou que vous utilisiez tous vos essais.

## Fonctionnalités
- Choix du niveau de difficulté
- Estimation du prix
- Indications sur la justesse de l'estimation
- Nombre d'essais restants
- Possibilité de rejouer
- Affichage du prix exact à la fin du jeu
- Affichage des Scores et Niveau du joueur

# Utilisation de sqflite_common_ffi_web
## Configuration

Pour commencer, vous devez ajouter la dépendance `sqflite_common_ffi_web` à votre projet Flutter. Assurez-vous d'utiliser une version égale ou supérieure à `0.1.0-dev.1`.

```yaml
dependencies:
  sqflite_common_ffi_web: ^0.1.0-dev.1
```

Ensuite, pour configurer les binaires nécessaires à l'implémentation, vous devez exécuter la commande suivante dans votre terminal :

```bash
$ dart run sqflite_common_ffi_web:setup
```

Cette commande va installer les binaires requis dans votre dossier web. Après l'exécution de cette commande, les fichiers suivants seront générés dans votre dossier web :

- `sqlite3.wasm`
- `sqflite_sw.js`

## Remarque

Il est important  de dire que 'sqflite_common_ffi_web' est une version de développement et n'est pas encore prête pour une utilisation en production.