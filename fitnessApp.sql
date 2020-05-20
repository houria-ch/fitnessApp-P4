/*------------------------------------------------------------
*        Script SQLSERVER 
------------------------------------------------------------*/


/*------------------------------------------------------------
-- Table: role
------------------------------------------------------------*/
CREATE TABLE role(
	idRole    INT  NOT NULL ,
	nomRole   VARCHAR (50) NOT NULL  ,
	CONSTRAINT role_PK PRIMARY KEY (idRole)
);


/*------------------------------------------------------------
-- Table: coach
------------------------------------------------------------*/
CREATE TABLE coach(
	idCoach    INT IDENTITY (1,1) NOT NULL ,
	nom        VARCHAR (50) NOT NULL ,
	prenom     VARCHAR (50) NOT NULL ,
	username   VARCHAR (50) NOT NULL ,
	password   VARCHAR (50) NOT NULL ,
	email      VARCHAR (50) NOT NULL ,
	photo      VARCHAR (100) NOT NULL ,
	bio        VARCHAR (100) NOT NULL  ,
	CONSTRAINT coach_PK PRIMARY KEY (idCoach)
);


/*------------------------------------------------------------
-- Table: clients
------------------------------------------------------------*/
CREATE TABLE clients(
	idClient   INT IDENTITY (1,1) NOT NULL ,
	nom        VARCHAR (50) NOT NULL ,
	prenom     VARCHAR (50) NOT NULL ,
	username   VARCHAR (50) NOT NULL ,
	password   VARCHAR (50) NOT NULL ,
	email      VARCHAR (50) NOT NULL ,
	photo      VARCHAR (100) NOT NULL ,
	date       DATETIME NOT NULL  ,
	CONSTRAINT clients_PK PRIMARY KEY (idClient)
);


/*------------------------------------------------------------
-- Table: specNutrition
------------------------------------------------------------*/
CREATE TABLE specNutrition(
	idSpecN    INT IDENTITY (1,1) NOT NULL ,
	nom        VARCHAR (50) NOT NULL ,
	prenom     VARCHAR (50) NOT NULL ,
	username   VARCHAR (50) NOT NULL ,
	password   VARCHAR (50) NOT NULL ,
	email      VARCHAR (50) NOT NULL ,
	photo      VARCHAR (100) NOT NULL ,
	bio        VARCHAR (100) NOT NULL  ,
	CONSTRAINT specNutrition_PK PRIMARY KEY (idSpecN)
);


/*------------------------------------------------------------
-- Table: gestionnaire
------------------------------------------------------------*/
CREATE TABLE gestionnaire(
	idGestionnaire   INT IDENTITY (1,1) NOT NULL ,
	nom              VARCHAR (50) NOT NULL ,
	prenom           VARCHAR (50) NOT NULL ,
	username         VARCHAR (50) NOT NULL ,
	password         VARCHAR (50) NOT NULL  ,
	CONSTRAINT gestionnaire_PK PRIMARY KEY (idGestionnaire)
);


/*------------------------------------------------------------
-- Table: exercices
------------------------------------------------------------*/
CREATE TABLE exercices(
	idExercice   INT IDENTITY (1,1) NOT NULL ,
	duree        VARCHAR (50) NOT NULL ,
	freqence     INT  NOT NULL ,
	idCoach      INT  NOT NULL  ,
	CONSTRAINT exercices_PK PRIMARY KEY (idExercice)

	,CONSTRAINT exercices_coach_FK FOREIGN KEY (idCoach) REFERENCES coach(idCoach)
);


/*------------------------------------------------------------
-- Table: typeOfExercice
------------------------------------------------------------*/
CREATE TABLE typeOfExercice(
	type          VARCHAR (50) NOT NULL ,
	description   VARCHAR (50) NOT NULL  ,
	CONSTRAINT typeOfExercice_PK PRIMARY KEY (type)
);


/*------------------------------------------------------------
-- Table: typeIngredient
------------------------------------------------------------*/
CREATE TABLE typeIngredient(
	label   VARCHAR (50) NOT NULL  ,
	CONSTRAINT typeIngredient_PK PRIMARY KEY (label)
);


/*------------------------------------------------------------
-- Table: ingredients
------------------------------------------------------------*/
CREATE TABLE ingredients(
	nom        VARCHAR (50) NOT NULL ,
	calories   FLOAT  NOT NULL ,
	label      VARCHAR (50) NOT NULL  ,
	CONSTRAINT ingredients_PK PRIMARY KEY (nom)

	,CONSTRAINT ingredients_typeIngredient_FK FOREIGN KEY (label) REFERENCES typeIngredient(label)
);


/*------------------------------------------------------------
-- Table: typeRepas
------------------------------------------------------------*/
CREATE TABLE typeRepas(
	label   VARCHAR (50) NOT NULL  ,
	CONSTRAINT typeRepas_PK PRIMARY KEY (label)
);


/*------------------------------------------------------------
-- Table: repas
------------------------------------------------------------*/
CREATE TABLE repas(
	label             VARCHAR (50) NOT NULL ,
	description       VARCHAR (100) NOT NULL ,
	photo             VARCHAR (100) NOT NULL ,
	idSpecN           INT  NOT NULL ,
	label_typeRepas   VARCHAR (50) NOT NULL  ,
	CONSTRAINT repas_PK PRIMARY KEY (label)

	,CONSTRAINT repas_specNutrition_FK FOREIGN KEY (idSpecN) REFERENCES specNutrition(idSpecN)
	,CONSTRAINT repas_typeRepas0_FK FOREIGN KEY (label_typeRepas) REFERENCES typeRepas(label)
);


/*------------------------------------------------------------
-- Table: questions
------------------------------------------------------------*/
CREATE TABLE questions(
	label            VARCHAR (50) NOT NULL ,
	idGestionnaire   INT  NOT NULL  ,
	CONSTRAINT questions_PK PRIMARY KEY (label)

	,CONSTRAINT questions_gestionnaire_FK FOREIGN KEY (idGestionnaire) REFERENCES gestionnaire(idGestionnaire)
);


/*------------------------------------------------------------
-- Table: reponses
------------------------------------------------------------*/
CREATE TABLE reponses(
	idReponse   INT IDENTITY (1,1) NOT NULL ,
	reponse     VARCHAR (50) NOT NULL ,
	juste       bit  NOT NULL ,
	label       VARCHAR (50) NOT NULL  ,
	CONSTRAINT reponses_PK PRIMARY KEY (idReponse)

	,CONSTRAINT reponses_questions_FK FOREIGN KEY (label) REFERENCES questions(label)
);


/*------------------------------------------------------------
-- Table: maladies
------------------------------------------------------------*/
CREATE TABLE maladies(
	nomMaladie   VARCHAR (50) NOT NULL ,
	idSpecN      INT  NOT NULL  ,
	CONSTRAINT maladies_PK PRIMARY KEY (nomMaladie)

	,CONSTRAINT maladies_specNutrition_FK FOREIGN KEY (idSpecN) REFERENCES specNutrition(idSpecN)
);


/*------------------------------------------------------------
-- Table: appartient
------------------------------------------------------------*/
CREATE TABLE appartient(
	type         VARCHAR (50) NOT NULL ,
	idExercice   INT  NOT NULL  ,
	CONSTRAINT appartient_PK PRIMARY KEY (type,idExercice)

	,CONSTRAINT appartient_typeOfExercice_FK FOREIGN KEY (type) REFERENCES typeOfExercice(type)
	,CONSTRAINT appartient_exercices0_FK FOREIGN KEY (idExercice) REFERENCES exercices(idExercice)
);


/*------------------------------------------------------------
-- Table: composer
------------------------------------------------------------*/
CREATE TABLE composer(
	nom        VARCHAR (50) NOT NULL ,
	label      VARCHAR (50) NOT NULL ,
	quentite   INT  NOT NULL  ,
	CONSTRAINT composer_PK PRIMARY KEY (nom,label)

	,CONSTRAINT composer_ingredients_FK FOREIGN KEY (nom) REFERENCES ingredients(nom)
	,CONSTRAINT composer_repas0_FK FOREIGN KEY (label) REFERENCES repas(label)
);


/*------------------------------------------------------------
-- Table: consulter
------------------------------------------------------------*/
CREATE TABLE consulter(
	idExercice   INT  NOT NULL ,
	idClient     INT  NOT NULL  ,
	CONSTRAINT consulter_PK PRIMARY KEY (idExercice,idClient)

	,CONSTRAINT consulter_exercices_FK FOREIGN KEY (idExercice) REFERENCES exercices(idExercice)
	,CONSTRAINT consulter_clients0_FK FOREIGN KEY (idClient) REFERENCES clients(idClient)
);


/*------------------------------------------------------------
-- Table: excluser
------------------------------------------------------------*/
CREATE TABLE excluser(
	label        VARCHAR (50) NOT NULL ,
	nomMaladie   VARCHAR (50) NOT NULL  ,
	CONSTRAINT excluser_PK PRIMARY KEY (label,nomMaladie)

	,CONSTRAINT excluser_repas_FK FOREIGN KEY (label) REFERENCES repas(label)
	,CONSTRAINT excluser_maladies0_FK FOREIGN KEY (nomMaladie) REFERENCES maladies(nomMaladie)
);


/*------------------------------------------------------------
-- Table: avoir
------------------------------------------------------------*/
CREATE TABLE avoir(
	idReponse    INT  NOT NULL ,
	nomMaladie   VARCHAR (50) NOT NULL  ,
	CONSTRAINT avoir_PK PRIMARY KEY (idReponse,nomMaladie)

	,CONSTRAINT avoir_reponses_FK FOREIGN KEY (idReponse) REFERENCES reponses(idReponse)
	,CONSTRAINT avoir_maladies0_FK FOREIGN KEY (nomMaladie) REFERENCES maladies(nomMaladie)
);


/*------------------------------------------------------------
-- Table: repondre
------------------------------------------------------------*/
CREATE TABLE repondre(
	idReponse   INT  NOT NULL ,
	idClient    INT  NOT NULL  ,
	CONSTRAINT repondre_PK PRIMARY KEY (idReponse,idClient)

	,CONSTRAINT repondre_reponses_FK FOREIGN KEY (idReponse) REFERENCES reponses(idReponse)
	,CONSTRAINT repondre_clients0_FK FOREIGN KEY (idClient) REFERENCES clients(idClient)
);


/*------------------------------------------------------------
-- Table: avoirRole
------------------------------------------------------------*/
CREATE TABLE avoirRole(
	idRole           INT  NOT NULL ,
	idCoach          INT  NOT NULL ,
	idClient         INT  NOT NULL ,
	idSpecN          INT  NOT NULL ,
	idGestionnaire   INT  NOT NULL  ,
	CONSTRAINT avoirRole_PK PRIMARY KEY (idRole,idCoach,idClient,idSpecN,idGestionnaire)

	,CONSTRAINT avoirRole_role_FK FOREIGN KEY (idRole) REFERENCES role(idRole)
	,CONSTRAINT avoirRole_coach0_FK FOREIGN KEY (idCoach) REFERENCES coach(idCoach)
	,CONSTRAINT avoirRole_clients1_FK FOREIGN KEY (idClient) REFERENCES clients(idClient)
	,CONSTRAINT avoirRole_specNutrition2_FK FOREIGN KEY (idSpecN) REFERENCES specNutrition(idSpecN)
	,CONSTRAINT avoirRole_gestionnaire3_FK FOREIGN KEY (idGestionnaire) REFERENCES gestionnaire(idGestionnaire)
);


/*------------------------------------------------------------
-- Table: filtrerRepas
------------------------------------------------------------*/
CREATE TABLE filtrerRepas(
	label       VARCHAR (50) NOT NULL ,
	idReponse   INT  NOT NULL  ,
	CONSTRAINT filtrerRepas_PK PRIMARY KEY (label,idReponse)

	,CONSTRAINT filtrerRepas_repas_FK FOREIGN KEY (label) REFERENCES repas(label)
	,CONSTRAINT filtrerRepas_reponses0_FK FOREIGN KEY (idReponse) REFERENCES reponses(idReponse)
);


/*------------------------------------------------------------
-- Table: filtrerExercice
------------------------------------------------------------*/
CREATE TABLE filtrerExercice(
	idReponse    INT  NOT NULL ,
	idExercice   INT  NOT NULL  ,
	CONSTRAINT filtrerExercice_PK PRIMARY KEY (idReponse,idExercice)

	,CONSTRAINT filtrerExercice_reponses_FK FOREIGN KEY (idReponse) REFERENCES reponses(idReponse)
	,CONSTRAINT filtrerExercice_exercices0_FK FOREIGN KEY (idExercice) REFERENCES exercices(idExercice)
);



