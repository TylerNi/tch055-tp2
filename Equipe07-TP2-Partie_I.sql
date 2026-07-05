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
