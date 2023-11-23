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

-- Ajouter des enregistrements dans la table "pays"
INSERT INTO pays (iso_3, nom, iso_2, nationalite) VALUES
    ('FRA', 'France', 'FR', 'French'),
    ('USA', 'United States', 'US', 'American'),
    ('GER', 'Germany', 'DE', 'German'),
    ('ITA', 'Italy', 'IT', 'Italian'),
    ('ESP', 'Spain', 'ES', 'Spanish'),
    ('CAN', 'Canada', 'CA', 'Canadian'),
    ('GBR', 'United Kingdom', 'GB', 'British'),
    ('JPN', 'Japan', 'JP', 'Japanese'),
    ('AUS', 'Australia', 'AU', 'Australian'),
    ('BRA', 'Brazil', 'BR', 'Brazilian');

-- Ajouter des enregistrements dans la table "contacts"
INSERT INTO contacts (nom, prenom, date_de_naissance, sexe, adresse, cp, ville, pays_iso_3) VALUES
    ('Dupont', 'Jean', '1990-05-15', 'M', '123 Rue de la Paix', '75001', 'Paris', 'FRA'),
    ('Smith', 'John', '1985-08-20', 'M', '456 Main Street', '10001', 'New York', 'USA'),
    ('Müller', 'Anna', '1982-12-10', 'F', '789 Hauptstraße', '10115', 'Berlin', 'GER'),
    ('Rossi', 'Mario', '1988-03-25', 'M', '321 Via Roma', '00185', 'Rome', 'ITA'),
    ('García', 'Maria', '1995-07-08', 'F', '987 Calle Mayor', '28001', 'Madrid', 'ESP'),
    ('Tremblay', 'Isabelle', '1993-02-18', 'F', '456 Rue Principale', 'H1H 1H1', 'Montreal', 'CAN'),
    ('Jones', 'David', '1980-11-30', 'M', '789 High Street', 'SW1A 1AA', 'London', 'GBR'),
    ('Suzuki', 'Takashi', '1987-06-12', 'M', '123 Ginza', '100-8050', 'Tokyo', 'JPN'),
    ('Wong', 'Linda', '1992-09-05', 'F', '456 George Street', '2000', 'Sydney', 'AUS'),
    ('Silva', 'Carlos', '1984-04-22', 'M', '789 Avenida Paulista', '01310-100', 'Sao Paulo', 'BRA');

-- Ajouter des enregistrements dans la table "telephone"
INSERT INTO telephone (id_contact, numero, type) VALUES
    (1, '+33 1 23 45 67 89', 1), -- 1: Mobile
    (2, '+1 555-555-5555', 2),   -- 2: Domicile
    (3, '+49 30 1234567', 1),
    (4, '+39 06 12345678', 2),
    (5, '+34 91 123 45 67', 1),
    (6, '+1 514-555-5555', 1),
    (7, '+44 20 1234 5678', 2),
    (8, '+81 3-1234-5678', 1),
    (9, '+61 2 1234 5678', 2),
    (10, '+55 11 1234-5678', 1);