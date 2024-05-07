-- Création des rôles pour les opérations applicatives
CREATE ROLE consultation;
CREATE ROLE modification;
CREATE ROLE plein_acces;

-- Création des rôles pour les usagers
CREATE ROLE donnees_personnelles_etudiant;
CREATE ROLE evaluation_pedagogique;
CREATE ROLE donnees_personnelles_professeur;
CREATE ROLE affectation_professeur;
CREATE ROLE offre_service;

-- Attribution des permissions pour les rôles applicatifs
GRANT SELECT ON ALL TABLES IN SCHEMA public TO consultation;
GRANT UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO modification;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO plein_acces;

-- Attribution des permissions pour les rôles usagers
GRANT SELECT ON "MDD".etudiant TO donnees_personnelles_etudiant;
GRANT SELECT, INSERT, UPDATE, DELETE ON "MDD".evaluation TO evaluation_pedagogique;
GRANT SELECT ON "MDD".professeur TO donnees_personnelles_professeur;
GRANT SELECT, INSERT, UPDATE, DELETE ON "MDD".affectation TO affectation_professeur;
GRANT SELECT, INSERT, UPDATE, DELETE ON "MDD".offre TO offre_service;
