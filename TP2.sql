-- Question 1 : Affichez le nom des agences
SELECT * FROM immobilier.agence;

-- Question 2 : Affichez le numéro de l’agence « Orpi »
SELECT IdAgence FROM immobilier.agence;

-- Question 3 : Affichez le premier enregistrement de la table logement
SELECT * FROM immobilier.logement LIMIT 1;

-- Question 4 : Affichez le nombre de logements (Alias : Nombre_de_logements)
SELECT count(idLogement) AS Nombre_de_logements FROM immobilier.logement ;

-- Question 5 : Affichez les logements à vendre à moins de 150 000 € dans l’ordre croissant des prix.
SELECT * FROM immobilier.logement WHERE categorie = "vente" AND prix < 150000;

-- Question 6 : Affichez le nombre de logements à la location (alias : nombre)
SELECT count(categorie) AS nombre_logements_location FROM immobilier.logement WHERE categorie = "location";

-- Question 7 : Affichez les villes différentes recherchées par les personnes demandeuses d'un logement
SELECT DISTINCT ville AS nom_des_villes FROM immobilier.demande WHERE categorie = "location";

-- Question 8 : Affichez le nombre de biens à vendre par ville
SELECT ville, count(ville) AS nombre_de_biens_a_vendre FROM immobilier.logement WHERE categorie = "vente" GROUP BY ville;

-- Question 9 : Quelles sont les id des logements destinés à la location ?
SELECT idLogement FROM immobilier.logement WHERE categorie = "location";

-- Question 10 : Quels sont les id des logements entre 20 et 30m² ?
SELECT idLogement FROM immobilier.logement WHERE superficie BETWEEN 20 AND 30;

-- Question 11 : Quel est le prix vendeur (hors commission) du logement le moins cher à vendre ? (Alias : prix minimum)
SELECT min(prix) AS prix_minimum FROM immobilier.logement WHERE categorie = "vente";

-- Question 12 : Dans quelle ville se trouve les maisons à vendre ?
SELECT DISTINCT ville FROM immobilier.logement AS lieu WHERE categorie = "vente" AND genre = "maison";

-- Question 13 : L’agence Orpi souhaite diminuer les frais qu’elle applique sur le logement ayant l'id « 5246 ». Passer les frais de ce logement de 800 à 730€
UPDATE immobilier.logement_agence SET frais = 730 WHERE idLogement = 5246;

-- Question 14 : Quels sont les logements gérés par l’agence « laforet »
SELECT idLogement FROM logement_agence INNER JOIN agence ON logement_agence.idAgence = agence.idAgence WHERE agence.nom = "laforet";

SELECT idLogement FROM logement_agence , agence where  logement_agence.idAgence = agence.idAgence and logement_agence.idAgence = 504585;

-- Question 15 : Affichez le nombre de propriétaires dans la ville de Paris (Alias : Nombre)
SELECT count(idLogement) AS Nombre FROM immobilier.logement WHERE ville = "paris";

-- Question 16 : Affichez les informations des trois premieres personnes souhaitant acheter un logement
SELECT personne.idPersonne, prenom FROM immobilier.personne INNER JOIN immobilier.demande ON personne.idPersonne = demande.idPersonne LIMIT 3;

-- Question 17 : Affichez le prénom du vendeur pour le logement ayant la référence « 5770 »
SELECT prenom FROM immobilier.personne INNER JOIN immobilier.logement_personne ON personne.idPersonne = logement_personne.idPersonne WHERE idLogement = 5770;

-- Question 18 : Affichez les prénoms des personnes souhaitant accéder à un logement sur la ville de Lyon
SELECT prenom FROM immobilier.personne INNER JOIN immobilier.demande ON personne.idPersonne = demande.idPersonne WHERE ville = "lyon";

-- Question 19 : Affichez les prénoms des personnes souhaitant accéder à un logement en location sur la ville de Paris
SELECT prenom FROM immobilier.personne INNER JOIN immobilier.demande ON personne.idPersonne = demande.idPersonne WHERE ville = "paris" AND categorie = "location";

-- Question 20 : Affichez les prénoms des personnes souhaitant acheter un logement de la plus grande à la plus petite superficie
SELECT prenom FROM immobilier.personne INNER JOIN immobilier.demande ON personne.idPersonne = demande.idPersonne  WHERE categorie = "vente" ORDER BY immobilier.demande.superficie DESC;

-- Question 21 : Quel sont les prix finaux proposés par les agences pour la maison à la vente ayant la référence « 5091 » ? (Alias : prix frais d'agence inclus)
SELECT logement.prix + logement_agence.frais AS prix_finaux FROM immobilier.logement_agence INNER JOIN immobilier.logement ON logement_agence.idLogement = logement.idLogement  WHERE logement.idLogement = 5091;

-- Question 23 : Si l’ensemble des logements étaient vendus ou loués demain, quel serait le bénéfice généré grâce aux frais d’agence et pour chaque agence (Alias : benefice, classement : par ordre croissant des gains)
SELECT logement_agence.idAgence, sum(logement_agence.frais) AS bénéfice 
FROM immobilier.logement_agence 
GROUP BY logement_agence.idAgence ORDER BY bénéfice ASC ;

-- Question 24 : Affichez les id des biens en location, les prix, suivis des frais d’agence (classement : dans l’ordre croissant des prix) 
SELECT logement_agence.idLogement, logement.prix, logement_agence.frais
FROM immobilier.logement_agence INNER JOIN immobilier.logement ON logement_agence.idLogement = logement.idLogement WHERE categorie = "location"; 

-- Question 25 : Quel est le prénom du propriétaire proposant le logement le moins cher à louer ?


-- Question 26 : Affichez le prénom et la ville où se trouve le logement de chaque propriétaire
-- Question 27 : Quel est l’agence immobilière s’occupant de la plus grande gestion de logements répertoriés à Paris ? (alias : nombre, classement : trié par ordre décroissant)
-- Question 28 : Affichez le prix et le prénom des vendeurs dont les logements sont proposés à 130000 € ou moins en prix final avec frais appliqués par les agences (alias : prix final, classement : ordre croissant des prix finaux) :

-- Question 29 : Afficher toutes les demandes enregistrées avec la personne à l'origine de la demande (Afficher également les demandes d'anciennes personnes n'existant plus dans notre base de données).
-- Question 30 : Afficher toutes les personnes enregistrées avec leur demandes correspondantes (Afficher également les personnes n'ayant pas formulé de demandes).
