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

/*Select 7 */

/*Select 8 */

/*Select 9 */

/*Select 10 */