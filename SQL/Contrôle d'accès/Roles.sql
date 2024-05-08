-- création de rôles en fonction des politiques de contrôle d'accès définies

-- Rôles de consultation


-- TODO : rôle de consultation des données personnelles du dossier étudiant
create role "student_data_consult";
comment on role "student_data_consult" is
    $$
        rôle de consultation des données personnelles du dossier étudiant
    $$ ;
-- TODO : rôle de consultation des données relatives à l'évaluation pédagogique
create role "ped_eval_consult";
comment on role "ped_eval_consult" is
    $$
        rôle de consultation des données relatives à l'évaluation pédagogique
    $$;
-- TODO : rôle de consultation des données personnelles du dossier professoral

create role "prof_data_consult";
comment on role "prof_data_consult" is $$
    rôle de consultation des données personnelles du dossier professoral
    $$;

-- TODO : rôle de consultation des données relatives à l'affectation professorale
create role "prof_aff_consult";
comment on role "prof_aff_consult" is $$
    rôle de consultation des données relatives à l'affectation professorale
    $$;

-- TODO : rôle de consultation des données relatives à l'offre de service (cours, modules, etc.)
create role "serv_off_consult";
comment on role "serv_off_consult" is $$
    rôle de consultation des données relatives à l'offre de service (cours, modules, etc.)
    $$;

-- Rôles de modification

-- TODO: rôle de modification des données personnelles du dossier étudiant
create role "student_data_modif";
comment on role "student_data_modif" is $$
    rôle de modification des données personnelles du dossier étudiant
    $$;
-- TODO: rôle de modification des données relatives à l'évaluation pédagogique
create role "ped_eval_modif";
comment on role "ped_eval_modif" is $$
    rôle de modification des données relatives à l'évaluation pédagogique
    $$;
-- TODO: rôle de modification des données personnelles du dossier professoral
create role "prof_data_modif";
comment on role "prof_data_modif" is $$
    rôle de modification des données personnelles du dossier professoral
    $$;
-- TODO: rôle de modification des données relatives à l'affectation professorale
create role "prof_aff_modif";
comment on role "prof_aff_modif" is $$
    rôle de modification des données relatives à l'affectation professorale
    $$;
-- TODO: rôle de modification des données relatives à l'offre de service (cours, modules, etc.)
create role "serv_off_modif";
comment on role "serv_off_modif" is $$
    rôle de modification des données relatives à l'offre de service (cours, modules, etc.)
    $$;

-- rôles de plein accès

-- TODO: rôle de plein accès aux données personnelles du dossier étudiant
create role "student_data_full_access";
comment on role "student_data_full_access" is $$
    rôle de plein accès aux données personnelles du dossier étudiant
    $$;

-- TODO: rôle de plein accès aux données relatives à l'évaluation pédagogique
create role "ped_eval_full_access";
comment on role "ped_eval_full_access" is $$
    rôle de plein accès aux données relatives à l'évaluation pédagogique
    $$;
-- TODO: rôle de plein accès aux données personnelles du dossier professoral
create role "prof_data_full_access";
comment on role "prof_data_full_access" is $$
    rôle de plein accès aux données personnelles du dossier professoral
    $$;
-- TODO: rôle de plein accès aux données relatives à l'affectation professorale
create role "prof_aff_full_access";
comment on role "prof_aff_full_access" is $$
    rôle de plein accès aux données relatives à l'affectation professorale
    $$;
-- TODO: rôle de plein accès aux données relatives à l'offre de service (cours, modules, etc.)
create role "serv_off_full_access";
comment on role "serv_off_full_access" is $$
    rôle de plein accès aux données relatives à l'offre de service (cours, modules, etc.)
    $$;


--===================================================



