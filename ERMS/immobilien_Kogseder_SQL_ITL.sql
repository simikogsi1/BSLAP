/*S.Kogseder 
3aAPC 28.02.2022*/

-- 1)
use immobilien;
select count(*) as Anzahl from objekt
inner join objekt o on o.objekt_id = o.objekt_id
inner join find_objekt fo on fo.objekt_typ_obj_id = fo.objekt_typ_obj_id;


-- 2)
use immobilien;
select count(obj_name) from objekt_typ;

-- 3)
use immobilien;
select objekt_wohnfleache, objekt_gartenflaeche, objekt_kellerfläche, objekt_gesamtfläche from objekt
where objekt_id = 1;

-- 4)
use immobilien;
select objekt_id, raum_typ from raum, objekt
inner join raum r on r.raum_typ=r.raum_typ
inner join objekt o on o.objekt_id = o.objekt_id
where o.objekt_id = 1;

-- 5)
use immobilien;
select count(typ_id) as Kauf_Typ from kauf_typ
where typ_id like 'M%';

-- 6)
use immobilien;
select objekt_baujahr as Baujahr from objekt
order by objekt_baujahr ASC;

-- 7)
use immobilien;
select objekt_nutzung, objekt_gesamtfläche from objekt 
where objekt_gesamtfläche > 899
and objekt_nutzung > 100
order by objekt_nutzung,objekt_gesamtfläche DESC;

-- 8)
use immobilien;
select * from objekt
where objekt_wohnfleache > 500
and objekt_baujahr > 2006
order by objekt_strasse, objekt_kellerfläche, objekt_gartenflaeche ASC;