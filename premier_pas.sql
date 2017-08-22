DROP DATABASE base_restaurant;

-- Création de la base

CREATE DATABASE IF NOT EXISTS base_restaurant;

-- Création des tables entités

CREATE TABLE IF NOT EXISTS base_restaurant.Commande(  id_commande int NOT NULL primary key auto_increment, 
                                        nom VARCHAR(50), 
                                        la_date DATE, 
                                        total FLOAT 
                                        );
                                        
CREATE TABLE IF NOT EXISTS base_restaurant.Plat(id_plat int NOT NULL primary key auto_increment, nom VARCHAR(50));

CREATE TABLE IF NOT EXISTS base_restaurant.Ingredient( nom_ingredient VARCHAR(50) NOT NULL primary key );

-- Création des tables relations

CREATE TABLE IF NOT EXISTS base_restaurant.Contenu_commande( id_cc int NOT NULL primary key auto_increment, id_commande INT, id_plat INT,
												FOREIGN KEY (id_commande) REFERENCES Commande(id_commande), 
                                                FOREIGN KEY (id_plat) REFERENCES Plat(id_plat) 
                                                );
 
 
 CREATE TABLE IF NOT EXISTS base_restaurant.plat_ingredients( id_plat INT,
															FOREIGN KEY (id_plat) REFERENCES Plat(id_plat),
                                                            nom_ingredient VARCHAR(50),
                                                            FOREIGN KEY (nom_ingredient) REFERENCES Ingredient(nom_ingredient),
                                                            PRIMARY KEY( id_plat, nom_ingredient ), 
                                                            quantite FLOAT
                                                            );

-- Remplissage des tables

INSERT INTO base_restaurant.Ingredient ( nom_ingredient ) VALUES ( 'Tomate' );
INSERT INTO base_restaurant.Ingredient ( nom_ingredient ) VALUES ( 'Patate' );
INSERT INTO base_restaurant.Ingredient ( nom_ingredient ) VALUES ( 'Oignon' );
INSERT INTO base_restaurant.Ingredient ( nom_ingredient ) VALUES ( 'Concombre' );
INSERT INTO base_restaurant.Ingredient ( nom_ingredient ) VALUES ( 'Riz' );
INSERT INTO base_restaurant.Ingredient ( nom_ingredient ) VALUES ( 'Jambon' );
INSERT INTO base_restaurant.Ingredient ( nom_ingredient ) VALUES ( 'Salade verte' );
INSERT INTO base_restaurant.Ingredient ( nom_ingredient ) VALUES ( 'Poivron' );
INSERT INTO base_restaurant.Ingredient ( nom_ingredient ) VALUES ( 'Poulet' );
INSERT INTO base_restaurant.Ingredient ( nom_ingredient ) VALUES ( 'Boeuf' );
INSERT INTO base_restaurant.Ingredient ( nom_ingredient ) VALUES ( 'Lardon' );
INSERT INTO base_restaurant.Ingredient ( nom_ingredient ) VALUES ( 'Oeuf' );
INSERT INTO base_restaurant.Ingredient ( nom_ingredient ) VALUES ( 'Pate' );
INSERT INTO base_restaurant.Ingredient ( nom_ingredient ) VALUES ( 'Champignons' );
INSERT INTO base_restaurant.Ingredient ( nom_ingredient ) VALUES ( 'Crême fraîche' );

INSERT INTO base_restaurant.plat ( nom ) VALUES ( 'Pates carbonara' );
INSERT INTO base_restaurant.plat ( nom ) VALUES ( 'Salade paysanne' );
INSERT INTO base_restaurant.plat ( nom ) VALUES ( 'Steack frites' );
INSERT INTO base_restaurant.plat ( nom ) VALUES ( 'Frites' );
INSERT INTO base_restaurant.plat ( nom ) VALUES ( 'Omelette au poivron' );
INSERT INTO base_restaurant.plat ( nom ) VALUES ( 'Risotto' );

INSERT INTO base_restaurant.commande ( nom, la_date, total) VALUES ( 'Mr Toto', 10/10/2007, 32.4 );
INSERT INTO base_restaurant.commande ( nom, la_date, total) VALUES ( 'Mme Titi', 10/10/2007, 28.7 );
INSERT INTO base_restaurant.commande ( nom, la_date, total) VALUES ( 'Mr Martin', 12/10/2007, 22.1 );
INSERT INTO base_restaurant.commande ( nom, la_date, total) VALUES ( 'Mr Dupont', 12/10/2007, 108.6 );
INSERT INTO base_restaurant.commande ( nom, la_date, total) VALUES ( 'Mme Dupont', 14/10/2007, 42 );





