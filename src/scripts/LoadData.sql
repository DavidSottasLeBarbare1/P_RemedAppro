/*Changing variables*/
SET FOREIGN_KEY_CHECKS = 0;
SET GLOBAL local_infile = 'ON';

/*Loading every tsv files into the database*/
LOAD DATA LOCAL INFILE '/scripts/t_joueur.tsv'
INTO TABLE t_joueur
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(joueur_id, pseudo, points);

LOAD DATA LOCAL INFILE '/scripts/t_arme.tsv'
INTO TABLE t_arme
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(arme_id, description, prix, puissance, cartouches, nom, type);

LOAD DATA LOCAL INFILE '/scripts/t_commande.tsv'
INTO TABLE t_commande
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(commande_id, date_commande, joueur_fk);

LOAD DATA LOCAL INFILE '/scripts/posseder.tsv'
INTO TABLE posseder
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(joueur_fk, arme_fk, coups_restants);

LOAD DATA LOCAL INFILE '/scripts/contenir.tsv'
INTO TABLE contenir
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(commande_fk, arme_fk, quantite);
