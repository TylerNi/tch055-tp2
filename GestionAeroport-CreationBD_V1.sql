-- =============================================================================
-- Création des tables de la BD pour la gestion des vols à un aéroport 
--
-- TP - TCH055 - E2026
-- 
-- Auteur el hachemi Alikacem
-- Date : Juin 2026
-- Version 1.
-- =============================================================================

-- Suppression des tables 
-- (Enlever les commentaires sur la suppression après la première création des tables)

DROP TABLE Compagnie CASCADE CONSTRAINTS ;
DROP TABLE Vol CASCADE CONSTRAINTS ;  
DROP TABLE Aeronef CASCADE CONSTRAINTS ; 
DROP TABLE Instance_Vol CASCADE CONSTRAINTS ; 
DROP TABLE Membre_equipage CASCADE CONSTRAINTS ; 
DROP TABLE Technicien  CASCADE CONSTRAINTS ; 
DROP TABLE Vol_Membre_equipage CASCADE CONSTRAINTS ; 
DROP TABLE Maintenance CASCADE CONSTRAINTS ; 
DROP TABLE Piece CASCADE CONSTRAINTS ; 
DROP TABLE Intervention CASCADE CONSTRAINTS ; 
DROP TABLE Maintenance_Piece CASCADE CONSTRAINTS ; 
DROP TABLE Facture CASCADE CONSTRAINTS ; 
DROP TABLE Aeroport CASCADE CONSTRAINTS ; 


CREATE TABLE Aeroport (
    code_aeroport CHAR(3)  CHECK (REGEXP_LIKE(code_aeroport, '^[A-Z]{3}$'))  PRIMARY KEY,
    nom_aeroport VARCHAR2(50) NOT NULL,
    ville VARCHAR2(50) NOT NULL 
) ;


CREATE TABLE Compagnie (
    code_activite VARCHAR2(10) PRIMARY KEY , 
    nom_cie VARCHAR2(20) NOT NULL UNIQUE,  
    pays VARCHAR2(20) NOT NULL 
) ;

CREATE TABLE Vol (
    num_vol CHAR(6) CHECK (REGEXP_LIKE(num_vol, '^[A-Z]{2}\d{4}$')) PRIMARY KEY, 
    ville_depart VARCHAR2(30) NOT NULL, 
    ville_arrivee VARCHAR2(30) NOT NULL, 
    heure_depart TIMESTAMP NOT NULL ,
    heure_arrivee TIMESTAMP NOT NULL ,
    cie_code_activite VARCHAR2(10) NOT NULL REFERENCES Compagnie(code_activite),
    
    -- Contrainte sur les villes 
    CONSTRAINT verif_villes CHECK (LOWER(ville_depart) <> LOWER(ville_arrivee))
    
) ;

CREATE TABLE Aeronef (
    immatriculation VARCHAR2(20) PRIMARY KEY, 
    fabriquant VARCHAR2(20) NOT NULL, 
    modele  VARCHAR2(20) NOT NULL, 
    nbre_places NUMBER(3) 
); 

CREATE TABLE Instance_Vol (
    num_vol  CHAR(6) REFERENCES Vol(num_vol), 
    date_vol DATE NOT NULL , 

    heure_depart_reelle  TIMESTAMP NOT NULL ,
    heure_arrivee_reelle TIMESTAMP NOT NULL ,
    nbre_passager        NUMBER(3) NULL,  
    terminal_depart      CHAR(1) DEFAULT 'A',
    piste_depart         NUMBER(1) DEFAULT 1, 
    terminal_arrivee     CHAR(1) DEFAULT 'B',
    piste_arrivee        NUMBER(1) DEFAULT 2,
    
    
    immatriculation VARCHAR2(20) REFERENCES Aeronef(immatriculation),
    code_aeroport_depart  CHAR(3) REFERENCES Aeroport(code_aeroport),
    code_aeroport_arrivee CHAR(3) REFERENCES Aeroport(code_aeroport),
    
    CONSTRAINT ck_aeroports_diff
    CHECK (code_aeroport_depart <> code_aeroport_arrivee), 
    
    PRIMARY KEY(num_vol , date_vol)
    
) ;

CREATE TABLE Membre_equipage (
    matricule NUMBER(5) PRIMARY KEY, 
    nom VARCHAR2(30),
    type_membre VARCHAR2(10) NOT NULL CHECK (type_membre IN ('naviguant','cabine')),
    code_navigation VARCHAR2(10) NULL UNIQUE, 
    categorie VARCHAR2(15) NULL CHECK (categorie IN ('junior', 'intermediaire' , 'senior')) 
) ; 

CREATE TABLE Vol_Membre_equipage (
    num_vol CHAR(6), 
    date_vol DATE, 
    matricule NUMBER(5), 
    poste_occupe VARCHAR2(20) NOT NULL CHECK (poste_occupe IN('pilote' , 'copilote' , 'agent', 'chef de cabine')),
    PRIMARY KEY(num_vol , date_vol , matricule) , 
    FOREIGN KEY(num_vol , date_vol) REFERENCES Instance_vol(num_vol , date_vol),
    FOREIGN KEY(matricule) REFERENCES  Membre_equipage(matricule)
) ;

CREATE TABLE Technicien (
    matricule NUMBER(5) PRIMARY KEY, 
    nom VARCHAR2(30) NOT NULL, 
    specialite VARCHAR2(20) NULL 
) ; 

CREATE TABLE Maintenance(
   id_maintenance NUMBER(5) PRIMARY KEY, 
   date_maintenance date NOT NULL, 
   immatriculation VARCHAR2(20) REFERENCES Aeronef(immatriculation)
) ;

CREATE TABLE Intervention (
     matricule NUMBER(5) REFERENCES Technicien(Matricule) , 
     id_maintenance NUMBER(5) REFERENCES Maintenance(id_maintenance),
     nbre_heures NUMBER(3), 
     PRIMARY KEY(matricule , id_maintenance) 
);

CREATE TABLE Piece (
   code_piece  NUMBER(5) PRIMARY KEY, 
   label VARCHAR2(20) NOT NULL, 
   prix_unitaire NUMBER(6,2) NOT NULL 
) ;

CREATE TABLE Maintenance_Piece (
   id_maintenance NUMBER(5) REFERENCES Maintenance(id_maintenance),
   code_piece  NUMBER(5) REFERENCES Piece(code_piece),
   PRIMARY KEY(id_maintenance ,code_piece ) 
) ;

CREATE TABLE Facture  (
   num_facture NUMBER(5) PRIMARY KEY, 
   date_facturation DATE NOT NULL, 
   total_maindoeuvre NUMBER(8,2) NOT NULL, 
   total_piece       NUMBER(8,2) NOT NULL, 
   taxes             NUMBER(8,2) NOT NULL, 
   id_maintenance NUMBER(5) REFERENCES Maintenance(id_maintenance)
) ;

