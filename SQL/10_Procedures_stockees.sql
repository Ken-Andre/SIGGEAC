-- Procédure stockée pour ajouter un professeur
CREATE OR REPLACE PROCEDURE AjouterProfesseur(
    nom_professeur VARCHAR(100)
)
AS $$
BEGIN
    INSERT INTO Professeur(nom) VALUES (nom_professeur);
END;
$$ LANGUAGE plpgsql;

-- Procédure stockée pour retirer un professeur
CREATE OR REPLACE PROCEDURE RetirerProfesseur(
    matriculep INT
)
AS $$
BEGIN
    DELETE FROM professeur WHERE professeur.matriculep = RetirerProfesseur.matriculep;
END;
$$ LANGUAGE plpgsql;

-- Procédure stockée pour modifier un professeur
CREATE OR REPLACE PROCEDURE ModifierProfesseur(
    matriculep INT,
    nom_professeur VARCHAR(100)
)
AS $$
BEGIN
    UPDATE professeur SET Nom = nom_professeur WHERE professeur.matriculep = ModifierProfesseur.matriculep;
END;
$$ LANGUAGE plpgsql;
