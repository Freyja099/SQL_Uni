-- TD4 Ex2
-- Create Tables


-- Client
CREATE TABLE Client(
    cod_cli INT(20) PRIMARY KEY,
    nom_cli VARCHAR(20),
    pre_cli VARCHAR(20),
    adr_cli VARCHAR(20),
    tel_cli VARCHAR(20),
    ville_cli VARCHAR(20),
    age_cli INT NOT NULL
);

-- Commande
CREATE TABLE Commande (
    num_cmd INT(11),
    date_cmd DATE,
    cod_cli INT(11),
    CONSTRAINT pk_cmd PRIMARY KEY (num_cmd),
    CONSTRAINT fk_cmd FOREIGN KEY (cod_cli) REFERENCES Client (cod_cli)
);

-- Article 
CREATE TABLE Article(
    cod_art INT(20) PRIMARY KEY,
    nom_art VARCHAR(20),
    pu FLOAT,
    qte_stock FLOAT
);

-- Ligne_cmd
CREATE TABLE Ligne_cmd (
    num_ligne INT(20),
    cod_art INT(20),
    num_cmd INT(20),
    qte_cmd INT(20),
    PRIMARY KEY (num_ligne , cod_art),
    CONSTRAINT fk_ligne_cmd FOREIGN KEY (cod_art) REFERENCES Article(cod_art),
    CONSTRAINT fk_ligne_cmd FOREIGN KEY (num_cmd) REFERENCES Commande(num_cmd)
);


-- Fournisseur 
CREATE TABLE Fournisseur (
    cod_four INT(20) PRIMARY KEY,
    nom_four VARCHAR(20),
    ville_four VARCHAR(20),
    tel_four VARCHAR(20)
);

-- Livraison
CREATE TABLE Livraison(
    num_liv INT(20) PRIMARY KEY,
    date_liv DATE,
    cod_four INT(20),
    CONSTRAINT fk_liv FOREIGN KEY (cod_four) REFERENCES Fournisseur (cod_four)
);

-- ligne livraison
CREATE TABLE Ligne_liv(
    cod_art INT(11),
    num_liv INT(11),
    qte_liv INT(11),
    CONSTRAINT pk_ligne_liv PRIMARY KEY (cod_art,num_liv),
    CONSTRAINT fk_ligne_liv FOREIGN KEY (cod_art) REFERENCES Article (cod_art),
    CONSTRAINT fk_ligne_liv2 FOREIGN KEY (num_liv) REFERENCES Livraison (num_liv)
);

-- Societe
CREATE TABLE Societe(
    nom_ste VARCHAR(20) PRIMARY KEY,
    te_ste VARCHAR(20),
    fax_ste VARCHAR(20),
    ville_ste VARCHAR(20),
    cod_four INT(20),
    CONSTRAINT fk_ste FOREIGN KEY (cod_four) REFERENCES Fournisseur (cod_four)
);

-- Requetes

-- 1 . Afficher les noms des clients qui commencent par ‘E’ et ayant entre 20 et 26 ans.

SELECT nom_cli FROM Client 
WHERE (nom_cli LIKE 'E%' OR nom_cli LIKE 'e%') AND (age_cli BETWEEN 20 AND 26);

-- 2 . Afficher le client le plus âgé.

SELECT nom_cli, MAX(age_cli)
FROM Client;

-- 3 . Afficher les clients dont l’âge est supérieur à au moins un des clients résidant à rabat.

SELECT * FROM Client 
WHERE age_cli > (SELECT MIN(age_cli) FROM Client WHERE (ville_cli = 'Rabat' OR ville_cli = 'Rabat');

-- 4 . Afficher la liste des clients groupée par ville selon un ordre croissant de villes ;

SELECT * FROM Client ORDER BY ville_cli ASC;

-- 5 . Afficher tous les clients dans une liste triée selon un ordre décroissant de noms ;

SELECT * FROM Client ORDER BY nom_cli DESC;

-- 6 . Afficher le nombre de commandes passé par le client ayant le code =2 ;

SELECT COUNT(*) FROM Commande 
WHERE cod_cli = '2';

-- 7 . Afficher le nombre de commandes passé par chaque client ;

SELECT cod_cli, COUNT(*) AS nbr_commandes
From Commande
GROUP BY cod_cli;

-- 8 . Afficher tous les clients qui ont passé au moins une commande et qui habitent à Tanger.

SELECT * FROM Client, Commande
WHERE (Client.cod_cli = Commande.cod_cli) AND (Client.ville_cli = 'Tanger');

-- 9 . Afficher tous les clients qui ont passé une et une seule commande.

SELECT * FROM Commande
GROUP BY cod_cli
HAVING COUNT(*) = 1 ;

-- 10 . Afficher tous les clients qui ont passé au plus une commande.

SELECT * FROM Commande
GROUP BY cod_cli
HAVING COUNT(*) <= 1 ;

-- 11 . Afficher les clients qui ont commandé le produit 2 ;

SELECT * FROM Client, Commande , ligne_cmd 
WHERE (client.cod_cli = commande.cod_cli) AND (commande.num_cmd = ligne_cmd.num_cmd) AND (ligne_cmd.cod_art = '2');

-- 12 . Afficher le montant total de chaque commande.

SELECT client.nom_cli, client.cod_cli , SUM(Article.pu * ligne_cmd.qte_cmd) AS total_montant 
FROM Client , Article , ligne_cmd , Commande
WHERE (Article.cod_art = ligne_cmd.cod_art) AND
(commande.num_cmd = ligne_cmd.num_cmd) AND
(client.cod_cli = commande.cod_cli)
GROUP BY client.cod_cli;

-- 13 . Afficher les commandes dont le montant total est supérieur à 2000 DH.

SELECT ligne_cmd.num_cmd
FROM  Article , ligne_cmd
WHERE (Article.cod_art = ligne_cmd.cod_art) 
GROUP BY ligne_cmd.num_cmd
HAVING SUM(Article.pu * ligne_cmd.qte_cmd) > 2000;

-- 14 . Afficher le total des commandes pour chaque client.

SELECT Client.nom_cli , Client.pre_cli , Client.cod_cli , SUM(Article.pu * ligne_cmd.qte_cmd) AS Total
FROM Client , Article , ligne_cmd , Commande
WHERE (client.cod_cli = commande.cod_cli) 
AND (commande.num_cmd = ligne_cmd.num_cmd)
AND (article.cod_art = ligne_cmd.cod_art)
GROUP BY Client.cod_cli;

-- 15 . Afficher l’article le plus commandé.

SELECT ligne_cmd.cod_art , SUM(ligne_cmd.qte_cmd) AS Total
FROM Article, Ligne_cmd
WHERE (article.cod_art = ligne_cmd.cod_art)
GROUP BY ligne_cmd.cod_art
ORDER BY Total DESC 
LIMIT 1;