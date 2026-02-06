--Creating an index on the joueur_fk column of the t_command table
CREATE INDEX idx_commande_joueur ON t_commande (joueur_fk);