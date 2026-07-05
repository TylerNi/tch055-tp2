-- =============================================================================
-- Insertions pour la BD de gestion des vols à un aéroport 
--
-- Auteurs el hachemi Alikacem
-- Date : Juin 2026
-- Version 1.
-- =============================================================================

INSERT INTO Aeroport VALUES ('TUN','Aéroport international de Tunis-Carthage','Tunis');
INSERT INTO Aeroport VALUES ('ALG','Aéroport international Houari-Boumédiène','Alger');
INSERT INTO Aeroport VALUES ('DKR','Aéroport international Blaise-Diagne', 'Dakar');
INSERT INTO Aeroport VALUES ('YUL','Aéroport international Montréal-Trudeau','Montréal');
INSERT INTO Aeroport VALUES ('JFK','Aéroport international John-F.-Kennedy','New York');
INSERT INTO Aeroport VALUES ('LGA', 'Aéroport LaGuardia','New York');
INSERT INTO Aeroport VALUES ('YOW', 'Aéroport international Macdonald-Cartier d''Ottawa', 'Ottawa');
INSERT INTO Aeroport VALUES ('YYZ', 'Aéroport international Pearson de Toronto','Toronto' );        
INSERT INTO Aeroport VALUES ('HAV', 'Aéroport international José-Martí','La Havane' );        

-- =============================================================================
-- Compagnie
INSERT INTO Compagnie VALUES ('AC3245Y' , 'AIR CANADA' , 'CANADA' ) ; 
INSERT INTO Compagnie VALUES ('AH1234Z' , 'AIR ALGERIE' , 'ALGERIE' ) ; 
INSERT INTO Compagnie VALUES ('TU6556U' , 'TUNIS AIR' , 'TUNISIE' ) ; 
INSERT INTO Compagnie VALUES ('HC5453S' , 'AIR SENEGAL' , 'SENEGAL' ) ; 
INSERT INTO Compagnie VALUES ('TS9898T' , 'AIR TRANSAT' , 'CANADA' ) ; 
INSERT INTO Compagnie VALUES ('LX5326W',  'SWISS', 'Suisse');
INSERT INTO Compagnie VALUES ('RM4289A',  'ROYAL AIR MAROC', 'Maroc');

-- =============================================================================   
-- Aeronef 
INSERT INTO Aeronef VALUES('AB653453','AIRBUS' ,'A220' ,125 ) ; -- pour AC
INSERT INTO Aeronef VALUES('AB653666','AIRBUS' ,'A220-30' , 280 ) ; -- pour AC
INSERT INTO Aeronef VALUES('AB763545','AIRBUS' ,'A330' ,225 ) ; -- Tiuniair
INSERT INTO Aeronef VALUES('BO376352','BOEING' ,'737'  ,250 ) ; -- pour AC 
INSERT INTO Aeronef VALUES('AB983647','AIRBUS' ,'A220' , 240 ) ; -- pour AH
INSERT INTO Aeronef VALUES('AB986667','AIRBUS' ,'A220-30' , 280 ) ; -- pour AH
INSERT INTO Aeronef VALUES('BO877738','BOEING' ,'737'  ,300 ) ;   -- pour AH
INSERT INTO Aeronef VALUES('BO877333','BOEING' ,'737-N'  ,280 ) ; -- Pour Senegal
INSERT INTO Aeronef VALUES('AB534628','AIRBUS' ,'A320'  ,130 ) ; -- Pour NYC
 -- =============================================================================
-- Vol 
INSERT INTO Vol VALUES ('TS1212' , 'Montreal' , 'Ottawa' , to_timestamp('15:40' , 'HH24:MI' ) , 
                       to_timestamp('16:50' , 'HH24:MI' ) , 'TS9898T') ; 

INSERT INTO Vol VALUES ('AC3232' , 'Montreal' , 'Toronto' , to_timestamp('10:15' , 'HH24:MI' ) , 
                       to_timestamp('11:45' , 'HH24:MI' ) , 'AC3245Y' ) ; -- AC

INSERT INTO Vol VALUES ('TS3234' , 'Toronto' , 'New York' , to_timestamp('12:15' , 'HH24:MI' ) , 
                       to_timestamp('14:00' , 'HH24:MI' ) , 'TS9898T') ; -- Air transat 

INSERT INTO Vol VALUES ('AC1212' , 'Montreal' , 'New York' , to_timestamp('14:00' , 'HH24:MI' ) , 
                       to_timestamp('15:30' , 'HH24:MI' ) , 'AC3245Y') ; -- Air canada
-- 
INSERT INTO Vol VALUES ('AH1247' , 'Alger' , 'Montreal' , to_timestamp('09:10' , 'HH24:MI' ) , 
                       to_timestamp('18:50' , 'HH24:MI' ) , 'AH1234Z') ; 
                       
                       
INSERT INTO Vol VALUES ('TU9876' , 'Montreal' , 'Tunis' , to_timestamp('10:15' , 'HH24:MI' ) , 
                       to_timestamp('19:20' , 'HH24:MI' ) , 'TU6556U') ; 

INSERT INTO Vol VALUES ('HC7373' , 'Dakar' , 'Toronto' , to_timestamp('08:30' , 'HH24:MI' ) , 
                       to_timestamp('18:50' , 'HH24:MI' ) , 'HC5453S') ; 
-- VOL ATransat
INSERT INTO Vol VALUES ('TS1234' , 'La Havane' , 'Montreal' , to_timestamp('06:50' , 'HH24:MI' ) , 
                       to_timestamp('10:01' , 'HH24:MI' ) , 'TS9898T') ; 
                       
-- =============================================================================
-- Instance Vol 'Montreal' , 'Ottawa' 

INSERT INTO Instance_Vol (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('TS1212', TO_DATE('04-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('15:50' , 'HH24:MI') , TO_TIMESTAMP('16:55' , 'HH24:MI') , 
110 , 'AB653453' , 'YUL' , 'YOW') ; 

INSERT INTO Instance_Vol (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee)                   
VALUES('TS1212', TO_DATE('05-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('15:55' , 'HH24:MI') , TO_TIMESTAMP('16:50' , 'HH24:MI') ,
90 , 'AB653453', 'YUL' , 'YOW') ; 

INSERT INTO Instance_Vol(num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('TS1212', TO_DATE('06-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('15:40' , 'HH24:MI') , TO_TIMESTAMP('16:45' , 'HH24:MI') , 
205 , 'BO376352', 'YUL' , 'YOW') ; 

INSERT INTO Instance_Vol (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('TS1212', TO_DATE('08-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('15:30' , 'HH24:MI') , TO_TIMESTAMP('16:25' , 'HH24:MI') , 
85 , 'AB653453', 'YUL' , 'YOW') ; 




-- -----------------------------------------------------------------------------
-- VOL AC3232 - 'Montreal' , 'Toronto' ,

INSERT INTO Instance_Vol (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('AC3232', TO_DATE('08-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('10:15' , 'HH24:MI') ,
TO_TIMESTAMP('11:30' , 'HH24:MI') , 260 ,'AB653666' , 'YUL' , 'YYZ' ) ; 

INSERT INTO Instance_Vol (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('AC3232', TO_DATE('09-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('10:25' , 'HH24:MI') ,
TO_TIMESTAMP('11:20' , 'HH24:MI') , 230 ,'AB983647', 'YUL' , 'YYZ') ; 

INSERT INTO Instance_Vol (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('AC3232', TO_DATE('03-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('10:20' , 'HH24:MI') ,
TO_TIMESTAMP('11:15' , 'HH24:MI') , 180 ,'AB653666', 'YUL' , 'YYZ') ; 

INSERT INTO Instance_Vol (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('AC3232', TO_DATE('04-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('10:05' , 'HH24:MI') ,
TO_TIMESTAMP('11:10' , 'HH24:MI') , 200 ,'AB983647', 'YUL' , 'YYZ') ; 


-- -----------------------------------------------------------------------------
-- Vol  Montreal - NYC AC1212
                       
INSERT INTO Instance_Vol (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('AC1212', TO_DATE('01-05-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('14:05' , 'HH24:MI') ,
TO_TIMESTAMP('15:20' , 'HH24:MI') , 105 ,'AB534628', 'YUL' , 'LGA') ; 


INSERT INTO Instance_Vol (num_vol, date_vol, heure_depart_reelle, heure_arrivee_reelle,
                         nbre_passager, immatriculation,code_aeroport_depart, code_aeroport_arrivee)
VALUES ('AC1212',TO_DATE('08-05-2026','DD-MM-YYYY'), TO_TIMESTAMP('14:12','HH24:MI'),
    TO_TIMESTAMP('15:25','HH24:MI'), 74,  'AB534628',  'YUL', 'LGA' );

INSERT INTO Instance_Vol ( num_vol, date_vol, heure_depart_reelle, heure_arrivee_reelle,
            nbre_passager, immatriculation, code_aeroport_depart, code_aeroport_arrivee)
VALUES ('AC1212', TO_DATE('15-05-2026','DD-MM-YYYY'), TO_TIMESTAMP('13:58','HH24:MI'), TO_TIMESTAMP('15:10','HH24:MI'),
        98,'AB534628','YUL', 'LGA');

INSERT INTO Instance_Vol ( num_vol, date_vol, heure_depart_reelle, heure_arrivee_reelle,
    nbre_passager, immatriculation, code_aeroport_depart, code_aeroport_arrivee )
VALUES ( 'AC1212', TO_DATE('22-05-2026','DD-MM-YYYY'), TO_TIMESTAMP('14:20','HH24:MI'),
    TO_TIMESTAMP('15:35','HH24:MI'), 88, 'AB534628', 'YUL', 'LGA');

-- 
-- =============================================================================
-- Vol Alger Montreal - AH1247

INSERT INTO Instance_Vol  (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('AH1247', TO_DATE('04-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('10:05' , 'HH24:MI') ,
TO_TIMESTAMP('19:20' , 'HH24:MI') , 213 ,'AB983647' , 'ALG' , 'YUL') ; 

INSERT INTO Instance_Vol  (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('AH1247', TO_DATE('05-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('09:10' , 'HH24:MI') ,
TO_TIMESTAMP('18:45' , 'HH24:MI') , 225 ,'AB986667', 'ALG' , 'YUL') ; 

INSERT INTO Instance_Vol  (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('AH1247', TO_DATE('07-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('09:55' , 'HH24:MI') ,
TO_TIMESTAMP('19:00' , 'HH24:MI') , 219 ,'AB983647', 'ALG' , 'YUL') ;

INSERT INTO Instance_Vol  (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 

VALUES('AH1247', TO_DATE('08-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('10:25' , 'HH24:MI') ,
TO_TIMESTAMP('19:35' , 'HH24:MI') , 260 ,'AB986667', 'ALG' , 'YUL') ; 

-- -----------------------------------------------------------------------------
-- Vol Montréal - Tunis - 'TU9876' 


INSERT INTO Instance_Vol  (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('TU9876', TO_DATE('04-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('10:25' , 'HH24:MI') ,
TO_TIMESTAMP('20:05' , 'HH24:MI') , 200 ,'AB763545' ,  'YUL' , 'TUN') ; 

INSERT INTO Instance_Vol  (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('TU9876', TO_DATE('06-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('10:00' , 'HH24:MI') ,
TO_TIMESTAMP('19:30' , 'HH24:MI') , 169 ,'AB763545',  'YUL' , 'TUN') ; 

INSERT INTO Instance_Vol  (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('TU9876', TO_DATE('07-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('10:45' , 'HH24:MI') ,
TO_TIMESTAMP('20:30' , 'HH24:MI') , 177 ,'AB763545',  'YUL' , 'TUN') ; 

INSERT INTO Instance_Vol  (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('TU9876', TO_DATE('09-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('10:00' , 'HH24:MI') ,
TO_TIMESTAMP('19:15' , 'HH24:MI') , 150 ,'AB763545',  'YUL' , 'TUN') ; 

-- -----------------------------------------------------------------------------
-- Vol Dakar Toronto  : 'HC7373' 
                       
INSERT INTO Instance_Vol (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('HC7373', TO_DATE('04-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('08:30' , 'HH24:MI') ,
TO_TIMESTAMP('19:35' , 'HH24:MI') , 250 ,'BO877333' , 'DKR', 'YYZ') ; 

INSERT INTO Instance_Vol (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('HC7373', TO_DATE('06-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('09:10' , 'HH24:MI') ,
TO_TIMESTAMP('19:55' , 'HH24:MI') , 235 ,'BO877333', 'DKR', 'YYZ') ; 

INSERT INTO Instance_Vol (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('HC7373', TO_DATE('08-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('09:30' , 'HH24:MI') ,
TO_TIMESTAMP('20:15' , 'HH24:MI') , 210 ,'BO877333' ,  'DKR', 'YYZ') ; 

-- -----------------------------------------------------------------------------                      
-- Vol la Havane - Montreal - Air transat  TS1234                      

INSERT INTO Instance_Vol (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('TS1234', TO_DATE('04-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('06:55' , 'HH24:MI') ,
TO_TIMESTAMP('09:50' , 'HH24:MI') , 250 ,'BO877738'  , 'HAV' , 'YUL') ; 

INSERT INTO Instance_Vol (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('TS1234', TO_DATE('05-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('07:10' , 'HH24:MI') ,
TO_TIMESTAMP('10:05' , 'HH24:MI') , 257 ,'BO877738', 'HAV' , 'YUL') ; 
 
INSERT INTO Instance_Vol (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('TS1234', TO_DATE('07-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('07:20' , 'HH24:MI') ,
TO_TIMESTAMP('10:15' , 'HH24:MI') , 225 ,'BO877738' , 'HAV' , 'YUL') ; 

INSERT INTO Instance_Vol (num_vol,date_vol, heure_depart_reelle, heure_arrivee_reelle, 
                          nbre_passager , immatriculation , code_aeroport_depart  , code_aeroport_arrivee) 
VALUES('TS1234', TO_DATE('09-03-2026' , 'DD-MM-YYYY') ,  TO_TIMESTAMP('07:00' , 'HH24:MI') ,
TO_TIMESTAMP('10:00' , 'HH24:MI') , 238 ,'BO877738' , 'HAV' , 'YUL' ) ; 
                   

-- -----------------------------------------------------------------------------
-- =============================================================================

-- Membre Équipage 

-- Équipage AirCanada
INSERT INTO Membre_equipage VALUES(1001, 'Bruce Wane'    ,'naviguant' ,'X635', NULL ) ; 
INSERT INTO Membre_equipage VALUES(1002, 'Paul Alan'     ,'naviguant' ,'Y732', NULL ) ; 
INSERT INTO Membre_equipage VALUES(1003, 'Julie Will'    ,'naviguant' ,'P873', NULL ) ; 
INSERT INTO Membre_equipage VALUES(1004, 'Mariam Fati',  'naviguant' , 'U762', NULL ) ; 
INSERT INTO Membre_equipage VALUES(1005, 'Luc Vesco',    'cabine' ,NULL , 'junior' ) ; 
INSERT INTO Membre_equipage VALUES(1006, 'Sacha Mitri' , 'cabine' ,NULL , 'intermediaire' ) ; 
INSERT INTO Membre_equipage VALUES(1007, 'Marie Vachon', 'cabine' ,NULL , 'junior')  ; 
INSERT INTO Membre_equipage VALUES(1008, 'Ali Mounir'  , 'cabine' ,NULL , 'senior') ; 
INSERT INTO Membre_equipage VALUES(1009, 'Mario Bros'  , 'cabine' ,NULL , 'intermediaire') ; 
INSERT INTO Membre_equipage VALUES(1000, 'Maria Maria' , 'cabine' ,NULL , 'junior') ; 

-- Équipage Air Algérie
INSERT INTO Membre_equipage VALUES(1010, 'Omar Syl'      ,'naviguant','O8Y8', NULL ) ; 
INSERT INTO Membre_equipage VALUES(1011, 'Pedro Start'   ,'naviguant','B7y2', NULL ) ; 
INSERT INTO Membre_equipage VALUES(1012, 'Fatima Saw'    ,'naviguant','G09E', NULL ) ; 
INSERT INTO Membre_equipage VALUES(1013, 'Jean Yvaroski' ,'naviguant','P473', NULL ) ; 
INSERT INTO Membre_equipage VALUES(1014, 'Claire Boisclair','cabine',NULL , 'junior') ; 
INSERT INTO Membre_equipage VALUES(1015, 'Li Qin'         , 'cabine',NULL , 'junior') ; 
INSERT INTO Membre_equipage VALUES(1016, 'Marie Fleur'    , 'cabine',NULL , 'senior' ) ; 
INSERT INTO Membre_equipage VALUES(1017, 'Diego Mani'     , 'cabine',NULL , 'intermediaire') ; 
INSERT INTO Membre_equipage VALUES(1018, 'Sam Bleu'       , 'cabine',NULL, 'intermediaire') ; 
INSERT INTO Membre_equipage VALUES(1019, 'Samy Diba'      , 'cabine', NULL, 'senior') ; 

INSERT INTO Membre_equipage VALUES(1020, 'Albert Albert' ,'naviguant' ,'L988', NULL ) ; 
INSERT INTO Membre_equipage VALUES(1021, 'Fan Tran'      ,'naviguant' ,'M345', NULL) ; 
INSERT INTO Membre_equipage VALUES(1022, 'Jean Paul'     ,'naviguant' ,'O773', NULL ) ;
INSERT INTO Membre_equipage VALUES(1023, 'Mia Talal' , 'cabine' ,NULL , 'senior') ; 
INSERT INTO Membre_equipage VALUES(1024, 'Samy Tahar' , 'cabine' ,NULL , 'senior') ; 
INSERT INTO Membre_equipage VALUES(1025, 'Kim Marquise' , 'cabine' ,NULL , 'senior') ; 
INSERT INTO Membre_equipage VALUES(1026, 'Nastia Moscov' , 'cabine' ,NULL , 'junior') ; 
INSERT INTO Membre_equipage VALUES(1027, 'Martine Tremblay' , 'cabine' ,NULL , 'junior') ; 
INSERT INTO Membre_equipage VALUES(1028, 'Samir Tahar' , 'cabine' ,NULL , 'intermediaire') ; 
INSERT INTO Membre_equipage VALUES(1029, 'Sipha Mauve' , 'cabine' ,NULL , 'intermediaire') ; 

INSERT INTO Membre_equipage VALUES(1030, 'Albert Deux' ,'naviguant' ,'IU88', NULL ) ; 
INSERT INTO Membre_equipage VALUES(1031, 'Fanck Tran'      ,'naviguant' ,'PS45', NULL) ; 
INSERT INTO Membre_equipage VALUES(1032, 'Jean Polo'     ,'naviguant' ,'O273', NULL ) ;
INSERT INTO Membre_equipage VALUES(1033, 'Mia San' , 'cabine' ,NULL , 'senior') ; 
INSERT INTO Membre_equipage VALUES(1034, 'Samy Mustapha' , 'cabine' ,NULL , 'senior') ; 
INSERT INTO Membre_equipage VALUES(1035, 'Kim NDo' , 'cabine' ,NULL , 'senior') ; 
INSERT INTO Membre_equipage VALUES(1036, 'Nastia Amidov' , 'cabine' ,NULL , 'junior') ; 
INSERT INTO Membre_equipage VALUES(1037, 'Martine Dubois' , 'cabine' ,NULL , 'junior') ; 
INSERT INTO Membre_equipage VALUES(1038, 'Samir Semmam' , 'cabine' ,NULL , 'intermediaire') ; 
INSERT INTO Membre_equipage VALUES(1039, 'Sipha Fatou' , 'cabine' ,NULL , 'intermediaire') ; 

INSERT INTO Membre_equipage VALUES(1040, 'Albert Colibaly' ,'naviguant' ,'F998', NULL ) ; 
INSERT INTO Membre_equipage VALUES(1041, 'Fan Yang'      ,'naviguant' ,'H645', NULL) ; 
INSERT INTO Membre_equipage VALUES(1042, 'Alex Sow'     ,'naviguant' ,'R173', NULL ) ;
INSERT INTO Membre_equipage VALUES(1043, 'Khal Tahar' , 'naviguant' ,'V373' ,NULL ) ; 
INSERT INTO Membre_equipage VALUES(1044, 'Dey Mansoor' , 'cabine' ,NULL , 'senior') ; 
INSERT INTO Membre_equipage VALUES(1045, 'Dia Mars' , 'cabine' ,NULL , 'senior') ; 
INSERT INTO Membre_equipage VALUES(1046, 'Katie Oldolov' , 'cabine' ,NULL , 'junior') ; 
INSERT INTO Membre_equipage VALUES(1047, 'Marie Nadeau' , 'cabine' ,NULL , 'junior') ; 
INSERT INTO Membre_equipage VALUES(1048, 'Salim Mandi' , 'cabine' ,NULL , 'intermediaire') ; 
INSERT INTO Membre_equipage VALUES(1049, 'Steeve John' , 'cabine' ,NULL , 'intermediaire') ; 

-- =============================================================================
-- Vol_Membre_equipage 

INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('01-05-2026' , 'DD-MM-YYYY') , 1001 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('01-05-2026' , 'DD-MM-YYYY') ,1002  ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('01-05-2026' , 'DD-MM-YYYY') , 1006 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('01-05-2026' , 'DD-MM-YYYY') ,1009  ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('01-05-2026' , 'DD-MM-YYYY') , 1005 ,'chef de cabine' ) ; 

INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('08-05-2026' , 'DD-MM-YYYY') , 1003 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('08-05-2026' , 'DD-MM-YYYY') , 1001 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('08-05-2026' , 'DD-MM-YYYY') , 1009 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('08-05-2026' , 'DD-MM-YYYY') , 1004  ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('08-05-2026' , 'DD-MM-YYYY') , 1008 ,'chef de cabine' ) ; 

INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('15-05-2026' , 'DD-MM-YYYY') , 1003 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('15-05-2026' , 'DD-MM-YYYY') , 1004 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('15-05-2026' , 'DD-MM-YYYY') , 1005 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('15-05-2026' , 'DD-MM-YYYY') , 1006  ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('15-05-2026' , 'DD-MM-YYYY') , 1000 ,'chef de cabine' ) ; 

INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('22-05-2026' , 'DD-MM-YYYY') , 1002 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('22-05-2026' , 'DD-MM-YYYY') , 1001 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('22-05-2026' , 'DD-MM-YYYY') , 1009 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('22-05-2026' , 'DD-MM-YYYY') , 1006  ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC1212' , TO_DATE('22-05-2026' , 'DD-MM-YYYY') , 1008 ,'chef de cabine' ) ; 

-- ----------------------------------------------------------------------------- 

INSERT INTO Vol_Membre_equipage VALUES ('AC3232' , TO_DATE('08-03-2026' , 'DD-MM-YYYY') , 1002 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC3232' , TO_DATE('08-03-2026' , 'DD-MM-YYYY') , 1001 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC3232' , TO_DATE('08-03-2026' , 'DD-MM-YYYY') , 1008 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC3232' , TO_DATE('08-03-2026' , 'DD-MM-YYYY') , 1009 ,'chef de cabine' ) ; 

INSERT INTO Vol_Membre_equipage VALUES ('AC3232' , TO_DATE('09-03-2026' , 'DD-MM-YYYY') , 1003 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC3232' , TO_DATE('09-03-2026' , 'DD-MM-YYYY') , 1002 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC3232' , TO_DATE('09-03-2026' , 'DD-MM-YYYY') , 1005 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC3232' , TO_DATE('09-03-2026' , 'DD-MM-YYYY') , 1006 ,'chef de cabine' ) ; 

INSERT INTO Vol_Membre_equipage VALUES ('AC3232' , TO_DATE('03-03-2026' , 'DD-MM-YYYY') , 1004 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC3232' , TO_DATE('03-03-2026' , 'DD-MM-YYYY') , 1001 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC3232' , TO_DATE('03-03-2026' , 'DD-MM-YYYY') , 1009 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC3232' , TO_DATE('03-03-2026' , 'DD-MM-YYYY') , 1007 ,'chef de cabine' ) ; 

INSERT INTO Vol_Membre_equipage VALUES ('AC3232' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1002 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC3232' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1003 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC3232' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1005 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AC3232' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1008 ,'chef de cabine' ) ; 

-- =============================================================================
-- VOL AH1247
INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1010 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1011 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1005 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1006 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1008 ,'chef de cabine' ) ; 

INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('05-03-2026' , 'DD-MM-YYYY') , 1012 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('05-03-2026' , 'DD-MM-YYYY') , 1013 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('05-03-2026' , 'DD-MM-YYYY') , 1017 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('05-03-2026' , 'DD-MM-YYYY') , 1019 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('05-03-2026' , 'DD-MM-YYYY') , 1016 ,'chef de cabine' ) ; 

INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('07-03-2026' , 'DD-MM-YYYY') , 1013 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('07-03-2026' , 'DD-MM-YYYY') , 1010 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('07-03-2026' , 'DD-MM-YYYY') , 1014,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('07-03-2026' , 'DD-MM-YYYY') , 1015 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('07-03-2026' , 'DD-MM-YYYY') , 1018 ,'chef de cabine' ) ; 

INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('08-03-2026' , 'DD-MM-YYYY') , 1011 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('08-03-2026' , 'DD-MM-YYYY') , 1013 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('08-03-2026' , 'DD-MM-YYYY') , 1016 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('08-03-2026' , 'DD-MM-YYYY') , 1017 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('AH1247' , TO_DATE('08-03-2026' , 'DD-MM-YYYY') , 1018 ,'chef de cabine' ) ; 

-- =============================================================================

INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1020 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1021 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1024 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1025 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1026 ,'chef de cabine' ) ; 

INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('06-03-2026' , 'DD-MM-YYYY') , 1022 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('06-03-2026' , 'DD-MM-YYYY') , 1023 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('06-03-2026' , 'DD-MM-YYYY') , 1026 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('06-03-2026' , 'DD-MM-YYYY') , 1028 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('06-03-2026' , 'DD-MM-YYYY') , 1029 ,'chef de cabine' ) ; 

INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('07-03-2026' , 'DD-MM-YYYY') , 1021 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('07-03-2026' , 'DD-MM-YYYY') , 1023 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('07-03-2026' , 'DD-MM-YYYY') , 1024 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('07-03-2026' , 'DD-MM-YYYY') , 1026 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('07-03-2026' , 'DD-MM-YYYY') , 1027 ,'chef de cabine' ) ; 

INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('09-03-2026' , 'DD-MM-YYYY') , 1020 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('09-03-2026' , 'DD-MM-YYYY') , 1022 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('09-03-2026' , 'DD-MM-YYYY') , 1024 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('09-03-2026' , 'DD-MM-YYYY') , 1025 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TU9876' , TO_DATE('09-03-2026' , 'DD-MM-YYYY') , 1028 ,'chef de cabine' ) ; 

-- -----------------------------------------------------------------------------
-- Vol Sénégal 
INSERT INTO Vol_Membre_equipage VALUES ('HC7373' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1030 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('HC7373' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1031 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('HC7373' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1035 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('HC7373' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1037 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('HC7373' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1036 ,'chef de cabine' ) ; 

INSERT INTO Vol_Membre_equipage VALUES ('HC7373' , TO_DATE('06-03-2026' , 'DD-MM-YYYY') , 1032 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('HC7373' , TO_DATE('06-03-2026' , 'DD-MM-YYYY') , 1030 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('HC7373' , TO_DATE('06-03-2026' , 'DD-MM-YYYY') , 1034 ,'agent' ) ;
INSERT INTO Vol_Membre_equipage VALUES ('HC7373' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1038 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('HC7373' , TO_DATE('06-03-2026' , 'DD-MM-YYYY') , 1039 ,'chef de cabine' ) ; 

INSERT INTO Vol_Membre_equipage VALUES ('HC7373' , TO_DATE('08-03-2026' , 'DD-MM-YYYY') , 1030 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('HC7373' , TO_DATE('08-03-2026' , 'DD-MM-YYYY') , 1032 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('HC7373' , TO_DATE('08-03-2026' , 'DD-MM-YYYY') , 1034 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('HC7373' , TO_DATE('08-03-2026' , 'DD-MM-YYYY') , 1036 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('HC7373' , TO_DATE('08-03-2026' , 'DD-MM-YYYY') , 1037 ,'chef de cabine' ) ; 

-- ==============================================================================
INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1040 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1041 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1044 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1045 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('04-03-2026' , 'DD-MM-YYYY') , 1046 ,'chef de cabine' ) ; 

INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('05-03-2026' , 'DD-MM-YYYY') , 1040 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('05-03-2026' , 'DD-MM-YYYY') , 1041 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('05-03-2026' , 'DD-MM-YYYY') , 1044 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('05-03-2026' , 'DD-MM-YYYY') , 1045 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('05-03-2026' , 'DD-MM-YYYY') , 1046 ,'chef de cabine' ) ; 

INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('07-03-2026' , 'DD-MM-YYYY') , 1042 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('07-03-2026' , 'DD-MM-YYYY') , 1044 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('07-03-2026' , 'DD-MM-YYYY') , 1046 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('07-03-2026' , 'DD-MM-YYYY') , 1047 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('07-03-2026' , 'DD-MM-YYYY') , 1048 ,'chef de cabine' ) ; 

INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('09-03-2026' , 'DD-MM-YYYY') , 1043 ,'pilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('09-03-2026' , 'DD-MM-YYYY') , 1041 ,'copilote' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('09-03-2026' , 'DD-MM-YYYY') , 1049 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('09-03-2026' , 'DD-MM-YYYY') , 1048 ,'agent' ) ; 
INSERT INTO Vol_Membre_equipage VALUES ('TS1234' , TO_DATE('09-03-2026' , 'DD-MM-YYYY') , 1044 ,'chef de cabine' ) ; 
 
-- =============================================================================
-- Table Technicien 
INSERT INTO Technicien VALUES (9001 , 'Gaston Colombier', 'mecanique') ; 
INSERT INTO Technicien VALUES (9002 , 'Pierre Deleau', 'mecanique') ; 
INSERT INTO Technicien VALUES (9003 , 'Marco Pele', 'entretien') ; 
INSERT INTO Technicien VALUES (9004 , 'Marise Diane', 'electrique') ; 
INSERT INTO Technicien VALUES (9005 , 'Nacer Nass', 'entretien') ; 
INSERT INTO Technicien VALUES (9006 , 'Sabine Dior', 'electrique') ; 
INSERT INTO Technicien VALUES (9007 , 'Rym Baluchon', 'electrique') ; 
INSERT INTO Technicien VALUES (9008 , 'Lyne Savard', 'climatisation') ; 

-- =============================================================================
-- Table Piece
INSERT INTO Piece VALUES(501 , 'controleur pression' , 1248.99 ) ; 
INSERT INTO Piece VALUES(502 , 'valve' , 448.90) ; 
INSERT INTO Piece VALUES(503 , 'transmission' , 2326.50 ) ; 
INSERT INTO Piece VALUES(504 , 'helice' , 1010.30 ) ; 
INSERT INTO Piece VALUES(505 , 'pneumatique' , 675 ) ; 
INSERT INTO Piece VALUES(506 , 'ajusteur' , 389.95 ) ; 
INSERT INTO Piece VALUES(507 , 'filtre carburant' , 438.25 ) ; 
INSERT INTO Piece VALUES(508 , 'lubrifiant' , 238 ) ;
INSERT INTO Piece VALUES(509 , 'injecteur' , 738 ) ;

-- =============================================================================
-- Maintenance  
INSERT INTO Maintenance VALUES (900 , to_date('01-03-2026', 'DD-MM-YYYY') , 'AB653453') ; 
INSERT INTO Maintenance VALUES (901 , to_date('01-03-2026', 'DD-MM-YYYY') , 'AB653666') ; 
INSERT INTO Maintenance VALUES (902 , to_date('04-03-2026', 'DD-MM-YYYY') , 'BO877738') ; 
INSERT INTO Maintenance VALUES (903 , to_date('05-03-2026', 'DD-MM-YYYY') , 'AB653453') ; 

-- =============================================================================
-- Table Intervention
    
INSERT INTO Intervention VALUES (9001, 900 , 4) ; 
INSERT INTO Intervention VALUES( 9002, 900 , 3) ;
INSERT INTO Intervention VALUES( 9003, 900 , 2) ;

INSERT INTO Intervention VALUES( 9004, 901 , 5) ; 

INSERT INTO Intervention VALUES( 9001, 902 , 2 ) ; 
INSERT INTO Intervention VALUES( 9002, 902 , 2 ) ; 

INSERT INTO Intervention VALUES( 9001, 903 , 5 ) ;

-- =============================================================================
-- Table Maintenance_Piece
-- id_maintenance ,   code_piece 
   
INSERT INTO Maintenance_Piece VALUES(900 , 501 ) ; 
INSERT INTO Maintenance_Piece VALUES(900 , 502 ) ; 
INSERT INTO Maintenance_Piece VALUES(900 , 505 ) ;

INSERT INTO Maintenance_Piece VALUES(902, 501) ; 
INSERT INTO Maintenance_Piece VALUES(902, 502) ; 
INSERT INTO Maintenance_Piece VALUES(902, 506) ; 

INSERT INTO Maintenance_Piece VALUES(903 , 501 ) ; 
INSERT INTO Maintenance_Piece VALUES(903 , 504 ) ; 

-- =============================================================================
commit ; 