-- * Exercice 1 : 

-- * 1 - Cree table client sans signaler que code_cli est une clé primaire

CREATE TABLE Client (
	code_cli INT ,
    nom VARCHAR (30),
    prenom VARCHAR (30),
    ville VARCHAR(30)
);

-- * 2 - Modifier la table client pour code_cli soit clé primaire

ALTER TABLE Client ADD PRIMARY KEY (code_cli);

-- * 3 - Ajouter le champ adresse a la table client

ALTER TABLE Client ADD adresse VARCHAR(30);

-- * 4 - Modifier la taille de ce champ 

ALTER TABLE Client MODIFY adresse VARCHAR(50);

-- * 5 - Supprimer le champ 

ALTER TABLE Client DROP COLUMN adresse ;

-- * 6 - Cree la table commande en signalant que num_cmd est une cle primaire

CREATE TABLE commande (
    num_cmd INT PRIMARY KEY,
    date_cmd DATE ,
    code_cli INT
);

-- * 7 - Cree table produit en signalant que code_artest une cle primaire

CREATE TABLE Produit (
    code_artest INT PRIMARY KEY ,
    designation VARCHAR(200),
    qte_st INT ,
    pu INT 
);

-- * 8 - Cree la table contenu_commande

CREATE TABLE contenu_commande (
    num_cmd INT ,
    code_artest INT ,
    qte_cmd INT ,

    FOREIGN KEY (num_cmd) REFERENCES commande (num_cmd),
    FOREIGN KEY (code_artest) REFERENCES Produit (code_artest)
);

-- * 9 - Mettre en relation entre les tables

ALTER TABLE commande ADD FOREIGN KEY (code_cli) REFERENCES Client (code_cli); 

-- * 10 - Cree la table facture

CREATE TABLE facture (
    num_fact INT PRIMARY KEY,
    date_fact DATE,
    code_cli INT,
    FOREIGN KEY ( code_cli) REFERENCES Client (code_cli)
);

-- * 11 - Supprimer cette table

DROP TABLE facture;