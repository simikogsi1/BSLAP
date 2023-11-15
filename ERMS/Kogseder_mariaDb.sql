/*Kogseder Simon 22.05.2023
ITL 1
4a APC
*/

-- Anzeige aller Schemas in My SQL --
show databases;

-- Verwendung der Datenbank kurs --
use kurs;

-- Anzeige aller Tabels in der Datenbank kurs -- 
show tables;

-- a Geben Sie alle Kursteilnehmer eines bestimmten Kurses aus. Nachname | Vorname)
SELECT p.per_vname as 'Vorname', p.per_nname as 'Nachname', k.kur_bezeichnung as 'Kurs'
FROM person p, buchung b, kurstermin kt, kurs k
WHERE p.per_id = b.per_id
AND b.kute_id = kt.kute_id
AND kt.kur_id = k.kur_id
AND k.kur_bezeichnung = 'PHP 5'; -- Hier wird der Kursteilnehmer mit dem Kurs C# herausgefiltert


-- b)
SELECT k.kur_bezeichnung as 'Kurs', COUNT(b.per_id) as 'Teilnehmer'
FROM kurs.kurs k
LEFT JOIN kurs.kurstermin kt ON k.kur_id = kt.kur_id
LEFT JOIN kurs.buchung b ON kt.kute_id = b.kute_id
GROUP BY k.kur_id, k.kur_bezeichnung
HAVING COUNT(b.per_id) > 0
ORDER BY k.kur_bezeichnung;

-- b 2)
SELECT k.kur_bezeichnung as 'Kurs',DATE_FORMAT(kt.kute_start, '%d.%m.%Y') as 'Termin', COUNT(b.per_id) as 'Anzahl der Teilnehmer'
FROM kurs.kurs k
LEFT JOIN kurs.kurstermin kt ON k.kur_id = kt.kur_id
LEFT JOIN kurs.buchung b ON kt.kute_id = b.kute_id
GROUP BY kt.kute_start
HAVING COUNT(b.per_id) > 0 
order by k.kur_bezeichnung;

-- c)
SELECT CONCAT(p.per_vname, ' ', p.per_nname) as 'Kursleiter',
k.kur_bezeichnung as 'Kurs',
DATE_FORMAT(kt.kute_start, '%d.%m.%Y') as 'Beginn'
FROM kurs k natural join kurstermin kt join person p on kt.vortragender_per_id = p.per_id
order by kt.kute_start DESC;

-- d)
SELECT COUNT(*) AS 'Anzahl Personen ohne Kursbeteiligung'
FROM kurs.person p
LEFT JOIN kurs.buchung b ON p.per_id = b.per_id
WHERE b.per_id IS NULL;

-- e) 
-- leer --


-- f)
SELECT k.kur_bezeichnung AS 'Kursbezeichnung', kp.kupr_wert AS 'Preis'
FROM kurs k natural join kurspreis kp
WHERE kupr_wert > 150 
AND kupr_wert < 2000;

-- g)
SELECT per_vname as 'Vorname', per_nname as 'Nachname'
FROM person 
where per_vname LIKE '_a%'
and  per_nname LIKE '_a%';

-- h)
SELECT per_vname as 'Vorname', per_nname as 'Nachname'
FROM person 
where per_vname LIKE '%a'
and  per_nname LIKE 'W%';

-- i)
SELECT k.kur_bezeichnung AS "Kurs",
kp.kupr_wert AS "Kurspreis",
kp.kupr_bis AS "gültig bis"
FROM kurspreis kp NATURAL JOIN kurs k
WHERE k.kur_bezeichnung = "PHP 5"
ORDER by kp.kur_id, kp.kupr_bis;

-- j)
Select p.per_nname as "Nachname",
p.per_vname as "Vorname",
p.per_geschlecht as "Geschlecht"
FROM person p
ORDER BY p.per_nname ASC, p.per_vname DESC, p.per_geschlecht;

-- k) 
SELECT k.kur_bezeichnung AS 'Kursbezeichnung', kt.kute_start
FROM kurs k NATURAL JOIN kurstermin kt
Where kt.kute_start 
BETWEEN '2020-01-01' AND '2021-12-31';



