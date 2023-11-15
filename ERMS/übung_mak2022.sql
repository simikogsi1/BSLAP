/*S. Kogseder 3aAPC
Übung MAK 17.02.2022*/
-- 1)
use bs2_mak;

-- 2)
use bs2_mak;
select scja_name as Schuljahr, count(*) from schuljahr, klasse
left join schuljahr_klasse sk on sk.scja_id=sk.scja_id
left join schueler sh on sh.sckl_id=sh.sckl_id
group by 1;

-- 3)
use bs2_mak;
select kla_name from klasse k
left join schuljahr_klasse sk on sk.kla_id=k.kla_id
where scja_id is null;

-- 4)
use bs2_mak;
select (per_vname,' ', per_nname) as Schueler, kla_name as Klasse from person, klasse
left join schueler s on s.per_id=s.per_id
left join SCHULJAHR_KLASSE sk on sk.scja_id=sk.scja_id
left join klasse k on k.kla_id=k.kla_id
where kla_name like '4aAPC';

-- 5)
use bs2_mak;
select concat(scja_name,' ', kla_name) as SJ from schuljahr, klasse
left join schueler s on s.sckl_id=s.sckl_id;

-- 6)
use bs2_mak;
select concat(per_vname,' ',per_nname) as Schueler from Person
where per_vname like 'Valerie' and per_nname like 'Wurz';


