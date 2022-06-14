CREATE TABLE abonne(
   abonne_id INT AUTO_INCREMENT,
   abonne_nom VARCHAR(100)  NOT NULL,
   abonne_prenom VARCHAR(50)  NOT NULL,
   abonne_adresse VARCHAR(100)  NOT NULL,
   abonne_code_postal VARCHAR(5)  NOT NULL,
   abonne_ville VARCHAR(50)  NOT NULL,
   abonne_telephone VARCHAR(20) ,
   abonne_date_debut DATE,
   PRIMARY KEY(abonne_id)
);

CREATE TABLE livre(
   livre_id INT AUTO_INCREMENT,
   livre_titre VARCHAR(100)  NOT NULL,
   livre_numero INT NOT NULL,
   livre_dispo BOOLEAN,
   livre_date_rebut DATE,
   PRIMARY KEY(livre_id)
);

CREATE TABLE auteur(
   auteur_id INT AUTO_INCREMENT,
   auteur_nom VARCHAR(50) ,
   PRIMARY KEY(auteur_id)
);

CREATE TABLE editeur(
   editeur_id INT AUTO_INCREMENT,
   editeur_nom VARCHAR(50) ,
   PRIMARY KEY(editeur_id)
);

CREATE TABLE theme(
   theme_id INT AUTO_INCREMENT,
   theme_nom VARCHAR(50) ,
   theme_couleur VARCHAR(50) ,
   PRIMARY KEY(theme_id)
);

CREATE TABLE emprunte(
   abonne_id INT,
   emprunte_date DATE NOT NULL,
   emprunte_date_retour DATE,
   emprunte_relance DATE,
   emprunte_relance2 DATE,
   emprunte_relance3 DATE,
   livre_id INT NOT NULL,
   PRIMARY KEY(abonne_id),
   UNIQUE(livre_id),
   FOREIGN KEY(abonne_id) REFERENCES abonne(abonne_id),
   FOREIGN KEY(livre_id) REFERENCES livre(livre_id)
);

CREATE TABLE Appartient(
   livre_id INT,
   theme_id INT,
   PRIMARY KEY(livre_id, theme_id),
   FOREIGN KEY(livre_id) REFERENCES livre(livre_id),
   FOREIGN KEY(theme_id) REFERENCES theme(theme_id)
);

CREATE TABLE Edite(
   livre_id INT,
   editeur_id INT,
   edition_date DATE,
   PRIMARY KEY(livre_id, editeur_id),
   FOREIGN KEY(livre_id) REFERENCES livre(livre_id),
   FOREIGN KEY(editeur_id) REFERENCES editeur(editeur_id)
);

CREATE TABLE Ecrit(
   livre_id INT,
   auteur_id INT,
   PRIMARY KEY(livre_id, auteur_id),
   FOREIGN KEY(livre_id) REFERENCES livre(livre_id),
   FOREIGN KEY(auteur_id) REFERENCES auteur(auteur_id)
);

