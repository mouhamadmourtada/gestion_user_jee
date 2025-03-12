CREATE DATABASE IF NOT EXISTS gestion_users;
USE gestion_users;

CREATE TABLE IF NOT EXISTS utilisateurs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    login VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Insertion des utilisateurs de test
INSERT INTO utilisateurs (nom, prenom, login, password) VALUES
('DIOP', 'Modou', 'modou', 'passer'),
('FALL', 'Fatou', 'fatou', 'passer123');