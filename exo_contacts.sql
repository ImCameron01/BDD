-- Création de la base de données
CREATE DATABASE IF NOT EXISTS exo_contacts;
USE exo_contacts;

-- Création de la table "contacts"
CREATE TABLE IF NOT EXISTS contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(70),
    prenom VARCHAR(70),
    date_de_naissance DATE,
    sexe VARCHAR(70),
    adresse TEXT,
    cp VARCHAR(10),
    ville VARCHAR(70),
    pays_iso_3 VARCHAR(3),
    FOREIGN KEY (pays_iso_3) REFERENCES pays(iso_3)
);

-- Création de la table "pays"
CREATE TABLE IF NOT EXISTS pays (
    iso_3 VARCHAR(3) PRIMARY KEY,
    nom VARCHAR(70),
    iso_2 VARCHAR(2),
    nationalite VARCHAR(50)
);

-- Création de la table "telephone"
CREATE TABLE IF NOT EXISTS telephone (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_contact INT,
    numero VARCHAR(50),
    type TINYINT NOT NULL,
    FOREIGN KEY (id_contact) REFERENCES contacts(id)
);