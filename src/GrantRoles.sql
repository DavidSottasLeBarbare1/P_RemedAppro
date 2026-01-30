/*Creating roles and users*/
DROP ROLE IF EXISTS admin;
DROP ROLE IF EXISTS joueur;
DROP ROLE IF EXISTS gestionnaire;
CREATE ROLE 'admin', 'joueur', 'gestionnaire';

/*Creating the “admin” role*/
GRANT ALL PRIVILEGES ON db_space_invaders.* TO 'admin';
GRANT CREATE USER, RELOAD, DROP ON *.* TO 'admin' WITH GRANT OPTION;

/*Creating the “joueur” role*/
GRANT SELECT ON db_space_invaders.t_arme TO 'joueur';
GRANT INSERT, SELECT ON db_space_invaders.t_commande TO 'joueur';
GRANT INSERT, SELECT ON db_space_invaders.contenir TO 'joueur'; 

/*Creating the “gestionnaire” role*/
GRANT SELECT ON db_space_invaders.t_joueur TO 'gestionnaire';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_space_invaders.t_arme TO 'gestionnaire';
GRANT SELECT ON db_space_invaders.t_commande TO 'gestionnaire';
GRANT SELECT ON db_space_invaders.contenir TO 'gestionnaire';

/*Creation of all users*/
DROP USER IF EXISTS 'admin1'@'localhost';
CREATE USER 'admin1'@'localhost' IDENTIFIED BY 'passwordadmin';

DROP USER IF EXISTS 'joueur2'@'localhost';
CREATE USER 'joueur2'@'localhost' IDENTIFIED BY 'passwordjoueur';

DROP USER IF EXISTS 'gestionnaire3'@'localhost';
CREATE USER 'gestionnaire3'@'localhost' IDENTIFIED BY 'passwordgestion';

/*Assignment of roles*/
GRANT 'admin' TO 'admin1'@'localhost';
GRANT 'joueur' TO 'joueur2'@'localhost';
GRANT 'gestionnaire' TO 'gestionnaire3'@'localhost';

/*Activation of default roles*/
SET DEFAULT ROLE ALL TO 'admin1'@'localhost', 'joueur2'@'localhost', 'gestionnaire3'@'localhost';