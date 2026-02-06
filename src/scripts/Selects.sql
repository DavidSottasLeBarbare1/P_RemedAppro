/*Select 1 */
SELECT * FROM t_joueur 
ORDER BY points DESC 
LIMIT 5;

/*Select 2 */
SELECT MAX(prix) AS PrixMaximum, MIN(prix) AS PrixMinimum, AVG(prix) AS PrixMoyen
FROM t_arme;

/*Select 3 */
SELECT joueur_fk AS IdJoueur, COUNT(*) AS NombreCommandes
FROM t_commande
GROUP BY IdJoueur
ORDER BY NombreCommandes DESC;

/*Select 4 */
SELECT joueur_fk AS IdJoueur, COUNT(*) AS NombreCommandes
FROM t_commande
GROUP BY IdJoueur
HAVING NombreCommandes > 2;

/*Select 5 */
SELECT j.pseudo, a.nom
FROM t_commande c
JOIN t_joueur j ON c.joueur_fk = j.joueur_id
JOIN contenir co ON c.commande_id = co.commande_fk
JOIN t_arme a ON co.arme_fk = a.arme_id;

/*Select 6 */
SELECT j.joueur_id, SUM(co.quantite * a.prix) AS TotalDepense
FROM t_joueur j
JOIN t_commande c ON j.joueur_id = c.joueur_fk
JOIN contenir co ON c.commande_id = co.commande_fk
JOIN t_arme a ON co.arme_fk = a.arme_id
GROUP BY j.joueur_id
ORDER BY TotalDepense DESC
LIMIT 10;

/*Select 7 */
SELECT j.pseudo, c.commande_id
FROM t_joueur j
LEFT JOIN t_commande c ON j.joueur_id = c.joueur_fk;

/*Select 8 */
SELECT c.commande_id, j.pseudo
FROM t_commande c
LEFT JOIN t_joueur j ON c.joueur_fk = j.joueur_id;

/*Select 9 */
SELECT j.pseudo, IFNULL(SUM(co.quantite), 0) AS TotalArmesAchetees
FROM t_joueur j
LEFT JOIN t_commande c ON j.joueur_id = c.joueur_fk
LEFT JOIN contenir co ON c.commande_id = co.commande_fk
GROUP BY j.joueur_id;

/*Select 10 */
SELECT j.pseudo
FROM t_joueur j
JOIN t_commande c ON j.joueur_id = c.joueur_fk
JOIN contenir co ON c.commande_id = co.commande_fk
GROUP BY j.joueur_id
HAVING COUNT(DISTINCT co.arme_fk) > 3;