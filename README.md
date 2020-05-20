# Cahier des charges

  ## 1 - Contexte et définition du projet:
    D’après l’Organisation Mondiale de la santé, 39% des adultes âgés de 18 ans et plus étaient en surpoids en 2016 et 13% étaient obèses. C'est pour cela nous choisissons ce projet pour répondre au besoin des gens qui cherchent des régimes et des exercices de sport pour garder leurs santés.

    
  ## 2 - Objectif du projet:
    Nous voulons offrir un meilleur service, pour aider le maximum des personnes d'être en forme et avoir une bonne santé.
    
   ## 4 – Description fonctionnelle des besoins:
   Dans ce projet, l’utilisateur s’identifie et entrer ses informations personnels (son poids, sa hauteur, son âge, s’il a des maladies ou bien des allergies, ...), pour que l’application calcule les calories qu’il doit perdre, et lui donne un régime contient les repas de toute la semaine.
L’utilisateur peut aussi choisi un programme d’entrainement sportif selon ses besoins (ex : il a besoin d’entrainer ses épaules ou bien ses bras). Et aussi selon ses capacités physiques.

    
   ## 5 - Utilisation:
 * Admin de l'appiaction : 
 
   -Gérer les comptes des clients et valider tous les nouvelles postes 
   
   -Vérifier de nouveaux membres 
   
   -Confirmer ou refuser les nouveaux membres 
   
   -Gérer la liste des clients (ajouter / modifier /supprimer /récupérer mot de passe).
   
   -Gérer la liste des Coaches (ajouter / modifier /supprimer /récupérer mot de passe).
   
   -Gérer la liste des Spécialistes (ajouter / modifier /supprimer /récupérer mot de passe).
   
 * Clients :
 
   1) Inscription (remplir un formulaire):
   -Nom 
   -Prénom 
   -Email 
   -Sexe 
   -Âge 
   -Poids
   -Hauteur
   -Maladies
   -Activité sportif (de quel niveau vous pratiquez le sport par semaine ?).
   
   -Objectif (perdre poids ou gagner du poids) ;
   
   -Nourriture préférée.
   
   2) Pour le régime :
   -	Comparer le poids de l’utilisateur avec le poids normal dépendent de sa hauteur et son âge 
   
   o	Si le poids est supérieur du poids normal :Filtrer les régimes qui aide à perdre le poids selon les maladies et nourriture préférée 
   
   o	Si le poids est inférieur du poids normal :Filtrer les régimes qui aide à gagner du poids selon les maladies et nourriture préférée
   
   3) Pour les exercices sportifs :
   -	Les exercices séparés selon le sexe ;
   -	Afficher les exercices selon l’objectif de l’utilisateur et son activité sportif
   

 * les coaches : 
 
   -Le coach doit s’authentifié avec le nom et le mot de passe
   
   -Il propose des exercices sportifs typer selon le niveau de difficulté et le genre
   
   -Donner une consultation au client, si le client est payé.
   
 * les speclialistes :
 
   --	Responsable des conseils de tous ce qui concerne les nourritures 
   
   --	Ajouter, supprimer et modifier au niveau de la base de données dans les tables des maladies et repas 
   
   --Ajouter, supprimer et modifier au niveau de la base de données dans les tables des maladies et repas 
   
   
   ## 7 - les technologies utilisés
   •	Front-end :
     -	Html, Css, JavaScript
     -	 Bootstrap
     -	Angular
     
   •	Back-end :
     -	ASP.NET(.NET Framework)
   
   
   ## 8 - Délais de réalisation:
   Les délais sont estimés vers 30 jours.
   
   ## 9 - USE CASE:
   ![](https://github.com/Zahidi-reda/fitnessApp/blob/master/img/FitnessZoneUseCase.png)
   
   ## 10 - Diagramme de class :
   ![](https://github.com/Zahidi-reda/fitnessApp/blob/master/img/diagramme%20de%20class.PNG)
   
   ## 11 - Diagramme de séquence:
   ![](https://github.com/Zahidi-reda/fitnessApp/blob/master/img/diagramme%20de%20s%C3%A9quence1.PNG)
   ![](https://github.com/Zahidi-reda/fitnessApp/blob/master/img/diagramme%20de%20s%C3%A9quence2.PNG)
   ![](https://github.com/Zahidi-reda/fitnessApp/blob/master/img/diagramme%20de%20s%C3%A9quence3.PNG)

   //////////////////////////////////////////////////////////////////////////////////////////////
   
  # Le projet MyfitBody partie ASP.NET
  Projet ASP.NET utilisant identité et entité Framework.
  
  ## - Les packages installés : 
  Microsoft.AspNet.WebApi.Cors. • Microsoft.AspNet.Identity.Core • EntityFramework • Miscrosoft.Owin.Cors
  
  ## - Conception de Code :
   -Partie RESTAPI fitness qui contient des contrôleurs et des models. 
   
   -Partie DATA sous forme d’une bibliothèque de classe qui contient un ADO lié avec notre base de données 
   
   -Partie LOGIQUE qui contient des traitements hors métiers
   
   ## - Les API à consommer par Postman :
  ![](https://github.com/Zahidi-reda/fitnessApp/blob/master/img/postmane1.PNG)
  ![](https://github.com/Zahidi-reda/fitnessApp/blob/master/img/postmane2.PNG)
  ![](https://github.com/Zahidi-reda/fitnessApp/blob/master/img/postmane3.PNG)
  
  ## - Partie Front End du projet (Angular)
  ![](https://github.com/Zahidi-reda/fitnessApp/blob/master/img/front1.jpg)
  ![](https://github.com/Zahidi-reda/fitnessApp/blob/master/img/front2.jpg)
  ![](https://github.com/Zahidi-reda/fitnessApp/blob/master/img/front4.jpg)
  ![](https://github.com/Zahidi-reda/fitnessApp/blob/master/img/front3.jpg)
  ![](https://github.com/Zahidi-reda/fitnessApp/blob/master/img/5018cf2b-8912-485e-9c0b-0a929abd244c.jpg)
