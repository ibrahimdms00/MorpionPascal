#  Morpion (Tic-Tac-Toe) - C# Console

## Note de l'auteur
> **Ce projet est mon tout premier code réalisé en Programmation Orientée Objet (POO).**
>
> Contrairement aux projets de groupe habituels réalisés en IUT, j'ai choisi de mener ce travail **entièrement seul et en autonomie**. L'objectif était de me confronter personnellement à chaque défi technique pour garantir ma pleine maîtrise des concepts.
>
> L'intégralité de la logique de jeu, de l'architecture des classes et de la gestion des références a été **réfléchie et développée sans l'aide d'IA générative**, afin de valider ma compréhension réelle du framework .NET.

---

## Présentation
Un jeu de Morpion classique développé en **C#**. Ce projet marque ma transition personnelle d'une programmation procédurale apprise en Pascal vers une approche orientée objet structurée.

## Le Défi : La transition Pascal vers C#
Ce projet solo m'a permis de migrer ma logique de réflexion vers les piliers de la POO :
* **Autonomie complète** : Gestion individuelle de la conception, du développement et du débuggage.
* **Migration de logique** : Passage des procédures globales (Pascal) aux méthodes de classes et à l'encapsulation.
* **Gestion des Références** : Maîtrise du passage par référence (`ref`) pour la manipulation de l'état de la partie.
* **Architecture Objet** : Mise en place d'un objet pivot **T** (Arbitre/Tour) pour piloter le flux du jeu.

## Fonctionnalités
* **Mode 2 Joueurs** : Alternance fluide et automatique.
* **Logique de Victoire** : Algorithme de détection scanant lignes, colonnes et diagonales.
* **Sécurisation** : Validation des saisies utilisateur et protection des cases déjà occupées.
* **Interface Dynamique** : Rafraîchissement optimisé de la console pour une meilleure expérience utilisateur.

##  Comment jouer ?

1.  Clonez le dépôt :
    ```bash
    git clone [https://github.com/TON_PSEUDO/Morpion-CS.git](https://github.com/TON_PSEUDO/Morpion-CS.git)
    ```
2.  Ouvrez le projet dans **Visual Studio**.
3.  Lancez l'application (`F5`).
4.  Utilisez les chiffres de **1 à 9** pour placer votre pion sur la grille.

##  Structure du Projet
* `Plateau.cs` : Cerveau du jeu (grille, conditions de victoire, affichage).
* `Joueur.cs` : Définition des entités joueurs et logique de placement.
* `Program.cs` : Menu principal et boucle de contrôle.

---
*Projet individuel réalisé avec rigueur pour démontrer ma capacité à apprendre et à construire seul.*
