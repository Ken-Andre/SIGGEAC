-- =================Professeur====================
SET search_path to professeur;
-- Procédure stockée pour ajouter un professeur
CREATE OR REPLACE PROCEDURE AjouterProfesseur(
    nom_professeur VARCHAR(100)
)
AS $$
BEGIN
    INSERT INTO "MDD".Professeur(matriculep, nom) VALUES (matriculep, nom_professeur);
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

-- ==================Etudiants====================
SET search_path to etudiant;
-- Procédure stockée pour ajouter un étudiant
CREATE OR REPLACE PROCEDURE AjouterEtudiant(
    IN matricule_etudiant "MDD".matriculee,
    IN nom_etudiant "MDD".nom ,
    IN date_naissance DATE
)
AS $$
BEGIN
    INSERT INTO "MDD".Etudiant(matriculee, nom,ddn)
    VALUES (matricule_etudiant, nom_etudiant, date_naissance);
END;
$$ LANGUAGE plpgsql;
-- Procédure stockée pour retirer un étudiant
CREATE OR REPLACE PROCEDURE RetirerEtudiant(
    IN matricule_etudiant "MDD".matriculee
)
AS $$
BEGIN
    DELETE FROM "MDD".Etudiant e WHERE e.matriculee = matricule_etudiant;
END;
$$ LANGUAGE plpgsql;
-- Procédure stockée pour modifier un étudiant
CREATE OR REPLACE PROCEDURE ModifierEtudiant(
    IN matricule_etudiant "MDD".matriculee,
    IN nom_etudiant "MDD".nom ,
    IN date_naissance DATE
)
AS $$
BEGIN
    UPDATE "MDD".Etudiant e
    SET
        nom = nom_etudiant,
        ddn = date_naissance
    WHERE
        e.matriculee = matricule_etudiant;
END;
$$ LANGUAGE plpgsql;

-- ==================Cours====================
SET search_path to offreservices;
-- Procédure stockée pour ajouter un cours
CREATE OR REPLACE PROCEDURE AjouterCours(
    IN p_sigle VARCHAR(10),
    IN p_titre VARCHAR(255),
    IN p_credit INT
)
AS $$
BEGIN
    INSERT INTO "MDD".cours(sigle, titre, credit)
    VALUES (p_sigle, p_titre, p_credit);
END;
$$ LANGUAGE plpgsql;
-- Procédure stockée pour retirer un cours
CREATE OR REPLACE PROCEDURE RetirerCours(
    IN p_sigle VARCHAR(10)
)
AS $$
BEGIN
    DELETE FROM "MDD".cours WHERE sigle = p_sigle;
END;
$$ LANGUAGE plpgsql;
-- Procédure stockée pour modifier un cours
CREATE OR REPLACE PROCEDURE ModifierCours(
    IN p_sigle VARCHAR(10),
    IN p_titre VARCHAR(255),
    IN p_credit INT
)
AS $$
BEGIN
    UPDATE "MDD".cours
    SET
        titre = p_titre,
        credit = p_credit
    WHERE
        sigle = p_sigle;
END;
$$ LANGUAGE plpgsql;
-- Routine pour récupérer tous les cours
CREATE OR REPLACE FUNCTION cours.ListerCours()
RETURNS TABLE(sigle VARCHAR(10), titre VARCHAR(255), credit INT)
AS $$
BEGIN
    RETURN QUERY SELECT sigle, titre, credit FROM "MDD".cours;
END;
$$ LANGUAGE plpgsql;

-- ==================Offres==================
SET search_path to offreservices;
CREATE OR REPLACE PROCEDURE AjouterOffre(
    IN p_sigle VARCHAR(10),
    IN p_trimestre VARCHAR(20)
)
AS $$
BEGIN
    INSERT INTO "MDD".offre(sigle, trimestre)
    VALUES (p_sigle, p_trimestre);
END;
$$ LANGUAGE plpgsql;
COMMENT ON PROCEDURE AjouterOffre
    IS 'Ajoute une nouvelle offre de cours pour le sigle spécifié au trimestre spécifié.';
CREATE OR REPLACE PROCEDURE RetirerOffre(
    IN p_sigle VARCHAR(10),
    IN p_trimestre VARCHAR(20)
)
AS $$
BEGIN
    DELETE FROM "MDD".offre
           WHERE sigle = p_sigle AND trimestre = p_trimestre;
END
$$ LANGUAGE plpgsql;
COMMENT ON PROCEDURE RetirerOffre
    IS 'Retire l''offre de cours pour le sigle spécifié au trimestre spécifié.';
CREATE OR REPLACE PROCEDURE MDD.ModifierOffre(
    IN p_sigle VARCHAR(10),
    IN p_trimestre VARCHAR(20),
    IN p_new_sigle VARCHAR(10),
    IN p_new_trimestre VARCHAR(20)
)
AS $$
BEGIN
    UPDATE "MDD".offre
    SET sigle = p_new_sigle,
        trimestre = p_new_trimestre
    WHERE sigle = p_sigle AND trimestre = p_trimestre;
END;
$$ LANGUAGE plpgsql;
COMMENT ON PROCEDURE MDD.ModifierOffre
    IS 'Modifie l''offre de cours pour le sigle et le trimestre spécifiés.';

--
SET search_path to offreservices;
CREATE OR REPLACE PROCEDURE MDD.AjouterGroupe(
    IN p_numero_groupe "MDD".nogroupe,
    IN p_sigle "MDD".sigle,
    IN p_trimestre "MDD".trimestre
)
AS $$
BEGIN
    INSERT INTO "MDD".groupe(nogroupe, sigle, trimestre)
    VALUES (p_numero_groupe, p_sigle, p_trimestre);
END;
$$ LANGUAGE plpgsql;
COMMENT ON PROCEDURE MDD.AjouterGroupe
    IS 'Ajoute un nouveau groupe de cours avec le numéro, le sigle, le trimestre et le nombre d''étudiants spécifiés.';
CREATE OR REPLACE PROCEDURE MDD.RetirerGroupe(
    IN p_numero_groupe "MDD".nogroupe,
    IN p_sigle "MDD".sigle,
    IN p_trimestre "MDD".trimestre
)
AS $$
BEGIN
    DELETE FROM "MDD".groupe
    WHERE nogroupe = p_numero_groupe AND sigle = p_sigle AND trimestre = p_trimestre;
END;
$$ LANGUAGE plpgsql;
COMMENT ON PROCEDURE MDD.RetirerGroupe
    IS 'Retire le groupe de cours spécifié pour le sigle et le trimestre spécifiés.';
CREATE OR REPLACE PROCEDURE MDD.ModifierGroupe(
    IN p_numero_groupe "MDD".nogroupe,
    IN p_sigle "MDD".sigle,
    IN p_trimestre "MDD".trimestre
)
AS $$
BEGIN
    UPDATE "MDD".groupe
    SET nogroupe = p_numero_groupe
    WHERE nogroupe = p_numero_groupe AND sigle = p_sigle AND trimestre = p_trimestre;
END;
$$ LANGUAGE plpgsql;
COMMENT ON PROCEDURE MDD.ModifierGroupe
    IS 'Modifie les détails du groupe de cours spécifié pour le sigle et le trimestre spécifiés.';
