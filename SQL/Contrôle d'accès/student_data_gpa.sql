-- Definir les privilèges pour les rôle relatifs aux données personnels des étudiants

-- TODO: privilège de consultation sur student_data_consult

-- Modification
GRANT EXECUTE ON PROCEDURE "IMM_Etudiant".ModifierEtudiant("MDD".matriculee, "MDD".nom, date) to "student_data_modif";

-- plein accès

GRANT EXECUTE ON ALL PROCEDURES IN SCHEMA "IMM_Etudiant" to "student_data_full_access";


