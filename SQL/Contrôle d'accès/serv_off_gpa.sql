-- définir les privilèges des rôles relatifs aux données d'offre de services

-- TODO : privilèges de consultation à serv_off_consult
GRANT EXECUTE ON PROCEDURE "IMM_Struct".ListerCours() to serv_off_consult;

-- TODO : privilèges de modification à serv_off_modif

GRANT EXECUTE ON PROCEDURE "IMM_Struct".modifiercours("MDD".sigle, "MDD".titre, "MDD".cdc) to serv_off_modif;

GRANT EXECUTE ON PROCEDURE "IMM_Struct".ModifierOffre("MDD".sigle, integer, "MDD".sigle, integer) to serv_off_modif;

GRANT EXECUTE ON PROCEDURE "IMM_Struct".modifiergroupe("MDD".nogroupe, "MDD".sigle, integer) to serv_off_modif;

-- TODO : privilèges de plein accès à serv_off_full_access

GRANT EXECUTE ON ALL PROCEDURES IN SCHEMA "IMM_Struct" TO serv_off_full_access;
