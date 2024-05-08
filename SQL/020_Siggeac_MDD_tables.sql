
set search_path to 'MDD' ;

create table Etudiant
(
  matriculeE MatriculeE not null,
  nom Nom not null,
  ddn Date not null,
  --  df matriculeE -> nom
  --  df matriculeE -> ddn
  constraint Etudiant_cc0 primary key (matriculeE)
) ;
comment on table Etudiant is
  'La personne étudiante (identifiée par le matricule "matriculeE") possède un dossier à l’Université. '
  'Son nom est "nom". '
  'Sa date de naissance est "ddn". '
;

create table Professeur
(
  matriculeP MatriculeP not null,
  nom Nom not null,
  --  df matriculeP -> nom
  constraint Professeur_cc0 primary key (matriculeP)
) ;
comment on table Professeur is
  'La personne enseignante (identifiée par le matricule "matriculeP") possède un dossier à l’Université. '
  'Une personne enseignante est une professeure, un professeur, une chargée de cours ou un chargé de cours. '
  'Son nom est "nom". '
;

create table Professeur_Bureau_PRE
(
  matriculeP MatriculeP not null,
  bureau Bureau not null,
  --  df matriculeP -> bureau
  constraint Professeur_Bureau_PRE_cc0 primary key (matriculeP),
  constraint Professeur_Bureau_PRE_cr0 foreign key (matriculeP) references Professeur
);
comment on table Professeur_Bureau_PRE is
  'La personne enseignante (identifiée par le matricule "matriculeP") a un bureau '
  'et ce bureau est le "bureau". '
;

create table Professeur_Bureau_ABS
(
  matriculeP MatriculeP not null,
  cause Cause not null,
  --  df matriculeP -> cause
  constraint Professeur_Bureau_ABS_cc0 primary key (matriculeP),
  constraint Professeur_Bureau_ABS_cr1 foreign key (matriculeP) references Professeur
) ;
comment on table Professeur_Bureau_ABS is
  'La personne enseignante (identifiée par le matricule "matriculeP") n’a pas de bureau '
  'pour la raison "cause". '
;

create table Cours
(
  sigle Sigle not null,
  titre Titre not null,
  credit CDC not null,
  --  df sigle -> titre
  --  df sigle -> crédit
  constraint Cours_cc0 primary key (sigle)
) ;
comment on table Cours is
  'Le cours (identifié par le sigle "sigle") est défini dans le répertoire des cours offerts par l’Université. '
  'Il a pour titre "titre". '
  'Il comporte "credit" crédit(s). '
;

create table Trimestre_Cours
(
    id_trimestre integer not null,
    trimestre Trimestre not null,

    constraint Trimestre_pk primary key (id_trimestre)
);
comment on table Trimestre_Cours is 'Les différents trimestres pris en charge par l"école';


create table Groupe
(
  sigle Sigle not null,
  trimestre integer not null,
  noGroupe NoGroupe not null,
  constraint Groupe_cc0 primary key (sigle, trimestre, noGroupe),
  constraint Groupe_cr0 foreign key (sigle) references Cours,
    constraint Groupe_cr1 foreign key (trimestre) references Trimestre_Cours
) ;
comment on table Groupe is
  'Le groupe (identifié par le sigle "sigle", le numéro "noGroupe" et le trimestre "trimestre") est constitué. '
;

create table Affectation
  -- Correspond à l’offre effective.
(
  sigle Sigle,
  trimestre integer not null,
  noGroupe NoGroupe not null,
  matriculeP MatriculeP not null,
  -- Pour permettre à un groupe de professeur d’assurer la formation, il faudrait
  -- ajouter matriculeP à la clé candidate.
  constraint Affectation_cc0 primary key (sigle, trimestre, noGroupe),
  constraint Affectation_cr0 foreign key (sigle, trimestre, noGroupe) references Groupe,
  constraint Affectation_cr1 foreign key (matriculeP) references Professeur
) ;
comment on table Affectation is
  'La personne enseignante (identifiée par "matriculeP") assure la formation du '
  'groupe identifié par les  sigle "sigle", le numéro "noGroupe" et le trimestre "trimestre". '
;

create table Inscription
(
  matriculeE MatriculeE not null,
  sigle Sigle not null,
  trimestre integer not null,
  noGroupe NoGroupe not null,
  constraint Inscription_cc0 primary key (matriculeE, sigle, trimestre, noGroupe),
  constraint Inscription_cr0 foreign key (sigle, trimestre, noGroupe) references Groupe
) ;
comment on table Inscription is
  'La personne étudiante (identifiée par "matriculeE") est inscrite au '
  'groupe identifié par le sigle "sigle", le numéro "noGroupe" et le trimestre "trimestre".'
;

create table Evaluation
(
  matriculeE MatriculeE not null,
  sigle Sigle not null,
  trimestre integer not null,
  noGroupe NoGroupe not null,
  note Note not null,
  --  df sigle, trimestre, noGroupe, matriculeE -> note
  constraint Evaluation_cc0 primary key (matriculeE, sigle, trimestre, noGroupe),
  constraint Evaluation_cr0 foreign key (matriculeE, sigle, trimestre, noGroupe) references Inscription
) ;
comment on table Evaluation is
  'La personne étudiante (identifiée par "matriculeE") inscrite au '
  'groupe identifié par sigle "sigle", le numéro "noGroupe" et le trimestre "trimestre" '
  'a obtenu la note "note". '
;

create table Prealable
(
  sigle Sigle not null,
  siglePrealable Sigle not null,
  constraint Prealable_cc0 primary key (sigle, siglePrealable),
  constraint Prealable_cr0 foreign key (sigle) references Cours,
  constraint Prealable_cr1 foreign key (siglePrealable) references Cours (sigle)
) ;
comment on table Prealable is
  'L’inscription au cours "sigle" n’est autorisée qu’aux personnes '
  'qui auront réussi le cours "siglePréalable" avant le début du cours "sigle". '
;

create table Offre
  -- Correspond à l’offre planifiée.
(
  sigle Sigle not null,
  trimestre integer not null,
  constraint Offre_cc0 primary key (sigle, trimestre),
  constraint Offre_cr0 foreign key (sigle) references Cours,
    constraint Offre_cr1 foreign key (trimestre) references Trimestre_Cours
) ;
comment on table Offre is
  'l’Université s’engage à offrir le cours "sigle" au trimestre "trimestre". '
;

create table Competence
(
  sigle Sigle not null,
  matriculeP MatriculeP not null,
  constraint Competence_cc0 primary key (sigle, matriculeP),
  constraint Competence_cr0 foreign key (sigle) references Cours,
  constraint Competence_cr1 foreign key (matriculeP) references Professeur
) ;
comment on table Competence is
  'La personne enseignante (identifiée par "matriculeP") a la compétence requise '
  'pour assure le cours (identifié par le sigle "sigle"). '
;

create table Disponibilite
(
  trimestre integer,
  matriculeP MatriculeP,
  constraint Disponibilite_cc0 primary key (trimestre, matriculeP),

    -- Pourquoi une référence à la table cours pour le trimestre???

  constraint Disponibilite_cr0 foreign key (trimestre) references Trimestre_Cours,
  constraint Disponibilite_cr1 foreign key (matriculeP) references Professeur
) ;
comment on table Disponibilite is
  'La personne enseignante (identifiée par "matriculeP") est disponible '
  'pour enseigner durant le trimestre "trimestre". '
;

/*
inv Affectation_comp
  pred « Affectation est conforme à Compétence. »
  Affectation 𝞹 {sigle, matriculeP} ⊆ Compétence

TODO 2021-03-19 : À rendre plus efficient.
  La mise en oeuvre qui suit, bien qu’exacte, n’est généralement pas très performante
  faute d’optimisation adéquate du compilateur. L’élaboration d’une version plus
  performante est laissée en exercice.
*/
create or replace function Affectation_comp_DECL()
  returns trigger
  language 'plpgsql'
as
$$
begin
  if
    exists (select sigle, matriculeP from Affectation except select sigle, matriculeP from Competence)
  then
    raise exception
      'Affectation_comp_DECL : '
      'Affectation non conforme à la compétence. ' ;
  end if;
  return new;
end;
$$;

create /* constraint */ trigger Affectation_comp_AUTO
  after insert
     or delete
     or update
  on Affectation
  for each statement
  execute function Affectation_comp_DECL();

create /* constraint */ trigger Competence_aff_AUTO
  after insert
     or delete
     or update
  on Competence
  for each statement
  execute function Affectation_comp_DECL();
