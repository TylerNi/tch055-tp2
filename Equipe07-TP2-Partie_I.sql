-- =============================================================================
-- TP 2 - partie I : R�ponses 
-- Requ�te sur la base de donn�es de la gestion des vols 
--
-- Auteurs : Tyler Nichols
-- Date : 14 juin 2026
-- Version 1.

-- =============================================================================
--Requ�tes d'insertion :
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'HH24:MI';
-- =============================================================================
 
-- -----------------------------------------------------------------------------
-- Requ�te 1.1
SELECT V.num_vol, V.ville_depart, V.ville_arrivee,
       V.heure_depart, V.heure_arrivee,
       C.nom_cie, C.pays
FROM Vol V
JOIN Compagnie C ON V.cie_code_activite = C.code_activite
WHERE V.ville_depart = 'Montreal'
ORDER BY V.num_vol;

-- -----------------------------------------------------------------------------
-- Requ�te 1.2
SELECT IV.date_vol, IV.heure_depart_reelle, IV.heure_arrivee_reelle,
       IV.num_vol, V.ville_depart, V.ville_arrivee, IV.terminal_depart
FROM Instance_Vol IV
JOIN Vol V ON IV.num_vol = V.num_vol
WHERE V.ville_depart = 'Montreal'
  AND IV.date_vol BETWEEN TO_DATE('03-03-2026','DD-MM-YYYY')
                      AND TO_DATE('06-03-2026','DD-MM-YYYY')
ORDER BY IV.date_vol, IV.heure_depart_reelle;

-- -----------------------------------------------------------------------------
-- Requ�te 1.3
-- NOTE : l'énoncé demande "nom et prénom", mais la table Membre_equipage
-- n'a qu'une colonne "nom" (ex. 'Julie Will') -> on affiche nom.
-- À vérifier : dans les données, AC1212 a des instances en MAI 2026,
-- pas au 15 mars. La requête est écrite telle que demandée.
SELECT VME.num_vol, VME.date_vol,
       M.matricule, M.nom, M.type_membre, VME.poste_occupe
FROM Vol_Membre_equipage VME
JOIN Membre_equipage M ON VME.matricule = M.matricule
WHERE VME.num_vol = 'AC1212'
  AND VME.date_vol = TO_DATE('15-03-2026','DD-MM-YYYY')
ORDER BY M.matricule;


-- -----------------------------------------------------------------------------
-- Requ�te 1.4
SELECT M.matricule, M.nom, M.type_membre,
       VME.num_vol, VME.date_vol, VME.poste_occupe,
       IV.code_aeroport_depart, IV.heure_depart_reelle,
       IV.code_aeroport_arrivee, IV.heure_arrivee_reelle
FROM Membre_equipage M
JOIN Vol_Membre_equipage VME ON M.matricule = VME.matricule
JOIN Instance_Vol IV ON VME.num_vol = IV.num_vol
                    AND VME.date_vol = IV.date_vol
WHERE M.nom = 'Julie Will'
ORDER BY VME.date_vol;


-- -----------------------------------------------------------------------------
-- Requ�te 1.5
-- Retard en minutes = (heure réelle d'arrivée) - (heure supposée d'arrivée).
-- On extrait heures+minutes de chaque horaire pour obtenir un écart signé
-- (négatif = arrivé en avance). Robuste car les 2 champs ont des dates de base différentes.
SELECT IV.num_vol, IV.date_vol,
       V.ville_depart, V.ville_arrivee, IV.nbre_passager,
       V.heure_arrivee        AS heure_arrivee_supposee,
       IV.heure_arrivee_reelle,
       (EXTRACT(HOUR   FROM IV.heure_arrivee_reelle) * 60
      + EXTRACT(MINUTE FROM IV.heure_arrivee_reelle))
     - (EXTRACT(HOUR   FROM V.heure_arrivee) * 60
      + EXTRACT(MINUTE FROM V.heure_arrivee))          AS Retard_minutes
FROM Instance_Vol IV
JOIN Vol V ON IV.num_vol = V.num_vol
WHERE V.ville_arrivee = 'Montreal'
ORDER BY Retard_minutes ASC;

-- -----------------------------------------------------------------------------
-- Requ�te 1.6
SELECT C.nom_cie, V.num_vol, V.ville_depart, V.ville_arrivee,
       IV.date_vol, IV.heure_depart_reelle, IV.heure_arrivee_reelle,
       IV.nbre_passager, A.fabriquant, A.modele
FROM Compagnie C
JOIN Vol V ON C.code_activite = V.cie_code_activite
JOIN Instance_Vol IV ON V.num_vol = IV.num_vol
JOIN Aeronef A ON IV.immatriculation = A.immatriculation
WHERE C.nom_cie = 'AIR CANADA'
  AND IV.date_vol BETWEEN TO_DATE('08-03-2026','DD-MM-YYYY')
                      AND TO_DATE('08-05-2026','DD-MM-YYYY')
ORDER BY IV.date_vol, IV.heure_depart_reelle;



-- -----------------------------------------------------------------------------
-- Requ�te 2.1
SELECT categorie, COUNT(*) AS Nombre_Agents
FROM Membre_equipage
WHERE type_membre = 'cabine'
GROUP BY categorie;

-- -----------------------------------------------------------------------------
-- Requ�te 2.2
SELECT MAX(IV.heure_arrivee_reelle) AS Horaire_Dernier_vol_Toronto
FROM Instance_Vol IV
JOIN Vol V ON IV.num_vol = V.num_vol
WHERE V.ville_arrivee = 'Toronto'
  AND IV.date_vol = TO_DATE('04-03-2026','DD-MM-YYYY');

-- -----------------------------------------------------------------------------
-- Requ�te 2.3
SELECT num_vol,
       COUNT(*)            AS Nbre_Vols,
       SUM(nbre_passager)  AS Total_Passagers
FROM Instance_Vol
GROUP BY num_vol
ORDER BY Total_Passagers;

-- -----------------------------------------------------------------------------
-- Requ�te 2.4
-- LEFT JOIN pour inclure tous les techniciens (même ceux à 0 maintenance).
SELECT T.matricule, T.nom, T.specialite,
       COUNT(I.id_maintenance) AS Nbre_Maintenances
FROM Technicien T
LEFT JOIN Intervention I ON T.matricule = I.matricule
GROUP BY T.matricule, T.nom, T.specialite
ORDER BY T.matricule;

-- -----------------------------------------------------------------------------
-- Requ�te 2.5
SELECT matricule, nom, specialite
FROM Technicien
WHERE matricule NOT IN (SELECT matricule FROM Intervention)
ORDER BY matricule;

-- -----------------------------------------------------------------------------
-- Requete 3.1
SELECT IV.num_vol, IV.date_vol, V.ville_depart, V.ville_arrivee,
       IV.heure_depart_reelle, IV.heure_arrivee_reelle,
       IV.terminal_depart, IV.piste_depart
FROM Instance_Vol IV
JOIN Vol V ON IV.num_vol = V.num_vol
WHERE IV.date_vol = TO_DATE('04-03-2026', 'DD-MM-YYYY')
  AND V.ville_depart = 'Montreal'
  AND IV.heure_depart_reelle = (
      SELECT MIN(IV2.heure_depart_reelle)
      FROM Instance_Vol IV2
      JOIN Vol V2 ON IV2.num_vol = V2.num_vol
      WHERE IV2.date_vol = TO_DATE('04-03-2026', 'DD-MM-YYYY')
        AND V2.ville_depart = 'Montreal'
  );

-- -----------------------------------------------------------------------------
-- Requete 3.2
SELECT M.matricule, M.nom, VME.num_vol, VME.date_vol, VME.poste_occupe
FROM Membre_equipage M
JOIN Vol_Membre_equipage VME ON M.matricule = VME.matricule
WHERE (VME.num_vol, VME.date_vol) IN (
    SELECT VME2.num_vol, VME2.date_vol
    FROM Vol_Membre_equipage VME2
    JOIN Membre_equipage M2 ON VME2.matricule = M2.matricule
    WHERE M2.nom = 'Julie Will'
)
  AND M.nom <> 'Julie Will'
ORDER BY VME.num_vol, VME.date_vol;

-- -----------------------------------------------------------------------------
-- Requete 3.3 a)
CREATE OR REPLACE VIEW V_Vol_Equipage AS
SELECT M.*, VME.poste_occupe, VME.num_vol, VME.date_vol,
       IV.heure_depart_reelle, IV.terminal_depart,
       IV.code_aeroport_depart, IV.code_aeroport_arrivee
FROM Membre_equipage M
JOIN Vol_Membre_equipage VME ON M.matricule = VME.matricule
JOIN Instance_Vol IV ON VME.num_vol = IV.num_vol
                     AND VME.date_vol = IV.date_vol;

SELECT *
FROM V_Vol_Equipage
ORDER BY num_vol, date_vol;

-- Requete 3.3 b)
SELECT num_vol, date_vol, matricule, nom, type_membre, poste_occupe,
       heure_depart_reelle, terminal_depart
FROM V_Vol_Equipage
WHERE num_vol = 'AC1212'
  AND date_vol = TO_DATE('08-05-2026', 'DD-MM-YYYY')
ORDER BY matricule;

-- Requete 3.3 c)
SELECT VVE.num_vol, VVE.date_vol, VVE.heure_depart_reelle,
       VVE.matricule, VVE.nom, VVE.poste_occupe,
       AD.nom_aeroport AS "Aéroport Départ",
       AD.ville AS "Ville Départ",
       AA.nom_aeroport AS "Aéroport Arrivée",
       AA.ville AS "Ville Arrivée"
FROM V_Vol_Equipage VVE
JOIN Aeroport AD ON VVE.code_aeroport_depart = AD.code_aeroport
JOIN Aeroport AA ON VVE.code_aeroport_arrivee = AA.code_aeroport
WHERE VVE.nom = 'Bruce Wane'
ORDER BY VVE.date_vol, VVE.heure_depart_reelle;

-- -----------------------------------------------------------------------------
-- Requete 3.4
SELECT C.*, V.num_vol, V.ville_depart, V.ville_arrivee
FROM Compagnie C
LEFT JOIN Vol V ON C.code_activite = V.cie_code_activite
ORDER BY C.code_activite;

-- -----------------------------------------------------------------------------
-- Requete 3.5
SELECT T.matricule, T.nom, T.specialite,
       COUNT(I.id_maintenance) AS Nbre_Maintenances,
       NVL(SUM(I.nbre_heures), 0) AS Total_Heures
FROM Technicien T
LEFT JOIN Intervention I ON T.matricule = I.matricule
GROUP BY T.matricule, T.nom, T.specialite
ORDER BY T.matricule;

-- -----------------------------------------------------------------------------
-- Requete 3.6 a)
SELECT P.code_piece, P.label, P.prix_unitaire,
       COUNT(MP.id_maintenance) AS Quantite_Totale,
       P.prix_unitaire * COUNT(MP.id_maintenance) AS Prix_Total
FROM Piece P
JOIN Maintenance_Piece MP ON P.code_piece = MP.code_piece
GROUP BY P.code_piece, P.label, P.prix_unitaire
ORDER BY Prix_Total DESC;

-- Requete 3.6 b)
SELECT SUM(P.prix_unitaire) AS Montant_Total_Pieces
FROM Piece P
JOIN Maintenance_Piece MP ON P.code_piece = MP.code_piece;

-- -----------------------------------------------------------------------------
-- Requete 3.7
SELECT T.specialite, COUNT(*) AS Nombre_Techniciens
FROM Technicien T
WHERE T.matricule IN (
    SELECT DISTINCT I.matricule
    FROM Intervention I
)
GROUP BY T.specialite;
