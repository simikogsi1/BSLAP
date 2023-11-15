/*
S. Kogseder 06.06.23
Übung zu Trigger
Schema Adresse
*/

/*
Ziel: wenn ein neuer DS in Tabelle adresse.ort eingefügt wird, soll ein Trigger Event
starten (geworfen werden). Dabei wird in einem eigenen Schema in einer Tabelle folgendes eingefügt:
Zeitpunkt, Benutzer und ort_id (des Inserts)
Tigger: Schema: adresse_trigger; Tabelle: afer_insert_ort
*/

create schema adresse_trigger;
use adresse_trigger;
create table after_insert_ort (aio_id int primary key auto_increment, aio_zeit datetime default now(), -- now nur in MariaDB
aio_user varchar(255) default user(),
aio_ort_id int not null);

use adresse;
drop trigger if exists after_insert_ort;

create trigger after_insert_ort after insert on ort for each row
insert into adresse_tigger.after_insert_ort (aio_ort_id)
value(new.ort_id);

/*
new. auf den neuen Wert zugreifen
old. auf den *alten* Wert (vor Änderung) zugreifen
*/
insert into ort (ort_name) values("Zwettel");
select * from adresse_trigger.after_insert_ort;
select * from ort;
