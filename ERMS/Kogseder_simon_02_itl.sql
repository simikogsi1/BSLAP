/* S.Kogseder 16.02.2022 3aAPC*/
use business;
show tables; 

-- a)
use business;
select * from producer;

-- b)
use business;
describe producer;

-- c)
use business;
show create table ARTICLE_PRODUCER;

-- d)
use business;
select * from producer order by  pro_name;

-- e, i)
use business;
select art_name as Artikel, pro_name as Herstellerbezeichnung from article
inner join article_producer ap ON ap.art_id=article.art_id
inner join producer p ON p.pro_id=ap.pro_id
order by 2,1;


-- e, ii)
use business;
select art_name as Artikel, pro_name as Herstellerbezeichnung from article
natural join article_producer
natural join producer
order by 2,1;

-- e, iii)
use business;
select art_name as Artikel, pro_name as Herstellerbezeichnung from article, producer, article_producer
where article.art_id=article_producer.art_id and producer.pro_id=article_producer.pro_id;

-- f,)
use business;
select pro_name as Hersteller , art_name as Artikel, art_price as Preis from article
inner join article_producer ap ON ap.art_id=article.art_id
inner join producer p on p.pro_id=ap.pro_id
order by 1;

-- g)
use business;
select pro_name as Hersteller , art_name as Artikel, art_price as Preis from article
left join article_producer ap ON ap.art_id=article.art_id
left join producer p on p.pro_id=ap.pro_id
where ap.art_id = 3
order by 1; 

-- h)
use business;
select art_name as Artikel, pro_name as Herstellerbezeichnung from article a
left join article_producer ap on  ap.art_id=a.art_id
left join producer p on p.pro_id=ap.pro_id
order by Herstellerbezeichnung desc ,Artikel;

-- i)
use business;
select pro_name as Herstellerbezeichnung, count(*) from article_producer ap
left join article a on a.art_id=ap.art_id
left join producer p on p.pro_id=ap.pro_id
group by Herstellerbezeichnung;

-- j)
use business;
select pro_name as Hersteller, count(*)  from producer p
left join article_producer ap on p.pro_id=ap.pro_id
group by Hersteller
order by 1;

-- k)
use business;
select distinct (pro_name) as Producer from article_producer ap
left join producer p on p.pro_id=ap.pro_id
group by 1;

-- l)
use business;
select count(*) as "Anzahl" from article;

-- m) 
use business;
select pro_name as "Hersteller ohne artikel" from producer p
left join article_producer ap on ap.pro_id=p.pro_id
where ap.art_id is null;

-- n)
use business;
select pro_name as Hersteller, count(*)  from producer p
left join article_producer ap on p.pro_id=ap.pro_id
group by Hersteller
where count(*) > 1;