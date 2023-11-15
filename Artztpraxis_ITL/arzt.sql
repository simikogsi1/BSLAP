use artztpraxis;
show tables;
      
SELECT CONCAT(tz.ter_beginn, ' - ', tz.ter_ende) AS Zeitraum,
       CONCAT(p.per_vname, ' ', p.per_nname) AS Patient,
       CONCAT(p.per_svnr, '/', p.per_geburt) AS `SvNr - Gb-Datum`,
       dia_name as Diagnose
FROM behandlungszeitraum tz
JOIN person p ON tz.per_id = p.per_id
JOIN diagnose d ON tz.dia_id = d.dia_id
where p.per_svnr = '1234' AND p.per_geburt = '1970-10-05' AND tz.ter_beginn like '2020%' and tz.ter_ende like '2020%';
      

show tables;
      
select * from person;

select * from diagnose;
      
select * from behandlungszeitraum;
            


