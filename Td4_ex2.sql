-- * Gestion de stock
-- * Create tables first

CREATE TABLE ligne_cmd
(
    num_ligne INT(20) PRIMARY KEY , 
    cod_art INT(20) PRIMARY KEY ,
    qte_cmd INT(20) ,
    num_cmd INT(20) ,
    FOREIGN KEY (num_cmd) REFERENCES commande(num_cmd)
);

CREATE TABLE commande
(
    num_cmd INT(20) PRIMARY KEY ,
    date_cmd DATE,
    code_cli INT(20) ,
    FOREIGN KEY (code_cli) REFERENCES client(code_cli)
);

CREATE TABLE client
(
    code_cli INT(20) PRIMARY KEY,
    nom_cli VARCHAR(20),
    pre_cli VARCHAR(20),
    adr_cli VARCHAR(20),
    tel_cli VARCHAR(20),
    ville_cli VARCHAR(20)
);

CREATE TABLE article
(
    cod_art INT(20) PRIMARY KEY,
    nom_art VARCHAR(20),
    pu FLOAT ,
    qte_stock FLOAT
);

CREATE TABLE ligne_liv
(
    cod_art INT(11) PRIMARY KEY ,
    qte_liv INT(11),
    num_liv INT(11),
    FOREIGN KEY (num_liv) REFERENCES livraison(num_liv)
);

CREATE TABLE livraison
(
    num_liv INT(20) PRIMARY KEY,
    date_liv DATE,
    cod_four INT(20),
    FOREIGN KEY (cod_four) REFERENCES fournisseur(cod_four)
);

CREATE TABLE fournisseur
(
    cod_four INT(20) PRIMARY KEY ,
    nom_four VARCHAR(20),
    ville_four VARCHAR(20),
    tel_four VARCHAR(20)
);

CREATE TABLE societe
(
    nom_ste VARCHAR(20) PRIMARY KEY,
    tel_ste VARCHAR(20),
    fax_ste VARCHAR(20),
    ville_ste VARCHAR(20),
    cod_four INT(20),
    FOREIGN KEY (cod_four) REFERENCES fournisseur(cod_four)
);

-- ! Verify 
-- ALTER TABLE ligne_cmd ADD COLUMN cod_art INT(20) ;
-- ALTER TABLE ligne_cmd ADD CONSTRAINT FOREIGN KEY (cod_art) REFERENCES article(cod_art);


-- ALTER TABLE ligne_liv DROP PRIMARY KEY;
-- ALTER TABLE ligne_liv ADD CONSTRAINT FOREIGN KEY (cod_art) REFERENCES article(cod_art);


-- ALTER TABLE ligne_cmd DROP qte_cmd ;
-- ALTER TABLE ligne_cmd ADD COLUMN qte_cmd INT(20);

-- * Afficher les noms des clients qui commencent par E et ayant entre 20-26ans

SELECT nom_cli                 -- * Display nom_cli only 
FROM client 
WHERE (nom_cli LIKE '%E' OR nom_cli LIKE '%e') AND (age_cli BETWEEN 20 AND 26);
-- ! age_cli doesn't exist 

-- * Afficher le client le plus âgé 

SELECT nom_cli, MAX(age_cli)
FROM client

-- * Afficher les clients dont l'âge est supérieur à au moins un des clients résidant à Rabat

SELECT nom_cli 
FROM client 
WHERE age_cli > 
(
    SELECT age_cli
    FROM client
    WHERE ville_cli = 'Rabat'
);

-- * Afficher la liste des clients groupée par ville selon un ordre croissant de villes


