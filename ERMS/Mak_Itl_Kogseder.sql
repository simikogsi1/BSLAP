-- MAK S.Kogseder 13.04.2021
-- INF N
drop database if exists integrität; 

use hardware; 

-- 1)
select concat_ws(' ', zus_name, arhe_name) as "Artikel"
from artikelart_hersteller
natural join zusatz;
-- 2)
select her_name1 as "her_name1", her_name2 as "her_name2" from hersteller 
where her_name1 like '%.%' or her_name1 like '%.%*';

-- 3 a)
select concat_ws(' ', her_name1, her_name2 ) as "Hersteller",
art_name as "Artikelart",
concat_ws(' ', zus_name, arhe_name) as "Zusatz+Artikel"
from hersteller h, artikelart a, artikelart_hersteller ah, zusatz z
where h.her_id = ah.her_id
and a.art_id = ah.art_id
and z.zus_id = ah.zus_id
order by 1,2,3;
-- b)
select concat_ws(' ', her_name1, her_name2 ) as "Hersteller",
art_name as "Artikelart",
concat_ws(' ', zus_name, arhe_name) as "Zusatz+Artikel"
from artikelart_hersteller
natural join(hersteller, artikelart, zusatz)
order by 1,2,3;
-- 4)
select her_name1 as "Hersteller",
art_name as "Artikelart",
count(*) as "Anzahl der Artikel"
from artikelart_hersteller
natural join (artikelart, hersteller)
group by her_name2, art_name;

-- 5) muss nicht gemacht werden

-- 6)
show tables;

