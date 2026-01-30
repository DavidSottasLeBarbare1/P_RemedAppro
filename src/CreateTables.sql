/*Creating the database*/
DROP DATABASE IF EXISTS db_space_invaders;
CREATE DATABASE db_space_invaders;

/*Using the database*/
USE db_space_invaders;

/*Creation of every tables*/
DROP TABLE IF EXISTS t_joueur;
CREATE TABLE t_joueur(
   joueur_id INT,
   pseudo VARCHAR(50),
   points INT,
   PRIMARY KEY(joueur_id)
);

DROP TABLE IF EXISTS t_commande;
CREATE TABLE t_commande(
   commande_id INT,
   date_commande DATETIME,
   joueur_fk INT NOT NULL,
   PRIMARY KEY(commande_id),
   FOREIGN KEY(joueur_fk) REFERENCES t_joueur(joueur_id)
);

DROP TABLE IF EXISTS t_arme;
CREATE TABLE t_arme(
   arme_id INT,
   description VARCHAR(50),
   prix INT,
   puissance INT,
   cartouches INT,
   nom VARCHAR(50),
   type VARCHAR(50),
   PRIMARY KEY(arme_id)
);

DROP TABLE IF EXISTS posseder;
CREATE TABLE posseder(
   joueur_fk INT,
   arme_fk INT,
   coups_restants INT,
   PRIMARY KEY(joueur_fk, arme_fk),
   FOREIGN KEY(joueur_fk) REFERENCES t_joueur(joueur_id),
   FOREIGN KEY(arme_fk) REFERENCES t_arme(arme_id)
);

DROP TABLE IF EXISTS contenir;
CREATE TABLE contenir(
   commande_fk INT,
   arme_fk INT,
   quantite INT,
   PRIMARY KEY(commande_fk, arme_fk),
   FOREIGN KEY(commande_fk) REFERENCES t_commande(commande_id),
   FOREIGN KEY(arme_fk) REFERENCES t_arme(arme_id)
);
