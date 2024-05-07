set search_path to 'MDD';

-- Etudiant
INSERT INTO Etudiant (matriculeE, nom, ddn)
VALUES
  ('atba1234', 'Alice Tremblay', '1990-01-01'),
  ('bvll5678', 'Bob Villeneuve', '1991-02-02'),
  ('chdb9012', 'Charlie Dubois', '1992-03-03'),
  ('dleg2345', 'David Léger', '1993-04-04'),
  ('evmo6789', 'Eve Morin', '1994-05-05'),
  ('frga0123', 'Francis Gauthier', '1995-06-06'),
  ('gbra3456', 'Gabrielle Richard', '1996-07-07'),
  ('hepc7890', 'Henri Picard', '1997-08-08'),
  ('isar5678', 'Isabelle Roy', '1998-09-09'),
  ('jaty9012', 'Jacob Tremblay', '1999-10-10');

-- Professeur
INSERT INTO Professeur (matriculeP, nom)
VALUES
  ('mnop1234', 'Professeur Tremblay'),  -- MatriculeP follows the pattern
  ('qrst5678', 'Professeur Villeneuve'),
  ('uvwx9012', 'Professeur Dubois'),
  ('wxzy3456', 'Professeur Léger'),
  ('abce7890', 'Professeur Morin'),
  ('fghi1234', 'Professeur Gauthier'),
  ('jklm5678', 'Professeur Richard'),
  ('mnop9012', 'Professeur Picard'),
  ('qrst3456', 'Professeur Roy'),
  ('uvwx7890', 'Professeur Tremblay');

-- Professeur_Bureau_PRE
INSERT INTO Professeur_Bureau_PRE (matriculeP, bureau)
VALUES
  ('mnop9012', 'A12-4567-12'),
  ('qrst3456', 'B23-5678'),
  ('uvwx7890', 'C34-6789');

-- Professeur_Bureau_ABS
INSERT INTO Professeur_Bureau_ABS (matriculeP, cause)
VALUES
  ('mnop9012', 'Congé de maladie'),
  ('qrst3456', 'Sabbatical');

-- Cours
INSERT INTO Cours (sigle, titre, credit)
VALUES
  ('LOG101', 'Introduction à la logique', 3),
  ('INF212', 'Structures de données', 4),
  ('MAT345', 'Algèbre linéaire', 3);


--Trimestres
    INSERT INTO trimestre_cours (id_trimestre, trimestre)
    VALUES
        (1,'2024-1'),
        (2,'2024-2'),
        (3,'2024-3');

-- Groupe
INSERT INTO Groupe (sigle, trimestre, noGroupe)
VALUES
  ('LOG101', '1', '01'),
  ('LOG101', '2', '02'),
  ('INF212', '1', '01'),
  ('INF212', '2', '02'),
  ('MAT345', '2', '01'),
  ('MAT345', '3', '02');


-- Competence (Assuming professors have competence for specific courses)
INSERT INTO Competence (sigle, matriculeP)
VALUES
  ('LOG101', 'mnop1234'),
  ('LOG101', 'qrst5678'),
  ('INF212', 'uvwx9012'),
  ('INF212', 'wxzy3456'),
  ('MAT345', 'abce7890');

-- Affectation (Assuming professors have appropriate competence for assigned courses)
INSERT INTO Affectation (sigle, trimestre, noGroupe, matriculeP)
VALUES
  ('LOG101', '1', '01', 'mnop1234'),
  ('LOG101', '2', '02', 'qrst5678'),
  ('INF212', '1', '01', 'uvwx9012'),
  ('INF212', '2', '02', 'wxzy3456'),
  ('MAT345', '2', '01', 'abce7890');

-- Inscription (Assuming some students are enrolled in some groups)
INSERT INTO Inscription (matriculeE, sigle, trimestre, noGroupe)
VALUES
  ('atba1234', 'LOG101', '1', '01'),
  ('bvll5678', 'LOG101', '1', '01'),
  ('chdb9012', 'INF212', '1', '01'),
  ('dleg2345', 'INF212', '2', '02'),
  ('evmo6789', 'MAT345', '2', '01'),
  ('frga0123', 'MAT345', '2', '01'),
  ('gbra3456', 'LOG101', '2', '02'),
  ('hepc7890', 'INF212', '2', '02'),
  ('isar5678', 'MAT345', '3', '02');

-- Evaluation (Assuming some grades are assigned)
INSERT INTO Evaluation (matriculeE, sigle, trimestre, noGroupe, note)
VALUES
  ('atba1234', 'LOG101', '1', '01', 85),
  ('bvll5678', 'LOG101', '1', '01', 78),
  ('chdb9012', 'INF212', '1', '01', 92),
  ('dleg2345', 'INF212', '2', '02', 65);

-- Prealable (Assuming some course prerequisites)
INSERT INTO Prealable (sigle, siglePrealable)
VALUES
  ('INF212', 'LOG101'),
  ('MAT345', 'INF212');

-- Offre (Assuming some courses are offered in specific semesters)
INSERT INTO Offre (sigle, trimestre)
VALUES
  ('LOG101', '1'),
  ('LOG101', '2'),
  ('INF212', '1'),
  ('INF212', '2'),
  ('MAT345', '2'),
  ('MAT345', '3');


-- Disponibilite (Assuming professors are available in specific semesters)
INSERT INTO Disponibilite (trimestre, matriculeP)
VALUES
  ('1', 'mnop1234'),
  ('2', 'qrst5678'),
  ('1', 'uvwx9012'),
  ('2', 'wxzy3456'),
  ('2', 'abce7890');

