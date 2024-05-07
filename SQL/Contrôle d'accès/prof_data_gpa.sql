-- Definir les privilèges pour les rôle relatifs aux données personnels des enseignants

-- TODO: privilèges de consultation des données à prof_data_consult

-- Modification
GRANT EXECUTE ON PROCEDURE "IMM_Professeur".ModifierProfesseur() to prof_data_modif;

-- plein accès
GRANT EXECUTE ON ALL PROCEDURES IN SCHEMA "IMM_Professeur" to prof_data_full_access;