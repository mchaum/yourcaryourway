# Your Car Your Way - PoC pour la fonctionnalité de Chat (Angular + Spring Boot)

Une application de chat en temps réel avec WebSocket, construite avec Angular (front-end) et Java / Spring Boot (back-end).  
Deux rôles disponibles : **Client** et **Support**.

## Fonctionnalités

- Authentification (nom d'utilisateur + rôle)
- Chat en temps réel avec WebSocket 
- Interface adaptée au rôle :
  - **Client** : une seule discussion avec le support
  - **Support** : plusieurs discussions, une par client
- Badge de notification pour les nouveaux messages des clients côté support

## Technologies utilisées

- **Front-end** : Angular
- **Back-end** : Java, Spring Boot

## Lancement du projet

### Back-end (Spring Boot)

mvn spring-boot:run

Back-end accessible à l'adresse :
→ http://localhost:8080

### Front-end (Angular)

- cd front
- npm install
- npm start

Front-end accessible à l'adresse :
→ http://localhost:4200

## Mettre en place la structure de données de toute l’application

Le script pour mettre en place la structure de données de tout l'application se trouve dans le dossier "script".
