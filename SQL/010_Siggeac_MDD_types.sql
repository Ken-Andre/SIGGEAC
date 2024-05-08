set search_path to 'MDD' ;

create function Bureau_dom (t Text) returns Boolean
  immutable
  return t similar to '[A-Z][0-9]{1,2}-[0-9]{4}(-[0-9]{2})?' ;
create domain Bureau
  Text
  check (Bureau_dom(value)) ;

create function Cause_dom (t Text) returns Boolean
  immutable
  return true ;
create domain Cause
  Text
  check (Cause_dom(value)) ;

create function CDC_dom (i SmallInt) returns Boolean
  immutable
  return i between 1 and 90 ;
create domain CDC
  SmallInt
  check (CDC_dom(value)) ;

create function MatriculeE_dom (t Text) returns Boolean
  immutable
  return t similar to '[a-z]{4}[0-9]{4}' ;
create domain MatriculeE
  Text
  check (MatriculeE_dom(value)) ;

create function MatriculeP_dom (t Text) returns Boolean
  immutable
  return t similar to '[a-z]{4}[0-9]{4}' ;
create domain MatriculeP
  Text
  check (MatriculeP_dom(value)) ;

create function NoGroupe_dom (t Text) returns Boolean
  immutable
  return t similar to '[0-9]{2}' ;
create domain NoGroupe
  Text
  check (NoGroupe_dom(value)) ;

create function Nom_dom (t Text) returns Boolean
  immutable
  return length(t) <= 120 and t similar to '[[:alpha:]]+([-’ [:alpha:]])*[[:alpha:]]+' ;
create domain Nom
  Text
  check (Nom_dom(value));

create function Note_dom (i SmallInt) returns Boolean
  immutable
  return i between 1 and 100 ;
create domain Note
  SmallInt
  check (Note_dom(value)) ;

create function Sigle_dom (t Text) returns Boolean
  immutable
  return t similar to '[A-Z]{3}[0-9]{3}' ;
create domain Sigle
  Text
  check (Sigle_dom(value)) ;

create function Titre_dom (t Text) returns Boolean
  immutable
  return true ;
create domain Titre
  Text
  check (Titre_dom(value)) ;

create function Trimestre_dom (t Text) returns Boolean
  immutable
  return t similar to '[0-9]{4}-[1-3]' ;
create domain Trimestre
  Text
  check (Trimestre_dom(value)) ;