-- Création du Schéma de définition des données de la base de données SIGGEAC

drop schema if exists "MDD" cascade;
create schema "MDD";

-- Création du schéma de l'interface relative aux données étudiantes

drop schema if exists "IMM_Etudiant" cascade;
create schema "IMM_Etudiant";

-- Création du schéma de l'interface relative aux données professorales

drop schema if exists "IMM_Professeur" cascade;
create schema "IMM_Professeur";

-- Création du schéma de l'interface relative à l'offre de service et aux données structurelles

drop schema if exists "IMM_Struct" cascade;
create schema "IMM_Struct";



