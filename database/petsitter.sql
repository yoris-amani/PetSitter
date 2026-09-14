CREATE DATABASE petsitter;
USE petsitter;

CREATE TABLE Utilisateur (
    id_user INT AUTO_INCREMENT,
    nom VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL,
    pwd VARCHAR(100) NOT NULL,
    is_proprietaire BOOLEAN DEFAULT TRUE,
    is_gardien BOOLEAN DEFAULT FALSE,
    PRIMARY KEY(id_user),
    CONSTRAINT UC_email UNIQUE(email)
) ENGINE=InnoDB;

CREATE TABLE Annonce (
    id_advertisement INT AUTO_INCREMENT,
    id_proprietaire INT NOT NULL,
    titre VARCHAR(200) NOT NULL,
    type_animal VARCHAR(200) NOT NULL,
    ville VARCHAR(250),
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    descript VARCHAR(300) NOT NULL,
    statut ENUM('Ouverte', 'Pourvue', 'Terminée') DEFAULT 'Ouverte' NOT NULL,
    PRIMARY KEY(id_advertisement)
);

CREATE TABLE Candidature (
    id_candidature INT AUTO_INCREMENT,
    id_advertisement INT NOT NULL,
    id_gardien INT NOT NULL,
    msg VARCHAR(300) NOT NULL,
    statut ENUM('En attente', 'Acceptée', 'Refusée') DEFAULT 'En attente' NOT NULL,
    date_candidature DATE NOT NULL,
    PRIMARY KEY(id_candidature),
    CONSTRAINT UC_annonce_gardien UNIQUE(id_advertisement, id_gardien)
);

CREATE TABLE Avis (
    id_avis INT AUTO_INCREMENT,
    id_advertisement INT NOT NULL,
    id_auteur INT NOT NULL,
    id_cible INT NOT NULL,
    note TINYINT UNSIGNED NOT NULL DEFAULT 3,
    commentaire VARCHAR(300) NOT NULL,
    date_avis DATE NOT NULL,
    PRIMARY KEY(id_avis),
    CONSTRAINT UC_annonce_auteur_cible UNIQUE(id_advertisement, id_auteur, id_cible)
);

ALTER TABLE Annonce
ADD CONSTRAINT fk_annonce_proprietaire
FOREIGN KEY (id_proprietaire)
REFERENCES Utilisateur(id_user);

ALTER TABLE Candidature
ADD CONSTRAINT fk_candidature_annonce
FOREIGN KEY(id_advertisement)
REFERENCES Annonce(id_advertisement);

ALTER TABLE Candidature
ADD CONSTRAINT fk_candidature_gardien
FOREIGN KEY(id_gardien)
REFERENCES Utilisateur(id_user);

ALTER TABLE Avis
ADD CONSTRAINT fk_avis_annonce
FOREIGN KEY(id_advertisement)
REFERENCES Annonce(id_advertisement);

ALTER TABLE Avis
ADD CONSTRAINT fk_avis_auteur
FOREIGN KEY(id_auteur)
REFERENCES Utilisateur(id_user);

ALTER TABLE Avis
ADD CONSTRAINT fk_avis_cible
FOREIGN KEY(id_cible)
REFERENCES Utilisateur(id_user);