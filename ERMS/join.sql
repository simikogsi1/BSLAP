use adresse;

show tables;

select * from strasse;


select plz_nr as "PLZ", 
ort_name as "Ort",
str_name as "Strasse"
from strasse_ort_plz natural join ort_plz natural join strasse natural join ort natural join plz;

select 
concat(per_vname,' ',per_nname) as "Person",
plz_nr as "PLZ", 
ort_name as "Ort",
str_name as "Strasse"
from strasse_ort_plz natural join ort_plz natural join strasse natural join ort natural join plz
natural join person_strasse_ort_plz natural join person;

select orpl_id, plz_nr as "PLZ", ort_name as "ort"
    from ort_plz natural join (ort, plz)
    order by Ort;